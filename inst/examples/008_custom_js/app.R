library(shiny)
library(shiny.fluent)
library(leaflet)

# If you pass style to a React component it has to be in a list format.
iconStyle <- list(width = "50px", height = "50px", fontSize = "50px", margin = "10px", color = "deepskyblue")

ui <- fluidPage(
  titlePanel("Change the Pivot tab to see custom JS run"),
  withReact(
    div(
      Pivot(
        PivotItem(headerText = "Tab 1", Label("Hello 1")),
        PivotItem(headerText = "Tab 2", Label("Hello 2")),
        onLinkClick = JS("function() { alert('hello') }")
      )
    )
  )
)

server <- function(input, output, session) {
}

shinyApp(ui, server)
