library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  ProgressIndicator(
    label = "Example title",
    description = "Example description"
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
