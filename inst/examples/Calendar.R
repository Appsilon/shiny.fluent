library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Calendar.shinyInput(ns("calendar"), value = "2020-06-25T22:00:00.000Z"),
    textOutput(ns("calendarValue")),
    h3("If `value` is missing, default to system date"),
    Calendar.shinyInput(ns("calendar2")),
    textOutput(ns("calendarDefault")),
    h3("If `value` is NULL, also default to system date"),
    Calendar.shinyInput(ns("calendar3"), value = NULL),
    textOutput(ns("calendarNull"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$calendarValue <- renderText({
      sprintf("Value: %s", input$calendar)
    })
    output$calendarDefault <- renderText({
      sprintf("Value: %s", input$calendar2)
    })
    output$calendarNull <- renderText({
      sprintf("Value: %s", input$calendar3)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}