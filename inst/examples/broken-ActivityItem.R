# Broken: Need to pass React elements via props to make a useful example.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      ActivityItem(
        # activityDescription = list(
        #   Link(key = 1, "Philippe Lampros"),
        #   tags$span(key = 2, "commented")
        # ),
        # activityIcon = Icon(iconName = "Message"),
        activityIcon = JS("React.createElement(window['shiny.fluent'].Icon, { iconName: 'Message' })"),
        # comments = list(
        #   tags$span(key = 1, "Hello! I am making a comment.")
        # ),
        timeStamp = "Just now"
      )
    ),
    server = function(input, output) {
    }
  )
}
