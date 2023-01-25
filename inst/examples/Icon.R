library(shiny.fluent)

style <- list(fontSize = 50, margin = 10)

ui <- function(id) {
  ns <- NS(id)
  tags$div(
    FontIcon(iconName = "CompassNW", style = style),
    FontIcon(iconName = "Dictionary", style = style),
    FontIcon(iconName = "TrainSolid", style = style)
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
