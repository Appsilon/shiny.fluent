library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("toggleCallout"), text = "Toggle Callout"),
    reactOutput(ns("callout"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    show <- reactiveVal(FALSE)
    observeEvent(input$toggleCallout, show(!show()))
    output$callout <- renderReact({
      if (show()) {
        Callout(
          tags$div(
            style = "margin: 10px",
            "Callout contents"
          )
        )
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}