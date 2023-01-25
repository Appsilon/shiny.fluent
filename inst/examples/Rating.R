library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Rating.shinyInput(ns("rating"), value = 2),
    textOutput(ns("ratingValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$ratingValue <- renderText({
      sprintf("Value: %s", input$rating)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
