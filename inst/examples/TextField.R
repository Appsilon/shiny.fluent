library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        TextField("text"),
        textOutput("textValue")
      )
    ),
    server = function(input, output) {
      output$textValue <- renderText({
        sprintf("Value: %s", input$text)
      })
    }
  )
}
