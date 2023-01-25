library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Checkbox.shinyInput(ns("checkbox"), value = FALSE),
    textOutput(ns("checkboxValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
  output$checkboxValue <- renderText({
    sprintf("Value: %s", input$checkbox)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}