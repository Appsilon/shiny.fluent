library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Toggle.shinyInput(ns("toggle"), value = TRUE),
    textOutput(ns("toggleValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$toggleValue <- renderText({
      sprintf("Value: %s", input$toggle)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
