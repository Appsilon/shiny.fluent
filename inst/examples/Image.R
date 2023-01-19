library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Image(src = "https://via.placeholder.com/350x150"),
    server = function(input, output) {}
  )
}
