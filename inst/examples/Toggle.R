library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Toggle.shinyInput("toggle", value = TRUE),
      textOutput("toggleValue")
    ),
    server = function(input, output) {
      output$toggleValue <- renderText({
        sprintf("Value: %s", input$toggle)
      })
    }
  )
}
