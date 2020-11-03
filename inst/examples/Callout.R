library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Callout(
        tags$div(
          style = "margin: 10px",
          "Callout contents"
        )
      )
    ),
    server = function(input, output) {
    }
  )
}
