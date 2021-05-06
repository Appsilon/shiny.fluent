library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Link(href = "https://appsilon.com", "Appsilon"),
    server = function(input, output) {}
  )
}
