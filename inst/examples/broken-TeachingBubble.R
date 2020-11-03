# Broken: Probably the same problems as with Dialog and Panel
# (DOM elements created outside of the container).
# Once rendered in uiOutput(), there is no way to hide it.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggle", text = "Toggle TeachingBubble"),
        uiOutput("ui")
      )
    ),
    server = function(input, output) {
      showBubble <- reactiveVal(FALSE)
      observeEvent(input$toggle, {
        showBubble(isolate(!showBubble()))
      })
      output$ui <- renderUI({
        if (showBubble()) {
          withReact(
            TeachingBubble(
              target = "#toggle",
              headline = "Very useful!"
            )
          )
        }
      })
    }
  )
}
