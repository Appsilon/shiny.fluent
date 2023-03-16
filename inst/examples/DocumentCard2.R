
# Example 2
library(shiny)
library(shiny.fluent)

# Using icons in DocumentCardActions
ui <- function(id) {
  previewImages <- list(
    list(
      previewImageSrc = "https://picsum.photos/318/196",
      width = 318,
      height = 200
    )
  )
  fluidPage(
    DocumentCard(
      DocumentCardPreview(previewImages = previewImages),
      DocumentCardTitle(
        title = "Card",
        shouldTruncate = TRUE
      ),
      DocumentCardActivity(
        activity = "2022-03-23",
        people = list(list(name = "Annie Lindqvist"))
      ),
      DocumentCardActions(
        actions = list(
          list(
            iconProps = list(iconName = "Share"),
            onClick = JS("function() { alert('share icon clicked') }")
          ),
          list(
            iconProps = list(iconName = "Pin"),
            onClick = JS("function() { alert('pin icon clicked') }")
          ),
          list(
            iconProps = list(iconName = "Ringer"),
            onClick = JS("function() { alert('ringer icon clicked') }")
          )
        )
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
