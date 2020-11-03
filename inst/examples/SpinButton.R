library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        SpinButton("spin", 15, min = 0, max = 50, step = 5),
        textOutput("spinValue")
      )
    ),
    server = function(input, output) {
      output$spinValue <- renderText({
        sprintf("Value: %s", input$spin)
      })
    }
  )
}
