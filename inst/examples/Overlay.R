library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DefaultButton.shinyInput("toggleOverlay", text = "Open Overlay"),
      reactOutput("overlay")
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleOverlay, show(!show()))
      output$overlay <- renderReact({
        if (show()) {
          Overlay(
            onClick = JS("function() { Shiny.setInputValue('toggleOverlay', Math.random()); }"),
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
    }
  )
}
