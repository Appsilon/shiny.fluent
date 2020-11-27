library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("showPanel", text = "Open panel"),
        reactOutput("reactPanel")
      )
    ),
    server = function(input, output) {
      isPanelOpen <- reactiveVal(FALSE)
      output$reactPanel <- renderReact({
        reactWidget(
          Panel(
            headerText = "Sample panel",
            isOpen = isPanelOpen(),
            "Content goes here.",
            onDismiss = JS("function() { Shiny.setInputValue('hidePanel', Math.random()); }")
          )
        )
      })
      observeEvent(input$showPanel, isPanelOpen(TRUE))
      observeEvent(input$hidePanel, isPanelOpen(FALSE))
    }
  )
}
