
# Example 2
library(shiny)
library(shiny.fluent)

# Custom rendering of group headers
navigation_styles <- list(
  root = list(
    height = "100%",
    width = "30%",
    boxSizing = "border-box",
    border = "1px solid #eee",
    overflowY = "auto"
  )
)

link_groups <- list(
  list(
    name = "Pages",
    links = list(
      list(name = "Activity"),
      list(name = "News")
    )
  ),
  list(
    name = "More Pages",
    links = list(
      list(name = "Settings"),
      list(name = "Notes")
    )
  )
)

ui <- function(id) {
  fluidPage(
    Nav(
      groups = link_groups,
      selectedKey = "key1",
      styles = navigation_styles,
      onRenderGroupHeader = JS("group => React.createElement('h3', null, group.name)")
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
