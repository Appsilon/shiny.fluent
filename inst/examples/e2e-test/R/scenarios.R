scenariosUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Scenarios tests"),
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2")),
      onLinkClick = JS("function() { alert('Pivot tab switched') }")
    )
  )
}
