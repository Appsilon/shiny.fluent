library(shiny.fluent)

if (interactive()) {
  dayPickerStrings <- jsonlite::fromJSON(
    '{"months":["January","February","March","April","May","June","July","August","September",
    "October","November","December"],"shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul",
    "Aug","Sep","Oct","Nov","Dec"],"days":["Sunday","Monday","Tuesday","Wednesday","Thursday",
    "Friday","Saturday"],"shortDays":["S","M","T","W","T","F","S"],"goToToday":"Go to today",
    "weekNumberFormatString":"Week number {0}","prevMonthAriaLabel":"Previous month",
    "nextMonthAriaLabel":"Next month","prevYearAriaLabel":"Previous year",
    "nextYearAriaLabel":"Next year","prevYearRangeAriaLabel":"Previous year range",
    "nextYearRangeAriaLabel":"Next year range","closeButtonAriaLabel":"Close"}'
  )

  shinyApp(
    ui = withReact(
      div(
        Calendar("calendar", "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
        textOutput("calendarValue")
      )
    ),
    server = function(input, output) {
      output$calendarValue <- renderText({
        sprintf("Value: %s", input$calendar)
      })
    }
  )
}
