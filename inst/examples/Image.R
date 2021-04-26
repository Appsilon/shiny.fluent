library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Image(src = "http://placehold.it/350x150"),
    server = function(input, output) {}
  )
}
