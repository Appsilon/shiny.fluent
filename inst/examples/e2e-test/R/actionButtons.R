actionButtonsUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Action buttons"),
    p("When the button is first rendered, no event is generated - exactly like with actionButton"),
    h4("Click any button to refresh the plot."),
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
    plotOutput(ns("plot"))
  )
}

actionButtonsServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    randomVals <- reactiveVal(runif(50))
    
    observe({
      input$defaultButton
      input$primaryButton
      input$compoundButton
      input$actionButton
      randomVals(runif(50))
    })
    
    output$plot <- renderPlot({
      hist(randomVals())
    })
  })
}
