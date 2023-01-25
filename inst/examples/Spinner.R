library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Spinner(size = 3, label = "Loading, please wait...")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
