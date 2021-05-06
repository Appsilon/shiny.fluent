library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = MessageBar("Message"),
    server = function(input, output) {}
  )
}
