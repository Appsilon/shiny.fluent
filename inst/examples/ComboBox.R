library(shiny.fluent)

if (interactive()) {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  shinyApp(
    ui = withReact(
      div(
        ComboBox("combo", "some text", options = options, allowFreeform = TRUE),
        textOutput("comboValue")
      )
    ),
    server = function(input, output) {
      output$comboValue <- renderText({
        v <- input$combo
        sprintf("Value: %s", if (is.character(v)) v else v$key)
      })
    }
  )
}
