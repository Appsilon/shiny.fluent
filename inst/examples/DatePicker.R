library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DatePicker.shinyInput("date", value = "2020-06-25T22:00:00.000Z"),
      textOutput("dateValue"),
      h3("If `value` is missing, default to system date"),
      DatePicker.shinyInput("date2"),
      textOutput("dateDefault"),
      h3("If `value` is NULL, return NULL"),
      DatePicker.shinyInput("date3", value = NULL, placeholder = "I am placeholder!"),
      textOutput("dateNull")
    ),
    server = function(input, output) {
      output$dateValue <- renderText({
        sprintf("Value: %s", input$date)
      })
      output$dateDefault <- renderText({
        sprintf("Value: %s", input$date2)
      })
      output$dateNull <- renderText({
        sprintf("Value: %s", deparse(input$date3))
      })
    }
  )
}
