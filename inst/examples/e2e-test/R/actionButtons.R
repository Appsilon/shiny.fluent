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
      ),
      CommandBarButton.shinyInput(ns("commandBarButton"), text = "Command Bar Button"),
      CommandButton.shinyInput(ns("commandButton"), text = "Command Button"),
      IconButton.shinyInput(ns("iconButton"), iconProps = list("iconName" = "Table"))
    ),
    textOutput(ns("clicks")),
    actionButton(ns("update"), "Update buttons")
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
    observeEvent(input$commandBarButton, nClicks(nClicks() + 1))
    observeEvent(input$commandButton, nClicks(nClicks() + 1))
    observeEvent(input$iconButton, nClicks(nClicks() + 1))
    
    output$clicks <- renderText({
      sprintf("Number of clicks: %d", nClicks())
    })
    
    observeEvent(input$update, {
      updateDefaultButton.shinyInput(session, "defaultButton", text = "Default Button Updated")
      updatePrimaryButton.shinyInput(session, "primaryButton", text = "Primary Button Updated")
      updateCompoundButton.shinyInput(
        session,
        "compoundButton",
        text = "Compound Button Updated",
        secondaryText = "Compound Button additional text updated"
      )
      updateActionButton.shinyInput(
        session,
        "actionButton",
        text = "Action Button Disabled",
        iconProps = list("iconName"= "Download"),
        disabled = TRUE
      )
      updateCommandBarButton.shinyInput(session, "commandBarButton", text = "Command Bar Button Updated")
      updateCommandButton.shinyInput(session, "commandButton", text = "Command Button Updated")
      updateIconButton.shinyInput(session, "iconButton", iconProps = list("iconName" = "Download"))
    })
  })
}
