library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    SpinButton.shinyInput(ns("spin"), value = 15, min = 0, max = 50, step = 5),
    textOutput(ns("spinValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$spinValue <- renderText({
      sprintf("Value: %s", input$spin)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
