library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DefaultButton.shinyInput("toggleCallout", text = "Toggle Callout"),
      reactOutput("callout")
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleCallout, show(!show()))
      output$callout <- renderReact({
        if (show()) {
          Callout(
            tags$div(
              style = "margin: 10px",
              "Callout contents"
            )
          )
        }
      })
    }
  )
}
