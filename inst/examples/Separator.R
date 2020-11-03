library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Separator("Text")
    ),
    server = function(input, output) {
    }
  )
}
