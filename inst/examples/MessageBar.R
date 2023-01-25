library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  MessageBar("Message")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
