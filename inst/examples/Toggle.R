library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        Toggle("toggle", TRUE),
        textOutput("toggleValue")
      )
    ),
    server = function(input, output) {
      output$toggleValue <- renderText({
        sprintf("Value: %s", input$toggle)
      })
    }
  )
}
