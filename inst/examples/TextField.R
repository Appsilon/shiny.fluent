library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      TextField.shinyInput("text"),
      textOutput("textValue")
    ),
    server = function(input, output) {
      output$textValue <- renderText({
        sprintf("Value: %s", input$text)
      })
    }
  )
}
