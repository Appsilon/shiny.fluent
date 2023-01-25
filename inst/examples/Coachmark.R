library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("coachmark")),
    DefaultButton.shinyInput(ns("toggleCoachmark"),
      id = "target", text = "Toggle coachmark"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    coachmarkVisible <- reactiveVal(FALSE)
    observeEvent(input$toggleCoachmark, coachmarkVisible(!coachmarkVisible()))
    observeEvent(input$hideCoachmark, coachmarkVisible(FALSE))
    output$coachmark <- renderUI({
      if (coachmarkVisible()) Coachmark(
        target = "#target",
        TeachingBubbleContent(
          hasCloseButton = TRUE,
          onDismiss = triggerEvent(ns("hideCoachmark")),
          headline = "Example title",
          primaryButtonProps = list(text = "Try it"),
          secondaryButtonProps = list(text = "Try it again"),
          "Welcome to the land of coachmarks!"
        )
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
