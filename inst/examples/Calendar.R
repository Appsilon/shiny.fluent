library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Calendar.shinyInput("calendar", "2020-06-25T22:00:00.000Z"),
      textOutput("calendarValue")
    ),
    server = function(input, output) {
      output$calendarValue <- renderText({
        sprintf("Value: %s", input$calendar)
      })
    }
  )
}
