library(shiny)
library(shiny.fluent)

ui <- function(id) {
  Announced(message = "Screen reader message")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
