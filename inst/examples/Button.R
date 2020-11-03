library(shiny.fluent)

if (interactive()) {
  tokens <- list(childrenGap = 20)

  shinyApp(
    ui = withReact(
      div(
        Stack(
          DefaultButton("button1", text = "Default Button", styles = list("background: green")),
          PrimaryButton("button2", text = "Primary Button"),
          CompoundButton("button3", secondaryText = "Compound Button has additional text", text = "Compound Button"),
          ActionButton("button4", iconProps = list("iconName" = "AddFriend"), text = "Action Button"),
          horizontal = TRUE,
          tokens = tokens
        ),
        textOutput("text")
      )
    ),
    server = function(input, output, session) {
      clicks <- reactiveVal(0)
      addClick <- function() { clicks(isolate(clicks() + 1)) }
      
      observeEvent(input$button1, addClick())
      observeEvent(input$button2, addClick())
      observeEvent(input$button3, addClick())
      observeEvent(input$button4, addClick())

      output$text <- renderText({
        paste("Clicks:", clicks())
      })
    }
  )
}
