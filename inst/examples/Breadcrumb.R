library(shiny)
library(shiny.fluent)

items <- list(
  list(text = "Files", key = "Files", href = "#/page"),
  list(text = "Folder 1", key = "f1", href = "#/page"),
  list(text = "Folder 2", key = "f2", href = "#/page"),
  list(text = "Folder 3", key = "f3", href = "#/page"),
  list(text = "Folder 4 (non-clickable)", key = "f4"),
  list(text = "Folder 5", key = "f5", href = "#/page", isCurrentItem = TRUE)
)

ui <- function(id) {
  Breadcrumb(
    items = items,
    maxDisplayedItems = 3,
    ariaLabel = "Breadcrumb with items rendered as links",
    overflowAriaLabel = "More links"
  )
}
server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
