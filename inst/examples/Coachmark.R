library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
      uiOutput("coachmark"),
      DefaultButton.shinyInput("toggleCoachmark",
        id = "target", text = "Toggle coachmark"
      )
    ),
    server = function(input, output) {
      coachmarkVisible <- reactiveVal(FALSE)
      observeEvent(input$toggleCoachmark, coachmarkVisible(!coachmarkVisible()))
      observeEvent(input$hideCoachmark, coachmarkVisible(FALSE))
      output$coachmark <- renderUI({
        if (coachmarkVisible()) Coachmark(
          target = "#target",
          TeachingBubbleContent(
            hasCloseButton = TRUE,
            onDismiss = triggerEvent("hideCoachmark"),
            headline = "Example title",
            primaryButtonProps = list(text = "Try it"),
            secondaryButtonProps = list(text = "Try it again"),
            "Welcome to the land of coachmarks!"
          )
        )
      })
    }
  )
}
