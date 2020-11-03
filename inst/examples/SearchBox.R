library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        SearchBox("search", placeholder = "Search"),
        textOutput("searchValue")
      )
    ),
    server = function(input, output) {
      output$searchValue <- renderText({
        sprintf("Value: %s", input$search)
      })
    }
  )
}
