library(shiny)
library(shiny.fluent)
library(shiny.router)
library(shiny.i18n)
library(sass)
library(leaflet)
library(ggplot2)
library(plotly)
library(glue)
library(dplyr)

i18n <- Translator$new(translation_csvs_path = "translation")
i18n$set_translation_language("en")

# Add shiny.router dependencies manually: they are not picked up because they're added in a non-standard way.
shiny::addResourcePath("shiny.router", system.file("www", package = "shiny.router"))
shiny_router_js_src <- file.path("shiny.router", "shiny.router.js")
shiny_router_script_tag <- shiny::tags$script(type = "text/javascript", src = shiny_router_js_src)

lang_options <- list(
  list(key = "en", text = "English"),
  list(key = "pl", text = "Polish")
)

details_list_columns <- function() {
  tibble(
    fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
    name = c(i18n$t("Sales rep"), i18n$t("Close date"), i18n$t("Amount"), i18n$t("Client"), i18n$t("City"), i18n$t("Is closed?")),
    key = fieldName
  )
}

router <- make_router(
  route("/", homePage(i18n)),
  route("other", analysisPage(i18n))
)

sass(sass_file("style.scss"), output = "www/style.css")

ui <- fluentPage(
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    shiny_router_script_tag,
    shiny.i18n::usei18n(i18n)
  ),
  div(
    class = "grid-container",
    div(class = "header", header(i18n)),
    div(
      class = "sidenav",
      tagList(
        navigation(i18n),
        Dropdown.shinyInput("language", options = lang_options, value = "en")
      )
    ),
    div(class = "main", router$ui),
    div(class = "footer", footer(i18n))
  )
)

server <- function(input, output, session) {
  router$server(input, output, session)
  tr <- reactiveVal()
  
  observeEvent(input$language, {
    lang <- input$language
    update_lang(session, lang)
    i18n$set_translation_language(lang)
    tr(i18n)
  })
  
  observe({
    req(tr())
    newOptions <- purrr::map(lang_options, ~ list(key = .x$key, text = tr()$t(.x$text)))
    updateDropdown.shinyInput(session = session, inputId = "language", options = newOptions)
    newFluentPeople <- fluentPeople %>%
      dplyr::mutate(secondaryText = tr()$t(secondaryText)) %>%
      purrr::transpose()
    updateNormalPeoplePicker.shinyInput(
      session = session,
      inputId = "selectedPeople",
      options = newFluentPeople
    )
  })

  filteredDeals <- reactive({
    req(input$fromDate)
    selectedPeople <- (
      if (length(input$selectedPeople) > 0) input$selectedPeople
      else fluentPeople$key
    )
    minClosedVal <- if (isTRUE(input$closedOnly)) 1 else 0

    filteredDeals <- fluentSalesDeals %>%
      filter(
        rep_id %in% selectedPeople,
        date >= input$fromDate,
        date <= input$toDate,
        deal_amount >= input$slider,
        is_closed >= minClosedVal
      ) %>%
      mutate(is_closed = ifelse(is_closed == 1, "Yes", "No"))
  })

  output$map <- renderLeaflet({
    points <- cbind(filteredDeals()$LONGITUDE, filteredDeals()$LATITUDE)
    leaflet() %>% addTiles() %>% addMarkers(data = points)
  })

  output$plot <- renderPlotly({
    p <- ggplot(filteredDeals(), aes(x = rep_name)) +
      geom_bar(fill = unique(filteredDeals()$color)) +
      ylab(i18n$t("Number of deals")) +
      xlab(i18n$t("Sales rep")) +
      theme_light()
    ggplotly(p, height = 300)
  })

  output$filteredSalesReps <- renderUI({
    items_list <- if(nrow(filteredDeals()) > 0){
      DetailsList(items = filteredDeals(), columns = details_list_columns())
    } else {
      p(i18n$t("No matching transactions."))
    }

    HorizontalStack(
      makeCard(i18n$t("Top results"), div(style="max-height: 500px; overflow: auto", items_list)),
      makeCard(i18n$t("Map"), leafletOutput("map"))
    )
  })
}

shinyApp(ui, server)
