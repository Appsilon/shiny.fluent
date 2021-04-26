library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = TooltipHost(
      content = "This is the tooltip content",
      delay = 0,
      Text("Hover over me")
    ),
    server = function(input, output) {}
  )
}
