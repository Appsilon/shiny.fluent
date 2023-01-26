library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Persona(
    imageInitials = "AL",
    text = "Annie Lindqvist",
    secondaryText = "Software Engineer",
    presence = 4
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
