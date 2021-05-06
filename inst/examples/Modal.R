library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
      reactOutput("modal"),
      PrimaryButton.shinyInput("showModal", text = "Show modal"),
    ),
    server = function(input, output) {
      modalVisible <- reactiveVal(FALSE)
      observeEvent(input$showModal, modalVisible(TRUE))
      observeEvent(input$hideModal, modalVisible(FALSE))
      output$modal <- renderReact({
        Modal(isOpen = modalVisible(),
          Stack(tokens = list(padding = "15px", childrenGap = "10px"),
            div(style = list(display = "flex"),
              Text("Title", variant = "large"),
              div(style = list(flexGrow = 1)),
              IconButton.shinyInput("hideModal", iconProps = list(iconName = "Cancel")),
            ),
            div(
              p("A paragraph of text."),
              p("Another paragraph.")
            )
          )
        )
      })
    }
  )
}
