library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        Rating("rating", 2),
        textOutput("ratingValue")
      )
    ),
    server = function(input, output) {
      output$ratingValue <- renderText({
        sprintf("Value: %s", input$rating)
      })
    }
  )
}
