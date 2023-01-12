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

# Supplying custom strings for DatePicker
ui <- function(id) {
  fluentPage(
    DatePicker.shinyInput(
      "date",
      value = Sys.Date(),
      strings = list(
        months = list(
          "January", "February", "March", "April",
          "May", "June", "July", "August",
          "September", "October", "November", "December"
        ),
        shortMonths = list(
          "Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
        ),
        days = list(
          "Sunday", "Monday", "Tuesday", "Wednesday",
          "Thursday", "Friday", "Saturday"
        ),
        shortDays = list("S", "M", "T", "W", "T", "F", "S"),
        goToToday = "Go to today",
        prevMonthAriaLabel = "Go to previous month",
        nextMonthAriaLabel = "Go to next month",
        prevYearAriaLabel = "Go to previous year",
        nextYearAriaLabel = "Go to next year"
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
