library(shiny)
library(shiny.fluent)
library(leaflet)

ui <- fluidPage(
  titlePanel("Deep mixing of Shiny and react"),
  p(),
  withReact(
    div(
      h3("Fluent components inside Shiny tabset partially work"),
      tabsetPanel(type = "tabs",
                  tabPanel("Other panel", Label("Other")),
                  tabPanel("JSX",
                           Stack(
                             Label("I'm a Label"),
                             PrimaryButton("Button1", text="Button 1"),
                             horizontal=TRUE, tokens=list(childrenGap=20)))),
      h3("JSX inside uiOutput inside JSX"),
      uiOutput("layer1")
    )
  ),
  PrimaryButton("recalc", text="Refresh points")
)

server <- function(input, output, session) {

  output$layer1 <- renderUI({
    withReact(
      Pivot(
        PivotItem(headerText="Tab 1", Label("Hello 1")),
        PivotItem(headerText="Leaflet inside a Pivot", leafletOutput("mymap3")),
        PivotItem(headerText="Another level of nesting", uiOutput("layer2"))
      )
    )
  })

  output$layer2 <- renderUI({
    div(h3("Leaflet in Pivot in uiOutput in Pivot in uiOutput in JSX"),
        withReact(
          Pivot(
            PivotItem(headerText="Tab 1", Label("Hello 2")),
            PivotItem(headerText="Leaflet inside a Pivot", leafletOutput("mymap3")))
        )
    )
  })

  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)

  output$mymap3 <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points())
  })

}

shinyApp(ui, server)
