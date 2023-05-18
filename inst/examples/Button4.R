
# Example 4
library(shiny)
library(shiny.fluent)
library(shinyjs)

# This example app shows how to use a Fluent UI Button to trigger a file download.
# File download is not natively supported by shiny.fluent, so shinyjs is used
# to trigger the file upload input.
ui <- fluentPage(
  useShinyjs(),
  DefaultButton.shinyInput(
    "downloadButton",
    text = "Download",
    iconProps = list(iconName = "Download")
  ),
  div(
    style = "visibility: hidden;",
    downloadButton("download", label = "")
  )
)

server <- function(input, output, session) {
  observeEvent(input$downloadButton, {
    click("download")
  })

  output$download <- downloadHandler(
    filename = function() {
      paste("data-", Sys.Date(), ".csv", sep="")
    },
    content = function(file) {
      write.csv(iris, file)
    }
  )
}

shinyApp(ui, server)
