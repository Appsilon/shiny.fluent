library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Text(variant = "xLarge", "Some text with a nice Fluent UI font"),
    server = function(input, output) {}
  )
}
