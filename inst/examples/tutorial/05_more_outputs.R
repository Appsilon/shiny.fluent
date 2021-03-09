library(shiny)
library(shiny.fluent)
library(dplyr)
library(glue)
library(plotly)
library(leaflet)

makeCard <- function(title, content, size = 12, style = "") {
  div(
    class = glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
    style = style,
    Stack(
      tokens = list(childrenGap = 5),
      Text(variant = "large", title, block = TRUE),
      content
    )
  )
}

filters <- Stack(
  tokens = list(childrenGap = 10),
  Stack(
    tokens = list(childrenGap = 10), horizontal = TRUE,
    DatePicker("fromDate", value = as.Date('2020/01/01'), label = "From date"),
    DatePicker("toDate", value = as.Date('2020/12/31'), label = "To date")
  ),
  Label("Filter by sales reps"),
  NormalPeoplePicker("selectedPeople",
    options = fluent_people,
    pickerSuggestionsProps = list(
      suggestionsHeaderText = 'Matching people',
      mostRecentlyUsedHeaderText = 'Sales reps',
      noResultsFoundText = 'No results found',
      showRemoveButtons = TRUE
    )
  ),
  Slider("slider",
    value = 0, min = 0, max = 1000000, step = 100000,
    label = "Minimum amount",
    valueFormat = JS("function(x) { return '$' + x}"),
    snapToStep = TRUE
  ),
  Toggle("closedOnly", value = TRUE, label = "Include closed deals only?")
)

details_list_columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
  name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
  key = fieldName)

# ---- 05_ui
ui <- fluentPage(
  tags$style(".card { padding: 28px; margin-bottom: 28px; }"),
  withReact(
    Stack(
      tokens = list(childrenGap = 10), horizontal = TRUE,
      makeCard("Filters", filters, size = 4, style = "max-height: 320px"),
      makeCard("Deals count", plotlyOutput("plot"), size = 8, style = "max-height: 320px")
    ),
    uiOutput("analysis")
  )
)
# ----

server <- function(input, output, session) {
  filtered_deals <- reactive({
    if (!is.null(input$selectedPeople) && input$selectedPeople != "") {
      selectedPeopleKeys <- input$selectedPeople
    } else {
      selectedPeopleKeys <- list()
    }
    if (length(selectedPeopleKeys) == 0) {
      selectedPeopleKeys <- fluent_people$key
    }
    minClosedVal <- if (input$closedOnly == TRUE) 1 else 0

    filtered_deals <- fluent_sales_deals %>%
      filter(
        rep_id %in% selectedPeopleKeys,
        date >= input$fromDate,
        date <= input$toDate,
        deal_amount >= input$slider,
        is_closed >= minClosedVal
      ) %>%
      mutate(is_closed = ifelse(is_closed == 1, "Yes", "No"))
  })

# ---- 05_render
  output$map <- renderLeaflet({
    points <- cbind(filtered_deals()$LONGITUDE, filtered_deals()$LATITUDE)
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points)
  })

  output$plot <- renderPlotly({
    p <- ggplot(filtered_deals(), aes(x = rep_name)) +
      geom_bar(fill = unique(filtered_deals()$color)) +
      ylab("Number of deals") +
      xlab("Sales rep") +
      theme_light()
    ggplotly(p, height = 300)
  })
# ----

  output$analysis <- renderUI({
    items_list <- if(nrow(filtered_deals()) > 0){
      DetailsList(items = filtered_deals(), columns = details_list_columns)
    } else {
      p("No matching transactions.")
    }

# ---- 05_outputs
    withReact(
      Stack(
        tokens = list(childrenGap = 10), horizontal = TRUE,
        makeCard("Top results", div(style="max-height: 500px; overflow: auto", items_list)),
        makeCard("Map", leafletOutput("map"))
      )
    )
  })
# ----
}

shinyApp(ui, server)
