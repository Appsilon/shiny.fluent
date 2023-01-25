library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Stack(
    tokens = list(childrenGap = 10),
    reversed = TRUE,
    span("Item One"),
    span("Item Two"),
    span("Item Three")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
