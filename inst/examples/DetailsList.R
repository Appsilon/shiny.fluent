library(shiny)
library(shiny.fluent)

items <- list(
  list(key = "1", name = "Mark", surname = "Swanson"),
  list(key = "2", name = "Josh", surname = "Johnson")
)

columns <- list(
  list(key = "name", fieldName = "name", name = "Name"),
  list(key = "surname", fieldName = "surname", name = "Surname")
)


ui <- function(id) {
  ns <- NS(id)
  DetailsList(items = items, columns = columns)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
