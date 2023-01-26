library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    LayerHost(id = "host", style = list(border = "1px dashed", padding = 10)),
    "Layer children are rendered in the LayerHost",
    Layer(hostId = "host", "Content")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
