library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      MessageBar("Message")
    ),
    server = function(input, output) {
    }
  )
}
