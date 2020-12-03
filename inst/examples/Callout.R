library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggleCallout", text = "Toggle Callout"),
        reactOutput("callout")
      )
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleCallout, {
        show(isolate(!show()))
      })
      output$callout <- renderReact({
        reactWidget(
          if (show()) {
            Callout(
              tags$div(
                style = "margin: 10px",
                "Callout contents"
              )
            )
          }
        )
      })
    }
  )
}
