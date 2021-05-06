library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"))
    ),
    server = function(input, output) {}
  )
}
