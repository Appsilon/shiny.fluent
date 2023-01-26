library(shiny)
library(shiny.fluent)

items <- do.call(paste0, replicate(20, sample(LETTERS, 200, TRUE), FALSE))

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "overflow: auto; max-height: 400px",
    List(
      items = items,
      onRenderCell = JS("(item, index) => `${index} ${item}`")
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
