library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    ColorPicker.shinyInput(ns("color"), value = "#00FF01"),
    textOutput(ns("colorValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {

    output$colorValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
