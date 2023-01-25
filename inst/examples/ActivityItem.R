library(shiny.fluent)

ui <- function(id) {
  ActivityItem(
    activityDescription = tagList(
      Link(key = 1, "Philippe Lampros"),
      tags$span(key = 2, " commented")
    ),
    activityIcon = Icon(iconName = "Message"),
    comments = tagList(
      tags$span(key = 1, "Hello! I am making a comment.")
    ),
    timeStamp = "Just now"
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
