library(shiny.fluent)

ui <- fluidPage(
  titlePanel("Action buttons"),
  p("When the button is first rendered, no event is generated - exactly like with actionButton"),
  h4("Click any button to refresh the plot."),
  Stack(horizontal = TRUE, tokens = list(childrenGap = 20),
    DefaultButton.shinyInput("button1", text = "Default Button"),
    PrimaryButton.shinyInput("button2", text = "Primary Button"),
    CompoundButton.shinyInput("button3",
      text="Compound Button",
      secondaryText = "Compound Button has additional text"
    ),
    ActionButton.shinyInput("button4",
      text = "Action Button",
      iconProps = list("iconName" = 'AddFriend')
    )
  ),
  plotOutput("plot")
)

server <- function(input, output) {
  randomVals <- reactiveVal(runif(50))

  observe({
    input$button1
    input$button2
    input$button3
    input$button4
    randomVals(runif(50))
  })

  output$plot <- renderPlot({
    hist(randomVals())
  })
}

shinyApp(ui, server)
