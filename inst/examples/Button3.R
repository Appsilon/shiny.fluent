
# Example 3: File Upload with Fluent UI Buttons
library(shiny)
library(shiny.fluent)

# This example demonstrates FileUploadButton - a native Fluent UI file upload component
# that works across all browsers, including Safari.

ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    h3("File Upload with Fluent UI"),
    p("Native file upload components with full cross-browser support:"),
    
    Stack(
      tokens = list(childrenGap = 20),
      horizontal = FALSE,
      
      # Primary button for important uploads
      div(
        Text(variant = "mediumPlus", "Upload Data Files"),
        FileUploadButton.shinyInput(
          inputId = ns("data_files"),
          text = "Choose Data Files",
          buttonType = "primary",
          icon = "Upload",
          accept = ".xlsx,.csv,.json",
          multiple = TRUE
        )
      ),
      
      # Default button for documents
      div(
        Text(variant = "mediumPlus", "Upload Document"),
        FileUploadButton.shinyInput(
          inputId = ns("document"),
          text = "Choose Document", 
          buttonType = "default",
          icon = "TextDocument",
          accept = ".pdf,.docx,.txt"
        )
      ),
      
      # Compound button with description
      div(
        Text(variant = "mediumPlus", "Upload Images"),
        FileUploadButton.shinyInput(
          inputId = ns("images"),
          text = "Choose Images",
          buttonType = "compound", 
          icon = "Photo2",
          accept = ".png,.jpg,.jpeg,.gif",
          multiple = TRUE
        )
      )
    ),
    
    br(),
    h4("Upload Status:"),
    div(
      uiOutput(ns("data_files_status")),
      uiOutput(ns("document_status")), 
      uiOutput(ns("images_status"))
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    # Handle data files upload
    observeEvent(input$data_files, {
      req(input$data_files)
      # Handle multiple files (array) or single file (object) 
      if (is.list(input$data_files) && !is.null(names(input$data_files))) {
        # Single file object with named elements
        files <- input$data_files$name
      } else if (is.list(input$data_files)) {
        # Array of file objects
        files <- paste(sapply(input$data_files, function(f) f$name), collapse = ", ")
      } else {
        # Fallback
        files <- "Unknown file format"
      }
      output$data_files_status <- renderUI({
        MessageBar(
          messageBarType = 1, # success
          paste("✅ Data files uploaded:", files)
        )
      })
    })
    
    # Handle document upload
    observeEvent(input$document, {
      req(input$document)
      output$document_status <- renderUI({
        MessageBar(
          messageBarType = 1, # success
          paste("📄 Document uploaded:", input$document$name)
        )
      })
    })
    
    # Handle images upload
    observeEvent(input$images, {
      req(input$images)
      # Handle multiple files (array) or single file (object)
      if (is.list(input$images) && !is.null(names(input$images))) {
        # Single file object
        files <- paste("Image uploaded:", input$images$name)
      } else if (is.list(input$images)) {
        # Array of file objects
        files <- paste(length(input$images), "images:", 
                      paste(sapply(input$images, function(f) f$name), collapse = ", "))
      } else {
        # Fallback
        files <- "Unknown file format"
      }
      output$images_status <- renderUI({
        MessageBar(
          messageBarType = 1, # success
          paste("🖼️", files)
        )
      })
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
