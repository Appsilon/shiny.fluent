library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        style="margin-top: 60px; border: 1px solid navy; padding: 10px; background: #eee;",
        Checkbox("useLayer", FALSE, label = "Display a message in a layer"),
        reactOutput("layer")
      )
    ),
    server = function(input, output) {
      output$layer <- renderReact({
        box <- div(
          style = "background-color: #60C7FF; margin: 10px; padding: 10px",
          "Hello!"
        )
        reactWidget(
          if (input$useLayer) {
            Layer(box)
          } else {
            NULL
          }
        )
      })
    }
  )
}
