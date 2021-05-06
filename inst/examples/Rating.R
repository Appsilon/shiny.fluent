library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Rating.shinyInput("rating", value = 2),
      textOutput("ratingValue")
    ),
    server = function(input, output) {
      output$ratingValue <- renderText({
        sprintf("Value: %s", input$rating)
      })
    }
  )
}
