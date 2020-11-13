library(shiny)
library(shiny.fluent)

ui <- fluidPage(
  withReact(
    tagList(
      h1("React components as inputs"),
      p("Implemented in reactR way: Shiny input bindings + ReactDOM.render on each change."),

      h3("Static rendering"),
      p("Inputs can be used in the UI function and accessed on the server just like in Shiny."),
      Checkbox("basicInput", value = TRUE),
      textOutput("basicInputValue"),

      h3("Dynamic rendering"),
      p("Inputs can be rendered in the server function and displayed with uiOutput()."),
      p(actionButton("toggle", "Toggle visibility")),
      wellPanel(
        uiOutput("dynamicUi")
      ),

      h3("Updates"),
      p("Inputs have accompanying update functions, e.g. updateCheckbox(), like in Shiny."),
      actionButton("updateInputs", "Update inputs")
    )
  )
)

server <- function(input, output, session) {
  output$basicInputValue <- renderText({
    sprintf("Value: %s", input$basicInput)
  })

  show <- reactiveVal(TRUE)
  observeEvent(input$toggle, {
    show(!show())
  })

  output$dynamicUi <- renderUI({
    if (show()) {
      div(
        h4("Checkbox"),
        # Set value to preserve it after hide and show - same needed for regular Shiny inputs.
        Checkbox("checkbox", value = isolate(isTRUE(input$checkbox))),
        textOutput("checkboxValue"),

        h4("Slider"),
        Slider("slider", value = 0, min = -100, max = 234),
        textOutput("sliderValue"),

        h4("TextField"),
        TextField("textField"),
        textOutput("textFieldValue")
      )
    } else {
      strong("Inputs are not rendered")
    }
  })

  output$checkboxValue <- renderText({
    sprintf("Value: %s", input$checkbox)
  })
  output$sliderValue <- renderText({
    sprintf("Value: %s", input$slider)
  })
  output$textFieldValue <- renderText({
    sprintf("Value: %s", input$textField)
  })

  observeEvent(input$updateInputs, {
    shiny.fluent::updateCheckbox(session, "checkbox", value = !input$checkbox)
    shiny.fluent::updateSlider(session, "slider", value = input$slider + 10)
    shiny.fluent::updateTextField(session, "textField", value = paste(input$textField, "new text"))
  })
}

shinyApp(ui, server)
