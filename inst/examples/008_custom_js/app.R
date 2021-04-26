library(shiny.fluent)

ui <- fluidPage(
  titlePanel("Change the Pivot tab to see custom JS run"),
  div(
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2")),
      onLinkClick = JS("function() { alert('hello') }")
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)
