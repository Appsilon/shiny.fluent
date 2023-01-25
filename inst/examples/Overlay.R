library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("toggleOverlay"), text = "Open Overlay"),
    reactOutput(ns("overlay"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    show <- reactiveVal(FALSE)
    observeEvent(input$toggleOverlay, show(!show()))
    output$overlay <- renderReact({
      if (show()) {
        Overlay(
          onClick = JS(
            paste0(
              "function() { ",
              "Shiny.setInputValue('", ns("toggleOverlay"), "', Math.random()); ",
              "}"
            )
          ),
          isDarkThemed = TRUE,
          div(
            style="background: white; width: 50vw; height: 20rem; margin: auto;",
            div(
              style = "padding: 2rem;",
              h1("Inside Overlay"),
              p("Click anywhere to hide.")
            )
          )
        )
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
