library(shiny.fluent)
library(leaflet)

ui <- fluidPage(
  titlePanel("React components in a Shiny layout"),
  checkboxInput("showui", label = "Show components?", value = TRUE),
  uiOutput("ui")
)

server <- function(input, output) {
  showBubble <- reactiveVal(FALSE)
  showModal <- reactiveVal(FALSE)

  observeEvent(input$toggle, showBubble(!showBubble()))
  observeEvent(input$showModal, showModal(TRUE))
  observeEvent(input$hideModal, showModal(FALSE))

  output$ui <- renderUI({
    if (input$showui) {
      div(
        numericInput("count", label = "Insert some value", value = 0),
        reactOutput("reactOutput1")
      )
    }
  })

  output$reactOutput1 <- renderReact(list(
    h3("Label"),
    Label(paste("I'm a Label with count value = ", input$count)),
    h3("Static buttons"),
    Stack(horizontal = TRUE, tokens = list(childrenGap = 20),
      PrimaryButton(text = "Button 1"),
      PrimaryButton(text = "Button 2"),
      PrimaryButton(text = "Button 3")
    ),
    h3("Teaching Bubble"),
    DefaultButton.shinyInput("toggle", id = "target", text = "Toggle Teaching Bubble"),
    if (showBubble()) TeachingBubble("Very useful!", target = "#target"),
    h3("Modal"),
    DefaultButton.shinyInput("showModal", text = "Show modal"),
    Modal(isOpen = showModal(), isBlocking = FALSE, div(
      style = "margin: 20px",
      h1("This is an important message"),
      p("Read this text to learn more."),
      DefaultButton.shinyInput("hideModal", text = "Close")
    )),
    h3("Pivot"),
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"), leafletOutput("mymap"))
    )
  ))

  points <- cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)

  output$mymap <- renderLeaflet({
    leaflet() %>% addTiles() %>% addMarkers(data = points)
  })
}

shinyApp(ui, server)
