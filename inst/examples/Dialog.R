library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("showDialog", text = "Open dialog"),
        reactOutput("reactDialog")
      )
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
        
        reactWidget(
          Dialog(
            hidden=!isDialogOpen(),
            onDismiss=JS("function() { Shiny.setInputValue('hideDialog', Math.random()); }"),
            dialogContentProps=dialogContentProps,
            modalProps=list(),
            ShinyComponentWrapper(
              DialogFooter(
                PrimaryButton("dialogSend", text="Send"),
                DefaultButton("dialogDontSend", text="Don't send")
              )
            )
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
