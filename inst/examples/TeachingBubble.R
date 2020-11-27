library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggleTeachingBubble", text = "Toggle TeachingBubble"),
        reactOutput("teachingBubble")
      )
    ),
    server = function(input, output) {
      showBubble <- reactiveVal(FALSE)
      observeEvent(input$toggleTeachingBubble, {
        showBubble(isolate(!showBubble()))
      })
      output$teachingBubble <- renderReact({
          reactWidget(
            if (showBubble()) {
              TeachingBubble(
                target = "#toggleTeachingBubble",
                headline = "Very useful!"
              )
            }
          )
      })
    }
  )
}
