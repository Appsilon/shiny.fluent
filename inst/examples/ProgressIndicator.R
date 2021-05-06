library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = ProgressIndicator(
      label = "Example title",
      description = "Example description"
    ),
    server = function(input, output) {}
  )
}
