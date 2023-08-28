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

lang_options <- list(
  list(key = "en", text = "English"),
  list(key = "pl", text = "Polish")
)

details_list_columns <- function(i18n) {
  tibble(
    fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
    name = c(i18n$t("Sales rep"), i18n$t("Close date"), i18n$t("Amount"), i18n$t("Client"), i18n$t("City"), i18n$t("Is closed?")),
    key = fieldName
  )
}

sass(sass_file("style.scss"), output = "www/style.css")

ui <- fluentPage(
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    usei18n(i18n)
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
    div(
      class = "main",
      router_ui(
        route("/", homePage(i18n)),
        route("other", analysisPage(i18n))
      )
    ),
    div(class = "footer", footer(i18n))
  )
)

server <- function(input, output, session) {
  router_server(root_page = "/")
  tr <- reactiveVal()

  observeEvent(input$language, {
    lang <- input$language
    update_lang(lang)
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
      DetailsList(items = filteredDeals(), columns = details_list_columns(i18n))
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
