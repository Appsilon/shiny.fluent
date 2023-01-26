library(shiny)
library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    Dropdown.shinyInput(ns("dropdown"), value = "A", options = options),
    textOutput(ns("dropdownValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$dropdownValue <- renderText({
      sprintf("Value: %s", input$dropdown)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
