library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Slider.shinyInput(ns("slider"), value = 42, min = -100, max = 100),
    textOutput(ns("sliderValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$sliderValue <- renderText({
      sprintf("Value: %s", input$slider)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
