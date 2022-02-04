library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DefaultButton.shinyInput(
        "toggleTeachingBubble",
        id = "target",
        text = "Toggle TeachingBubble"
      ),
      reactOutput("teachingBubble")
    ),
    server = function(input, output) {
      showBubble <- reactiveVal(FALSE)
      observeEvent(input$toggleTeachingBubble, showBubble(!showBubble()))
      output$teachingBubble <- renderReact({
        if (showBubble()) {
          TeachingBubble(
            target = "#target",
            headline = "Very useful!"
          )
        }
      })
    }
  )
}
