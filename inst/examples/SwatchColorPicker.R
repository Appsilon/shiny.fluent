library(shiny)
library(shiny.fluent)

colorCells <- list(
  list(id = "orange", color = "#ca5010"),
  list(id = "cyan", color = "#038387"),
  list(id = "blueMagenta", color = "#8764b8"),
  list(id = "magenta", color = "#881798"),
  list(id = "white", color = "#ffffff")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    SwatchColorPicker.shinyInput(ns("color"), value = "orange",
      colorCells = colorCells, columnCount = length(colorCells)
    ),
    textOutput(ns("swatchValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$swatchValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
