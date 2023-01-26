library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "margin-top: 60px; border: 1px solid navy; padding: 10px; background: #eee;",
    Checkbox.shinyInput(ns("useLayer"), value = FALSE, label = "Display a message in a layer"),
    reactOutput(ns("layer"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {

    output$layer <- renderReact({
      box <- div(
        style = "background-color: #60C7FF; margin: 10px; padding: 10px",
        "Hello!"
      )
      if (isTRUE(input$useLayer)) Layer(box)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
