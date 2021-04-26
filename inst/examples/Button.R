library(shiny.fluent)

if (interactive()) {
  tokens <- list(childrenGap = 20)

  shinyApp(
    ui = div(
        Stack(
        DefaultButton.shinyInput("button1", text = "Default Button", styles = list("background: green")),
        PrimaryButton.shinyInput("button2", text = "Primary Button"),
        CompoundButton.shinyInput("button3", secondaryText = "Compound Button has additional text", text = "Compound Button"),
        ActionButton.shinyInput("button4", iconProps = list("iconName" = "AddFriend"), text = "Action Button"),
        horizontal = TRUE,
        tokens = tokens
      ),
      textOutput("text")
    ),
    server = function(input, output) {
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
