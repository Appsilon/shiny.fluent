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
