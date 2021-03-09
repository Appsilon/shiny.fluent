library(shiny)
library(shiny.fluent)
library(shiny.router)
library(sass)
library(leaflet)
library(RColorBrewer)
library(ggplot2)
library(plotly)
library(glue)
library(dplyr)

#shiny.react::enable_react_debug_mode()

source("layout.R")

#### HOME PAGE

card1 <- makeCard(
  "Welcome to shiny.fluent demo!",
  div(
    Text("shiny.fluent is a package that allows you to build Shiny apps using Microsoft's Fluent UI."),
    Text("Use the menu on the left to explore live demos of all available components.")
  ))

card2 <- makeCard(
  "shiny.react makes it easy to use React libraries in Shiny apps.",
  div(
    Text("To make a React library convenient to use from Shiny, we need to write an R package that wraps it - for example, a shiny.fluent package for Microsoft's Fluent UI, or shiny.blueprint for Palantir's Blueprint.js."),
    Text("Communication and other issues in integrating Shiny and React are solved and standardized in shiny.react package."),
    Text("shiny.react strives to do as much as possible automatically, but there's no free lunch here, so in all cases except trivial ones you'll need to do some amount of manual work. The more work you put into a wrapper package, the less work your users will have to do while using it.")
  ))

homePage <- makePage(
  "This is a Fluent UI app built in Shiny",
  "shiny.react + Fluent UI = shiny.fluent",
  div(card1, card2)
)


#### ANALYSIS PAGE

filters <- Stack(
  tokens = list(childrenGap = 10),
  HorizontalStack(
    DatePicker("fromDate", value = as.Date('2020/01/01'), label = "From date"),
    DatePicker("toDate", value = as.Date('2020/12/31'), label = "To date")
  ),
  Label("Filter by sales reps", className = "my_class"),
  NormalPeoplePicker(
    "selectedPeople",
    className = "my_class",
    options = fluent_people,
    pickerSuggestionsProps = list(
      suggestionsHeaderText = 'Matching people',
      mostRecentlyUsedHeaderText = 'Sales reps',
      noResultsFoundText = 'No results found',
      showRemoveButtons = TRUE
    )
  ),
  Slider("slider",
         0,
         min = 0,
         max = 1000000,
         label = "Minimum amount",
         step = 100000,
         valueFormat = JS("function(x) { return '$' + x}"),
         snapToStep = TRUE),
  Toggle("closedOnly", value = TRUE, label = "Include closed deals only?")
)

analysisPage <- makePage(
  "Sales representatives",
  "Best performing reps",
  div(
    HorizontalStack(
      makeCard("Filters", filters, size = 4, style = "max-height: 320px"),
      makeCard("Deals count", plotlyOutput("plot"), size = 8, style = "max-height: 320px")
    ),
    uiOutput("filteredSalesReps")
  )
)


#### MAIN UI AND ROUTER

router <- make_router(
  route("/", homePage),
  route("other", analysisPage))

sass(
  sass_file("style.scss"),
  output = "www/style.css"
)

ui <- fluentPage(
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    shiny_router_script_tag
  ),
  withReact(
    layout(router$ui)
  )
)


#### SERVER

details_list_columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
  name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
  key = fieldName)

server <- function(input, output, session) {
  router$server(input, output, session)

  filteredDeals <- reactive({
    selectedPeopleKeys <- if (!is.null(input$selectedPeople) && input$selectedPeople != "") input$selectedPeople else list()
    if (length(selectedPeopleKeys) == 0) {
      selectedPeopleKeys <- fluent_people$key
    }
    minClosedVal <- if(input$closedOnly == TRUE) 1 else 0

    filteredDeals <- fluent_sales_deals %>% filter(
      rep_id %in% selectedPeopleKeys,
      date >= input$fromDate,
      date <= input$toDate,
      deal_amount >= input$slider,
      is_closed >= minClosedVal) %>%
      mutate(is_closed = ifelse(is_closed == 1, "Yes", "No"))
  })

  output$map <- renderLeaflet({
    points <- cbind(filteredDeals()$LONGITUDE, filteredDeals()$LATITUDE)
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points)
  })

  output$plot <- renderPlotly({
    p <- ggplot(filteredDeals(), aes(x = rep_name)) +
      geom_bar(fill = unique(filteredDeals()$color)) +
      ylab("Number of deals") +
      xlab("Sales rep") +
      theme_light()
    ggplotly(p, height = 300)
  })

  output$filteredSalesReps <- renderUI({
    items_list <- if(nrow(filteredDeals()) > 0){
      DetailsList(items = filteredDeals(), columns = details_list_columns)
    } else {
      p("No matching transactions.")
    }

    withReact(
      HorizontalStack(
        makeCard("Top results", div(style="max-height: 500px; overflow: auto", items_list)),
        makeCard("Map", leafletOutput("map"))
      )
    )
  })
}

shinyApp(ui, server)
