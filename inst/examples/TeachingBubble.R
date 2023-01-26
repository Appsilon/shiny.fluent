library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(
      ns("toggleTeachingBubble"),
      id = "target",
      text = "Toggle TeachingBubble"
    ),
    reactOutput(ns("teachingBubble"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {

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
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
