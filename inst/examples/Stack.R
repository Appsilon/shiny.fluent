library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Stack(
      tokens = list(childrenGap = 10),
      reversed = TRUE,
      span("Item One"),
      span("Item Two"),
      span("Item Three")
    ),
    server = function(input, output) {}
  )
}
