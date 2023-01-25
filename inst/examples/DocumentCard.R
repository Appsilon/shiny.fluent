library(shiny.fluent)

title <- "Long_file_name_with_underscores_used_to_separate_all_of_the_words"

previewImages <- list(
  list(
    previewImageSrc = "https://picsum.photos/318/196",
    width = 318,
    height = 196
  )
)

ui <- function(id) {
  ns <- NS(id)
  DocumentCard(
    DocumentCardPreview(previewImages = previewImages),
    DocumentCardTitle(
      title = title,
      shouldTruncate = TRUE
    ),
    DocumentCardActivity(
      activity = "Created a few minutes ago",
      people = list(list(name = "Annie Lindqvist"))
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
