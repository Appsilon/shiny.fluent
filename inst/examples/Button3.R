
# Example 3
library(shiny)
library(shiny.fluent)
library(shinyjs)

# This example app shows how to use a Fluent UI Button to trigger a file upload.
# File upload is not natively supported by shiny.fluent, so shinyjs is used
# to trigger the file upload input.
ui <- fluentPage(
  useShinyjs(),
  Stack(
    tokens = list(
      childrenGap = 10L
    ),
    horizontal = TRUE,
    DefaultButton.shinyInput(
      inputId = "uploadFileButton",
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
        inputId = "uploadFile",
        label = NULL
      )
    )
  ),
  textOutput("file_path")
)

server <- function(input, output) {
  observeEvent(input$uploadFileButton, {
    click("uploadFile")
  })

  output$file_path <- renderPrint({
    input$uploadFile
  })
}

shinyApp(ui, server)
