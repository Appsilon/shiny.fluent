library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      SearchBox.shinyInput("search", placeholder = "Search"),
      textOutput("searchValue")
    ),
    server = function(input, output) {
      output$searchValue <- renderText({
        sprintf("Value: %s", input$search)
      })
    }
  )
}
