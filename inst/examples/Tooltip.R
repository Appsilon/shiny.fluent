library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  TooltipHost(
    content = "This is the tooltip content",
    delay = 0,
    Text("Hover over me")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
