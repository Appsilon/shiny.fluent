library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggleOverlay", text = "Open Overlay"),
        reactOutput("overlay", height=NULL)
      )
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleOverlay, {
        show(isolate(!show()))
      })
      output$overlay <- renderReact({
        reactWidget(
          if (show()) {
            Overlay(
              onClick=JS("function() { Shiny.setInputValue('toggleOverlay', Math.random()); }"),
              isDarkThemed = TRUE,
              div(
                style="background: white; width: 50vw; height: 20rem; margin: auto;",
                div(
                  style="padding: 2rem;",
                  h1("Inside Overlay"),
                  p("Click anywhere to hide.")
                )
              )
            )
          }
        )
      })
    }
  )
}
