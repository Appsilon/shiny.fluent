library(shiny.fluent)

if (interactive()) {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  shinyApp(
    ui = div(
      ComboBox.shinyInput("combo", value = list(text = "some text"),
        options = options, allowFreeform = TRUE
      ),
      textOutput("comboValue")
    ),
    server = function(input, output) {
      output$comboValue <- renderText({
        sprintf("Value: %s", input$combo$text)
      })
    }
  )
}
