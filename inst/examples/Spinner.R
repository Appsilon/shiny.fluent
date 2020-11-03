library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Spinner(size = 3, label = "Loading, please wait...")
    ),
    server = function(input, output) {
    }
  )
}
