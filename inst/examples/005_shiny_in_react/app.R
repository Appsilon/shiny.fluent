library(shiny.fluent)

ui <- fluidPage(
  titlePanel("Shiny tags and outputs inside React components"),
  Stack(
    textInput("textInput", "Shiny input test", value = "aaa"),
    textOutput("textOutput")
  )
)

server <- function(input, output) {
  output$textOutput <- renderText({
    sprintf("You entered: %s", input$textInput)
  })
}

shinyApp(ui, server)
