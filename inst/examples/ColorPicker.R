library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      ColorPicker.shinyInput("color", value = "#00FF01"),
      textOutput("colorValue")
    ),
    server = function(input, output) {
      output$colorValue <- renderText({
        sprintf("Value: %s", input$color)
      })
    }
  )
}
