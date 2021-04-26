library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DatePicker.shinyInput("date", value = "2020-06-25T22:00:00.000Z"),
      textOutput("dateValue")
    ),
    server = function(input, output) {
      output$dateValue <- renderText({
        sprintf("Value: %s", input$date)
      })
    }
  )
}
