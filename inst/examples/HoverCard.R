library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  HoverCard(
    type = "PlainCard",
    plainCardProps = JS("{
      onRenderPlainCard: (a, b, c) => 'HoverCard contents',
      style: { margin: 10 }
    }"),
    "Hover over me"
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
