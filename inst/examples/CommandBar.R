library(shiny)
library(shiny.fluent)

items <- function(ns) {
  list(
    CommandBarItem(
      key = ns("newItem"),
      text = "New",
      cacheKey = "myCacheKey",
      split = TRUE,
      iconProps = list(iconName = "Add"),
      subMenuProps = list(
        items = list(
          CommandBarItem(
            key = ns("emailMessage"),
            text = "Email message",
            iconProps = list(iconName = "Mail")
          ),
          CommandBarItem(
            key = ns("calendarEvent"),
            text = "Calendar event",
            iconProps = list(iconName = "Calendar")
          )
        )
      )
    ),
    CommandBarItem(
      key = ns("upload"),
      text = "Upload",
      iconProps = list(iconName = "Upload")
    ),
    CommandBarItem(
      key = ns("share"),
      text = "Share",
      iconProps = list(iconName = "Share")
    ),
    CommandBarItem(
      key = ns("download"),
      text = "Download",
      iconProps = list(iconName = "Download")
    )
  )
}

farItems <- function(ns) {
  list(
    CommandBarItem(
      key = ns("tile"),
      text = "Grid view",
      ariaLabel = "Grid view",
      iconOnly = TRUE,
      iconProps = list(iconName = "Tiles")
    ),
    CommandBarItem(
      key = ns("info"),
      text = "Info",
      ariaLabel = "Info",
      iconOnly = TRUE,
      iconProps = list(iconName = "Info")
    )
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CommandBar(
      items = items(ns),
      farItems = farItems(ns)
    ),
    textOutput(ns("commandBarItems")),
    CommandBar.shinyInput(
      inputId = ns("commandBar"),
      items = items(identity),
      farItems = farItems(identity)
    ),
    textOutput(ns("commandBar"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    commandBarItemClicked <- reactiveVal()
    observeEvent(input$newItem, commandBarItemClicked("newItem clicked (explicitly observed)"))
    observeEvent(input$upload, commandBarItemClicked("upload clicked (explicitly observed)"))
    output$commandBarItems <- renderText(commandBarItemClicked())
    output$commandBar <- renderText(input$commandBar)
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
