# Broken: Probably similar problems as with Dialog.
# Opening the Panel works, but then there seems to bo no way to hide it.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        uiOutput("ui"),
        DefaultButton("show", text = "Open panel"),
        DefaultButton("hide", text = "Hide panel")
      )
    ),
    server = function(input, output) {
      isPanelOpen <- reactiveVal(FALSE)
      output$ui <- renderUI({
        as.character(input$toggle)
        withReact(
          Panel(
            headerText = "Sample panel",
            isOpen = isPanelOpen(),
            "Content goes here."
          )
        )
      })
      observeEvent(input$show, isPanelOpen(TRUE))
      observeEvent(input$hide, isPanelOpen(FALSE))
    }
  )
}
