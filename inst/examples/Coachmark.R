library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggleCoachmark", text = "Toggle Coachmark"),
        reactOutput("coachmark")
      )
    ),
    server = function(input, output) {
      showCoachmark <- reactiveVal(FALSE)
      observeEvent(input$toggleCoachmark, {
        showCoachmark(isolate(!showCoachmark()))
      })
      output$coachmark <- renderReact({
        reactWidget(
          if (showCoachmark()) {
            Coachmark(
              target="#toggleCoachmark",
              TeachingBubbleContent(
                headline="Example title",
                hasCloseButton=TRUE,
                primaryButtonProps=list(text="Try it"),
                secondaryButtonProps=list(text="Try it again"),
                onDismiss=JS("function() { Shiny.setInputValue('toggleCoachmark', Math.random()); }"),
                "Welcome to the land of coachmarks!"
              )
            )
          }
        )
      })
    }
  )
}


