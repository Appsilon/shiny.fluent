library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Label("Required label", required = TRUE),
    server = function(input, output) {}
  )
}
