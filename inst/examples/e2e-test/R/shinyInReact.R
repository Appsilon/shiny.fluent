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
          h4("textInput"),
          textInput(ns("textInputHidden"), NULL),
          textOutput(ns("textInputHiddenValue")),
          
          h4("textAreaInput"),
          textAreaInput(ns("textAreaInputHidden"), NULL),
          textOutput(ns("textAreaInputHiddenValue")),
          
          h4("checkboxInput"),
          checkboxInput(ns("checkboxInputHidden"), NULL),
          textOutput(ns("checkboxInputHiddenValue"))
        )
      )
    ),
    Separator(strong("Shiny components dynamic rendering")),
    uiOutput(ns("shinyInReact")),
    Separator(strong("Shiny components static rendering")),
    Stack(
      actionButton(ns("updateInputs"), "Update text", width = "100px"),
      
      h4("textInput"),
      textInput(ns("textInputStatic"), "Shiny input test"),
      textOutput(ns("textInputStaticValue")),
      
      h4("textAreaInput"),
      textAreaInput(ns("textAreaInputStatic"), NULL),
      textOutput(ns("textAreaInputStaticValue")),
      
      h4("checkboxInput"),
      checkboxInput(ns("checkboxInputStatic"), NULL),
      textOutput(ns("checkboxInputStaticValue"))
    )
  )
}

shinyInReactServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    
    output$shinyInReact <- renderUI({
      Stack(
        h4("textInput"),
        textInput(ns("textInputDynamic"), NULL),
        textOutput(ns("textInputDynamicValue")),
        
        h4("textAreaInput"),
        textAreaInput(ns("textAreaInputDynamic"), NULL),
        textOutput(ns("textAreaInputDynamicValue")),
        
        h4("checkboxInput"),
        checkboxInput(ns("checkboxInputDynamic"), NULL),
        textOutput(ns("checkboxInputDynamicValue"))
      )
    })
    
    observeEvent(input$updateInputs, {
      updateTextInput(session, "textInputStatic", value = "new text")
    })
    
    ids <- c(
      "textInputStatic", "textAreaInputStatic", "checkboxInputStatic",
      "textInputDynamic", "textAreaInputDynamic", "checkboxInputDynamic",
      "textInputHidden", "textAreaInputHidden", "checkboxInputHidden"
    ) 
    wireInputToOutput(ids, input, output)
  })
}
