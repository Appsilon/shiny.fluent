library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Link(href = "https://appsilon.com", "Appsilon")
    ),
    server = function(input, output) {
    }
  )
}
