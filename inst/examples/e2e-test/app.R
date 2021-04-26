library(shiny)
library(shiny.fluent)

ui <- fluidPage(
  h1("Inputs tests"),
  actionButton("updateInputs", "Update"),
  actionButton("toggle", "Toggle visibility"),
  uiOutput("main"),
  h1("UI Components tests"),
  Stack(
    div("placeholder")
  ),
  h1("Scenarios tests"),
  div(
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2")),
      onLinkClick = JS("function() { alert('Pivot tab switched') }")
    ),
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Initially hidden components",
        div(
          textInput("scenarioInput1", "Label"),
          textOutput("scenarioTextOutput1")
        )
      )
    )
  ),
  h2("Update button inside React"),
  Stack(
    div(
      actionButton("updateInputs2", "Update text"),
      TextField.shinyInput("scenarioInput2"),
      textOutput("scenarioTextOutput2")
    )
  )
)

server <- function(input, output, session) {
  show <- reactiveVal(TRUE)
  observeEvent(input$toggle, {
    show(!show())
  })

  output$main <- renderUI({
    if (show()) {
      div(
        h4("TextField"),
        TextField.shinyInput("input1"),
        textOutput("textOutput1"),
        h4("textAreaInput"),
        textAreaInput("input2", NULL),
        textOutput("textOutput2"),
        h4("checkboxInput"),
        checkboxInput("input3", NULL),
        textOutput("textOutput3")
      )
    } else {
      NULL
    }
  })

  wireInputToOutput <- function(inputPrefix, outputPrefix){
    function(i) {
      inputName <- paste0(inputPrefix, i)
      outputName <- paste0(outputPrefix, i)
      output[[outputName]] <- renderText({
        sprintf("Value: %s", input[[inputName]])
      })
    }
  }

  lapply(1:3, wireInputToOutput("input", "textOutput"))
  lapply(1:2, wireInputToOutput("scenarioInput", "scenarioTextOutput"))

  observeEvent(input$updateInputs, {
    updateTextField.shinyInput(session, "input1", value = paste(input$input1, "new text"))
    updateTextAreaInput(session, "input2", value = paste(input$input1, "new text"))
    updateCheckboxInput(session, "input3", value = FALSE)
  })

  observeEvent(input$updateInputs2, {
    updateTextField.shinyInput(session, "scenarioInput2", value = "new text")
  })
}

shinyApp(ui, server)
