library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = div(
      DefaultButton.shinyInput("showDialog", text = "Open dialog"),
      reactOutput("reactDialog")
    ),
    server = function(input, output) {
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
          onDismiss = JS("function() { Shiny.setInputValue('hideDialog', Math.random()); }"),
          dialogContentProps = dialogContentProps,
          modalProps = list(),
          DialogFooter(
            PrimaryButton.shinyInput("dialogSend", text = "Send"),
            DefaultButton.shinyInput("dialogDontSend", text = "Don't send")
          )
        )
      })

      observeEvent(input$showDialog, isDialogOpen(TRUE))
      observeEvent(input$hideDialog, isDialogOpen(FALSE))
      observeEvent(input$dialogSend, isDialogOpen(FALSE))
      observeEvent(input$dialogDontSend, isDialogOpen(FALSE))
    }
  )
}
