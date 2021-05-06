library(shiny.fluent)

if (interactive()) {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  shinyApp(
    ui = div(
      Dropdown.shinyInput("dropdown", value = "A", options = options),
      textOutput("dropdownValue")
    ),
    server = function(input, output) {
      output$dropdownValue <- renderText({
        sprintf("Value: %s", input$dropdown)
      })
    }
  )
}
