shinyInReactUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Shiny in React"),
    Separator(strong("Shiny component hidden in pivot")),
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(
        headerText = "Initially hidden components",
        div(
          textInput(ns("textInputHidden"), "Label"),
          textOutput(ns("textInputHiddenValue"))
        )
      )
    ),
    Separator(strong("Shiny components dynamic rendering")),
    uiOutput(ns("shinyInReact")),
    Separator(strong("Update button inside React")),
    Stack(
      div(
        actionButton(ns("updateInputs"), "Update text"),
        TextField.shinyInput(ns("textInputButton")),
        textOutput(ns("textInputButtonValue"))
      )
    )
  )
}

shinyInReactServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$shinyInReact <- renderUI({
      Stack(
        h4("textInput"),
        textInput(ns("textInput"), NULL),
        textOutput(ns("textInputValue")),
        
        h4("textAreaInput"),
        textAreaInput(ns("textAreaInput"), NULL),
        textOutput(ns("textAreaInputValue")),
        
        h4("checkboxInput"),
        checkboxInput(ns("checkboxInput"), NULL),
        textOutput(ns("checkboxInputValue"))
      )
    })
    
    observeEvent(input$updateInputs, {
      updateTextField.shinyInput(session, ns("textInputButton"), value = "new text")
    })
    
    ids <- c("textInput", "textAreaInput", "checkboxInput", "textInputHidden", "textInputButton") 
    wireInputToOutput(ids, input, output)
  })
}
