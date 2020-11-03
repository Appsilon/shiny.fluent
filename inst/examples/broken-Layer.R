# Broken: We have an example of static use within the UI function,
# but it breaks when used within renderUI() on the server
# (probably for the same reasons why Dialog doesn't work).
library(shiny.fluent)

if (interactive()) {
  box <- div(
    style = "background-color: #60C7FF; margin: 10px; padding: 10px",
    "Hello!"
  )
  shinyApp(
    ui = withReact(
      div(
        Checkbox("useLayer", FALSE, label = "Wrap the content box below in a Layer"),
        uiOutput("ui")
      )
    ),
    server = function(input, output) {
      output$ui <- renderUI({
        str(input$useLayer)
        withReact(
          if (input$useLayer) {
            Layer(box)
          } else {
            box
          }
        )
      })
    }
  )
}
