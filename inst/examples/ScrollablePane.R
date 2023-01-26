library(shiny)
library(shiny.fluent)

pane <- function(header, paragraphs) (
  div(
    Sticky(
      div(
        style = "background-color: #80CAF1; border-top: 1px solid; border-bottom: 1px solid",
        header
      )
    ),
    stringi::stri_rand_lipsum(paragraphs)
  )
)

ui <- function(id) {
  ns <- NS(id)
  ScrollablePane(
    styles = list(
      root = list(position = "relative", height = "500px", width = "400px")
    ),
    pane("Some text", 3),
    pane("A lot of text", 5),
    pane("Just a short ending", 1)
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
