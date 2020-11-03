library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      GroupedList(
        items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
        groups = list(
          list(key = "g1", name = "Some items", startIndex = 0, count = 2),
          list(key = "g2", name = "More items", startIndex = 2, count = 3)
        ),
        selectionMode = 0,
        onRenderCell = JS("(depth, item) =>
          React.createElement('span', { style: { paddingLeft: 49 } }, item)
        ")
      )
    ),
    server = function(input, output) {
    }
  )
}
