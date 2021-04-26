library(shiny.fluent)

if (interactive()) {
  personas <- list(
    list(personaName = "Adams Baker"),
    list(personaName = "Clark Davis"),
    list(personaName = "Evans Frank")
  )

  shinyApp(
    ui = Facepile(personas = personas),
    server = function(input, output) {}
  )
}
