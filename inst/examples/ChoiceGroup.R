library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    ChoiceGroup.shinyInput(ns("choice"), value = "B", options = options),
    textOutput(ns("groupValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$groupValue <- renderText({
      sprintf("Value: %s", input$choice)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
