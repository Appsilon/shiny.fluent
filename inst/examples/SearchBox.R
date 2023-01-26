library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    SearchBox.shinyInput(ns("search"), placeholder = "Search"),
    textOutput(ns("searchValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$searchValue <- renderText({
      sprintf("Value: %s", input$search)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
