library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("showDialog"), text = "Open dialog"),
    reactOutput(ns("reactDialog"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isDialogOpen <- reactiveVal(FALSE)
    output$reactDialog <- renderReact({
      dialogContentProps <- list(
        type=0,
        title='Missing Subject',
        closeButtonAriaLabel='Close',
        subText='Do you want to send this message without a subject?'
      )
      Dialog(
        hidden = !isDialogOpen(),
        onDismiss = JS(
          paste0(
            "function() { ",
            "Shiny.setInputValue('", ns("hideDialog"),"', Math.random()); ",
            "}"
          )
        ),
        dialogContentProps = dialogContentProps,
        modalProps = list(),
        DialogFooter(
          PrimaryButton.shinyInput(ns("dialogSend"), text = "Send"),
          DefaultButton.shinyInput(ns("dialogDontSend"), text = "Don't send")
        )
      )
    })

    observeEvent(input$showDialog, isDialogOpen(TRUE))
    observeEvent(input$hideDialog, isDialogOpen(FALSE))
    observeEvent(input$dialogSend, isDialogOpen(FALSE))
    observeEvent(input$dialogDontSend, isDialogOpen(FALSE))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
