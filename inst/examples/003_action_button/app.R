library(shiny)
library(shiny.fluent)

ui <- fluidPage(
  titlePanel("Action buttons"),
  p("When the button is first rendered, no event is generated - exactly like with actionButton"),
  h4("Click any button to refresh the plot."),
  withReact(
    Stack(
      DefaultButton("button1", text="Default Button", styles=list("background: green")),
      PrimaryButton("button2", text="Primary Button"),
      CompoundButton("button3", secondaryText="Compound Button has additional text", text="Compound Button"),
      ActionButton("button4", iconProps=list("iconName" = 'AddFriend'), text="Action Button"),
      horizontal=TRUE,
      tokens=list(childrenGap=20)
    )
  ),
  plotOutput("plot")
)

server <- function(input, output, session) {

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
