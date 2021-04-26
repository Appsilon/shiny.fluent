library(shiny.fluent)

if (interactive()) {
  style <- list(fontSize = 50, margin = 10)
  shinyApp(
    ui = tags$div(
      FontIcon(iconName = "CompassNW", style = style),
      FontIcon(iconName = "Dictionary", style = style),
      FontIcon(iconName = "TrainSolid", style = style)
    ),
    server = function(input, output) {}
  )
}
