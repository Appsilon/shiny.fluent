# Example 2
library(shiny)
library(shiny.fluent)

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
