library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DatePicker.shinyInput(ns("date"), value = "2020-06-25T22:00:00.000Z"),
    textOutput(ns("dateValue")),
    h3("If `value` is missing, default to system date"),
    DatePicker.shinyInput(ns("date2")),
    textOutput(ns("dateDefault")),
    h3("If `value` is NULL, return NULL"),
    DatePicker.shinyInput(ns("date3"), value = NULL, placeholder = "I am placeholder!"),
    textOutput(ns("dateNull"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$dateValue <- renderText({
      sprintf("Value: %s", input$date)
    })
    output$dateDefault <- renderText({
      sprintf("Value: %s", input$date2)
    })
    output$dateNull <- renderText({
      sprintf("Value: %s", deparse(input$date3))
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
