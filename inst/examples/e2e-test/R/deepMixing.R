deepMixingUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Deep mixing of Shiny and react"),
    p(),
    div(
      h3("Fluent components inside Shiny tabset partially work"),
      tabsetPanel(
        id = ns("tabs1"),
        type = "tabs",
        tabPanel("Other panel", Label("Other")),
        tabPanel("JSX",
          Stack(
            horizontal = TRUE, 
            tokens = list(childrenGap = 20),
            Label("I'm a Label", `data-cy` = ns("label")),
            PrimaryButton(text = "I'm a Button", `data-cy` = ns("primaryButton"))
          )
        )
      ),
      h3("JSX inside uiOutput inside JSX"),
      uiOutput(ns("layer1"))
    ),
    PrimaryButton.shinyInput(ns("addPoint"), text = "Add point", `data-cy` = ns("addPoint"))
  )
}

deepMixingServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$layer1 <- renderUI({
      Pivot(
        `data-cy` = ns("pivot"),
        PivotItem(headerText = "Tab 1", `data-cy` = "x", Label("Hello 1")),
        PivotItem(headerText = "Leaflet inside a Pivot", leafletOutput(ns("map"))),
        PivotItem(headerText = "Another level of nesting", uiOutput(ns("layer2")))
      )
    })
    
    output$layer2 <- renderUI({
      div(
        h3("Leaflet in Pivot in uiOutput in Pivot in uiOutput in JSX"),
        Pivot(
          `data-cy` = ns("nestedPivot"),
          PivotItem(headerText = "Tab 1", Label("Hello 2")),
          PivotItem(headerText = "Leaflet inside a Pivot", leafletOutput(ns("map")))
        )
      )
    })
    
    points <- eventReactive(input$addPoint, {
      n <- as.numeric(input$addPoint)
      cbind(rnorm(n) * 2 + 13, rnorm(n) + 48)
    }, ignoreNULL = FALSE, ignoreInit = FALSE)
    
    output$map <- renderLeaflet({
      leaflet() %>% addTiles() %>% addMarkers(data = points())
    })
  })
}