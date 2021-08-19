iconStyle <- list(
  width = "50px", height = "50px", fontSize = "50px", margin = "10px", color = "deepskyblue"
)

reactInShinyUI <- function(id) {
  ns <- NS(id)
  div(
    h1("React components in a Shiny layout"),
    h3("Label"),
    Label("I'm a Label", id = ns("label")),
    h3("Icons"),
    Stack(
      horizontal = TRUE,
      FontIcon(iconName = "CompassNW", style = iconStyle, id = ns("compass"))
    ),
    h3("Spinners"),
    Stack(
      tokens = list(childrenGap = 20, maxWidth = 250),
      div(
        Label("Spinner with label positioned below"),
        Spinner(label = "I am definitely loading...", id = ns("spinner"))
      )
    ),
    h1("React components in a dynamic Shiny layout"),
    checkboxInput(ns("showui"), label = "Show components?", value = TRUE),
    uiOutput(ns("ui"))
  )
}

reactInShinyServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    showBubble <- reactiveVal(FALSE)
    showModal <- reactiveVal(FALSE)
    
    observeEvent(input$toggle, showBubble(!showBubble()))
    observeEvent(input$showModal, showModal(TRUE))
    observeEvent(input$hideModal, showModal(FALSE))
    
    output$ui <- renderUI({
      if (input$showui) {
        div(
          numericInput(ns("count"), label = "Insert some value", value = 0),
          reactOutput(ns("reactOutput1"))
        )
      }
    })
    
    output$reactOutput1 <- renderReact(list(
      h3("Label"),
      Label(paste("I'm a Label with count value = ", input$count), `data-cy` = ns("label")),
      h3("Static buttons"),
      Stack(
        horizontal = TRUE, 
        tokens = list(childrenGap = 20),
        PrimaryButton(text = "PrimaryButton", `data-cy` = ns("primaryButton"))
      ),
      h3("Teaching Bubble"),
      DefaultButton.shinyInput(ns("toggle"), id = "target", text = "Toggle Teaching Bubble", `data-cy` = ns("toggle")),
      if (showBubble()) TeachingBubble("Very useful!", target = "#target", `data-cy` = ns("teachingBubble")),
      h3("Modal"),
      DefaultButton.shinyInput(ns("showModal"), text = "Show modal", `data-cy` = ns("showModal")),
      Modal(
        `data-cy` = ns("modal"),
        isOpen = showModal(),
        isBlocking = FALSE, 
        div(
          style = "margin: 20px",
          h1("This is an important message", `data-cy` = ns("modal-h1")),
          p("Read this text to learn more.", `data-cy`= ns("modal-p")),
          DefaultButton.shinyInput(ns("hideModal"), text = "Close", `data-cy` = ns("hideModal"))
        )
      ),
      h3("Pivot"),
      Pivot(
        `data-cy` = ns("pivot"),
        PivotItem(headerText = "Tab 1", Label("Hello 1")),
        PivotItem(headerText = "Tab 2", Label("Hello 2", `data-cy` = ns("pivotLabel")), leafletOutput(ns("map")))
      )
    ))
    
    points <- cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
    
    output$map <- renderLeaflet({
      leaflet() %>% addTiles() %>% addMarkers(data = points)
    })
  })
}
