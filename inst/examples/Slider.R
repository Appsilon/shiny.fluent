library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Slider.shinyInput("slider", value = 42, min = -100, max = 100),
      textOutput("sliderValue")
    ),
    server = function(input, output) {
      output$sliderValue <- renderText({
        sprintf("Value: %s", input$slider)
      })
    }
  )
}
