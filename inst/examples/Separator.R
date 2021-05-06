library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Separator("Text"),
    server = function(input, output) {}
  )
}
