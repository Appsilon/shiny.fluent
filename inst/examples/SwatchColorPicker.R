library(shiny.fluent)

if (interactive()) {
  colorCells <- list(
    list(id = "orange", color = "#ca5010"),
    list(id = "cyan", color = "#038387"),
    list(id = "blueMagenta", color = "#8764b8"),
    list(id = "magenta", color = "#881798"),
    list(id = "white", color = "#ffffff")
  )

  shinyApp(
    ui = div(
      SwatchColorPicker.shinyInput("color", value = "orange",
        colorCells = colorCells, columnCount = length(colorCells)
      ),
      textOutput("swatchValue")
    ),
    server = function(input, output) {
      output$swatchValue <- renderText({
        sprintf("Value: %s", input$color)
      })
    }
  )
}
