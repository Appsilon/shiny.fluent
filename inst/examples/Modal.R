library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    reactOutput(ns("modal")),
    PrimaryButton.shinyInput(ns("showModal"), text = "Show modal"),
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    modalVisible <- reactiveVal(FALSE)
    observeEvent(input$showModal, modalVisible(TRUE))
    observeEvent(input$hideModal, modalVisible(FALSE))
    output$modal <- renderReact({
      Modal(isOpen = modalVisible(),
        Stack(tokens = list(padding = "15px", childrenGap = "10px"),
          div(style = list(display = "flex"),
            Text("Title", variant = "large"),
            div(style = list(flexGrow = 1)),
            IconButton.shinyInput(
              ns("hideModal"),
              iconProps = list(iconName = "Cancel")
            ),
          ),
          div(
            p("A paragraph of text."),
            p("Another paragraph.")
          )
        )
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
