library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        LayerHost(id = "host", style = list(border = "1px dashed", padding = 10)),
        "Layer children are rendered in the LayerHost",
        Layer(hostId = "host", "Content")
      )
    ),
    server = function(input, output) {
    }
  )
}
