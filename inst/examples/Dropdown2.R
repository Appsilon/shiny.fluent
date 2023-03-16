
# Example 2
library(shiny)
library(shiny.fluent)

# Rendering headers and dividers inside dropdown
DropdownMenuItemType <- function(type) {
  JS(paste0("jsmodule['@fluentui/react'].DropdownMenuItemType."), type)
}

ui <- function(id) {
  fluentPage(
    Dropdown(
      "fruit",
      label = "Fruit",
      multiSelect = TRUE,
      options = list(
        list(
          key = "fruitsHeader",
          text = "Fruit",
          itemType = DropdownMenuItemType("Header")
        ),
        list(key = "apple", text = "Apple"),
        list(key = "banana", text = "Banana"),
        list(key = "orange", text = "Orange", disabled = TRUE),
        list(key = "grape", text = "Grape"),
        list(
          key = "divider_1",
          text = "-",
          itemType = DropdownMenuItemType("Divider")
        ),
        list(
          key = "vegetablesHeader",
          text = "Vegetables",
          itemType = DropdownMenuItemType("Header"
          )
        ),
        list(key = "broccoli", text = "Broccoli"),
        list(key = "carrot", text = "Carrot"),
        list(key = "lettuce", text = "Lettuce")
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
