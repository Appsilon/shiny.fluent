library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  GroupedList(
    items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
    groups = list(
      list(key = "g1", name = "Some items", startIndex = 0, count = 2),
      list(key = "g2", name = "More items", startIndex = 2, count = 3)
    ),
    selectionMode = 0,
    onRenderCell = JS("(depth, item) => (
      jsmodule['react'].createElement('span', { style: { paddingLeft: 49 } }, item)
    )")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

ui <- function(id) {
  fluentPage(
    GroupedList(
      items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
      groups = list(
        list(key = "g1", name = "Some items", startIndex = 0, count = 2),
        list(key = "g2", name = "More items", startIndex = 2, count = 3)
      ),
      selectionMode = 0,
      onRenderCell = JS(
        "(depth, item) => (
          jsmodule['react'].createElement('span', { style: { paddingLeft: 50 } }, item)
        )"
      ),
      groupProps = list(
        onRenderHeader = JS(
          "(props) => (
            jsmodule['react'].createElement(
              jsmodule['@fluentui/react'].GroupHeader,
              { ...props, styles: { headerCount: { display: 'none' } } },
              props
            )
          )"
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
