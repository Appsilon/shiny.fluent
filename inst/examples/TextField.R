library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    TextField.shinyInput(ns("text")),
    textOutput(ns("textValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$textValue <- renderText({
      sprintf("Value: %s", input$text)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Using custom handler to convert input to uppercase
CustomComponents <- tags$script(HTML("(function() {
  const { InputAdapter } = jsmodule['@/shiny.react'];
  const { TextField } = jsmodule['@fluentui/react'];
  const CustomComponents = jsmodule['CustomComponents'] = {};

  CustomComponents.UpperCaseTextField = InputAdapter(TextField, (value, setValue) => ({
    value: value.toUpperCase(),
    onChange: (e, v) => setValue(v.toUpperCase()),
  }));
})();"))

UpperCaseTextField <- function(inputId, ..., value = "") {
  shiny.react::reactElement(
    module = "CustomComponents",
    name = "UpperCaseTextField",
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = shinyFluentDependency()
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CustomComponents,
    UpperCaseTextField(ns("uppercase_text")),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text <- renderText(input$uppercase_text)
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
