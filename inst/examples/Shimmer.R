library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
      Shimmer(),
      Shimmer(width = "75%"),
      Shimmer(width = "50%")
    ),
    tags$head(tags$style(
      ".ms-Shimmer-container { margin: 10px 0 }"
    ))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
