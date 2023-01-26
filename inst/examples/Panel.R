library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("showPanel"), text = "Open panel"),
    reactOutput(ns("reactPanel"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isPanelOpen <- reactiveVal(FALSE)
    output$reactPanel <- renderReact({
      Panel(
        headerText = "Sample panel",
        isOpen = isPanelOpen(),
        "Content goes here.",
        onDismiss = JS(
          paste0(
            "function() { ",
            "Shiny.setInputValue('", ns("hidePanel"), "', Math.random()); ",
            "}"
          )
        )
      )
    })
    observeEvent(input$showPanel, isPanelOpen(TRUE))
    observeEvent(input$hidePanel, isPanelOpen(FALSE))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
