library(shiny.fluent)

personas <- list(
  list(personaName = "Adams Baker"),
  list(personaName = "Clark Davis"),
  list(personaName = "Evans Frank")
)

ui <- function(id) {
  ns <- NS(id)
  Facepile(personas = personas)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
