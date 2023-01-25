library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Label("Required label", required = TRUE)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
