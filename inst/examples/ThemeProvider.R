# Example 1
library(shiny)
library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B")
)
theme <- list(
  palette = list(
    themePrimary = "#8dd400",
    themeLighterAlt = "#060800",
    themeLighter = "#172200",
    themeLight = "#2a3f00",
    themeTertiary = "#557f00",
    themeSecondary = "#7cba00",
    themeDarkAlt = "#97d816",
    themeDark = "#a6de35",
    themeDarker = "#bce766",
    neutralLighterAlt = "#323130",
    neutralLighter = "#31302f",
    neutralLight = "#2f2e2d",
    neutralQuaternaryAlt = "#2c2b2a",
    neutralQuaternary = "#2a2928",
    neutralTertiaryAlt = "#282726",
    neutralTertiary = "#c8c8c8",
    neutralSecondary = "#d0d0d0",
    neutralPrimaryAlt = "#dadada",
    neutralPrimary = "#ffffff",
    neutralDark = "#f4f4f4",
    black = "#f8f8f8",
    white = "#323130"
  )
)

ui <- function(id) {
  ns <- NS(id)
  ThemeProvider(
    theme = theme,
    Stack(
      tokens = list(childrenGap = "10px"),
      style = list(width = 250),
      PrimaryButton(text = "PrimaryButton"),
      Checkbox(label = "Checkbox"),
      ChoiceGroup(label = "ChoiceGroup", options = options)
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
