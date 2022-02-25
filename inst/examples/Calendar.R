library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Calendar.shinyInput("calendar", value = "2020-06-25T22:00:00.000Z"),
      textOutput("calendarValue"),
      h3("If `value` is missing, default to system date"),
      Calendar.shinyInput("calendar2"),
      textOutput("calendarDefault"),
      h3("If `value` is NULL, return NULL"),
      Calendar.shinyInput("calendar3", value = NULL),
      textOutput("calendarNull")
    ),
    server = function(input, output) {
      output$calendarValue <- renderText({
        sprintf("Value: %s", input$calendar)
      })
      output$calendarDefault <- renderText({
        sprintf("Value: %s", input$calendar2)
      })
      output$calendarNull <- renderText({
        sprintf("Value: %s", deparse(input$calendar3))
      })
    }
  )
}
