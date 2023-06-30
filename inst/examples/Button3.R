
# Example 3
library(shiny)
library(shiny.fluent)
library(shinyjs)

# This example app shows how to use a Fluent UI Button to trigger a file upload.
# File upload is not natively supported by shiny.fluent, so shinyjs is used
# to trigger the file upload input.
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    useShinyjs(),
    Stack(
      tokens = list(
        childrenGap = 10L
      ),
      horizontal = TRUE,
      DefaultButton.shinyInput(
        inputId = ns("uploadFileButton"),
        text = "Upload File",
        iconProps = list(iconName = "Upload")
      ),
      div(
        style = "
          visibility: hidden;
          height: 0;
          width: 0;
        ",
        fileInput(
          inputId = ns("uploadFile"),
          label = NULL
        )
      )
    ),
    textOutput("file_path")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$uploadFileButton, {
      click("uploadFile")
    })

    output$file_path <- renderText({
      input$uploadFile$name
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
