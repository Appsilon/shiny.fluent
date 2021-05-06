library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = Persona(
      imageInitials = "AL",
      text = "Annie Lindqvist",
      secondaryText = "Software Engineer",
      presence = 4
    ),
    server = function(input, output) {}
  )
}
