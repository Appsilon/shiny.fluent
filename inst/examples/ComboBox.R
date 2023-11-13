library(shiny)
library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    ComboBox.shinyInput(ns("combo"), value = "some text",
      options = options, allowFreeform = TRUE
    ),
    textOutput(ns("comboValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$comboValue <- renderText({
      sprintf("Value: %s", input$combo)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
