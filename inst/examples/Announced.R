library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Announced(message = "Screen reader message")
    ),
    server = function(input, output) {
    }
  )
}
