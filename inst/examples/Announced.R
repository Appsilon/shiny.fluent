library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Announced(message = "Screen reader message"),
    server = function(input, output) {}
  )
}
