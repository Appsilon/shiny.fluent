library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("showModal", text = "Open modal"),
        reactOutput("reactModal")
      )
    ),
    server = function(input, output) {
      isModalOpen <- reactiveVal(FALSE)
      output$reactModal <- renderReact({
        reactWidget(
          Modal(isOpen=isModalOpen(), isBlocking=FALSE, div(
            style = "margin: 20px",
            h1("This is an important message"),
            p("Read this text to learn more."),
            ShinyComponentWrapper(DefaultButton("hideModal", text="Close"))))
        )
      })
      observeEvent(input$showModal, { isModalOpen(TRUE) })
      observeEvent(input$hideModal, { isModalOpen(FALSE) })
    }
  )
}
