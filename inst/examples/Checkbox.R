library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      Checkbox.shinyInput("checkbox", value = FALSE),
      textOutput("checkboxValue")
    ),
    server = function(input, output) {
      output$checkboxValue <- renderText({
        sprintf("Value: %s", input$checkbox)
      })
    }
  )
}
