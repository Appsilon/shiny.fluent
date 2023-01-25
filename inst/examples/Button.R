library(shiny)
library(shiny.fluent)

tokens <- list(childrenGap = 20)

ui <- function(id) {
  ns <- NS(id)
  tags$div(
    Stack(
      DefaultButton.shinyInput(
        ns("button1"),
        text = "Default Button",
        styles = list("background: green")
      ),
      PrimaryButton.shinyInput(
        ns("button2"),
        text = "Primary Button"
      ),
      CompoundButton.shinyInput(
        ns("button3"),
        secondaryText = "Compound Button has additional text",
        text = "Compound Button"
      ),
      ActionButton.shinyInput(
        ns("button4"),
        iconProps = list("iconName" = "AddFriend"),
        text = "Action Button"
      ),
      horizontal = TRUE,
      tokens = tokens
    ),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    clicks <- reactiveVal(0)
    addClick <- function() { clicks(isolate(clicks() + 1)) }
    observeEvent(input$button0, addClick())
    observeEvent(input$button1, addClick())
    observeEvent(input$button2, addClick())
    observeEvent(input$button3, addClick())
    observeEvent(input$button4, addClick())
    output$text <- renderText({
      paste0("Clicks:", clicks())
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
