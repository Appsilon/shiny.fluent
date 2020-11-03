library(shiny)
library(shiny.fluent)
library(leaflet)

ui <- fluidPage(
  titlePanel("Shiny tags and outputs inside React components"),
  withReact(
    div(
      textInput("input1", "Shiny input test", value="aaa"),
      textOutput("textOutput1")
      #TODO: Add more Shiny inputs, outputs here.
    )
  )
)

server <- function(input, output, session) {
  output$textOutput1 <- renderText({
    sprintf("You entered: %s", input$input1)
  })
}

shinyApp(ui, server)
