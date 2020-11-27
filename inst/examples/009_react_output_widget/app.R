library(shiny)
library(shiny.react)
library(shiny.fluent)
library(leaflet)

ui <- fluidPage(
  titlePanel("React components in a Shiny layout"),
  checkboxInput("showui", label="Show components?", value=TRUE),
  uiOutput("ui"),
  withReact(
    Label("deps")
  )
)

server <- function(input, output, session) {
  showBubble <- reactiveVal(FALSE)
  showModal <- reactiveVal(FALSE)
  
  observeEvent(input$toggle, {
    showBubble(isolate(!showBubble()))
  })
  
  observeEvent(input$showModal, { showModal(TRUE) })
  observeEvent(input$hideModal, { showModal(FALSE) })
  
  output$ui <- renderUI({
    if(input$showui) {
      div(
        numericInput("count", label="Insert some value", value = 0),
        reactOutput("reactOutput1")
      )
    }
  })
  
  output$reactOutput1 <- renderReact({
    reactWidget(
      h3("Label"),
      Label(paste("I'm a Label with count value = ", input$count)),
      Stack(PrimaryButton("Button1", text="Button 1"), PrimaryButton("Button2", text="Button 2"), PrimaryButton("Button3", text="Button 3"), horizontal=TRUE, tokens=list(childrenGap=20)),
      h3("Teaching Bubble"),
      DefaultButton("toggle", text = "Toggle Teaching Bubble"),
      # NOTE: we need to watch showui here to make sure that TeachingBubble hides when the containing UI is hidden.
      # It does not happen automatically.
      if (showBubble() && input$showui) {
        TeachingBubble("Very useful!", target="#toggle")
      } else {
        span()
      },
      h3("Modal"),
      DefaultButton("showModal", text = "Show modal"),
      Modal(isOpen=showModal(), isBlocking=FALSE, div(
        style = "margin: 20px",
        h1("This is an important message"),
        p("Read this text to learn more."),
        ShinyComponentWrapper(DefaultButton("hideModal", text="Close")))),
      h3("Pivot"),
      Pivot(
        PivotItem(headerText="Tab 1", Label("Hello 1")),
        PivotItem(headerText="Tab 2", Label("Hello 2"), 
                  leafletOutput("mymap"))
      )
    )
  })
  
  points <- cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite,
                       options = providerTileOptions(noWrap = TRUE)
      ) %>%
      addMarkers(data = points)
  })
}

shinyApp(ui, server)
