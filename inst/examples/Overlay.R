library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Overlay(
        isDarkThemed = TRUE,
        "Inside Overlay"
      )
    ),
    server = function(input, output) {
    }
  )
}
