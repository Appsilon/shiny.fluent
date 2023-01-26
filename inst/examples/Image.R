library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Image(src = "https://via.placeholder.com/350x150")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
