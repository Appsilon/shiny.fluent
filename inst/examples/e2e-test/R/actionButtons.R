actionButtonsUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Action buttons"),
    p("When the button is first rendered, no event is generated - exactly like with actionButton"),
    h4("Click any button to increment the counter."),
    Stack(
      horizontal = TRUE,
      tokens = list(childrenGap = 20),
      DefaultButton.shinyInput(ns("defaultButton"), text = "Default Button"),
      PrimaryButton.shinyInput(ns("primaryButton"), text = "Primary Button"),
      CompoundButton.shinyInput(
        ns("compoundButton"),
        text = "Compound Button",
        secondaryText = "Compound Button has additional text"
      ),
      ActionButton.shinyInput(
        ns("actionButton"),
        text = "Action Button",
        iconProps = list("iconName" = 'AddFriend')
      )
    ),
    textOutput(ns("clicks"))
  )
}

actionButtonsServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    nClicks <- reactiveVal(0)
    
    observeEvent(input$defaultButton, nClicks(nClicks() + 1))
    observeEvent(input$primaryButton, nClicks(nClicks() + 1))
    observeEvent(input$compoundButton, nClicks(nClicks() + 1))
    observeEvent(input$actionButton, nClicks(nClicks() + 1))
    
    output$clicks <- renderText({
      sprintf("Number of clicks: %d", nClicks())
    })
  })
}
