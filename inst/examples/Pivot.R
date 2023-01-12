library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Pivot(
    PivotItem(headerText = "Tab 1", Label("Hello 1")),
    PivotItem(headerText = "Tab 2", Label("Hello 2"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}


# Changing Pivot items order by drag and drop
ui <- function(id) {
  fluentPage(
    Pivot(
      id = "pivot",
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"))
    ),
    tags$script('$("#pivot").children().first().attr("id", "pivot_tabs");'),
    sortable::sortable_js("pivot_tabs")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
