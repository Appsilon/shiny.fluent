library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Pivot(
    PivotItem(headerText = "Tab 1", Label("Hello 1")),
    PivotItem(headerText = "Tab 2", Label("Hello 2"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
