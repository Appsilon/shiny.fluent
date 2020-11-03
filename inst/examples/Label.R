library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Label("Required label", required = TRUE)
    ),
    server = function(input, output) {
    }
  )
}
