library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        Slider("slider", 42, min = -100, max = 100),
        textOutput("sliderValue")
      )
    ),
    server = function(input, output) {
      output$sliderValue <- renderText({
        sprintf("Value: %s", input$slider)
      })
    }
  )
}
