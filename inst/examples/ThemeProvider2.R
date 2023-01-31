
# Example 2
library(shiny)
library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B")
)

# Use JSON created in Theme Designer
# https://fabricweb.z5.web.core.windows.net/pr-deploy-site/refs/heads/master/theming-designer/
theme <- '{
  "themePrimary": "#324f09",
  "themeLighterAlt": "#dfead1",
  "themeLighter": "#c4d7ab",
  "themeLight": "#abc388",
  "themeTertiary": "#92b069",
  "themeSecondary": "#7c9c4e",
  "themeDarkAlt": "#678937",
  "themeDark": "#547624",
  "themeDarker": "#426214",
  "neutralLighterAlt": "#f8ebce",
  "neutralLighter": "#f4e8cb",
  "neutralLight": "#eadec2",
  "neutralQuaternaryAlt": "#dacfb5",
  "neutralQuaternary": "#d0c5ad",
  "neutralTertiaryAlt": "#c8bea6",
  "neutralTertiary": "#595858",
  "neutralSecondary": "#373636",
  "neutralPrimaryAlt": "#2f2e2e",
  "neutralPrimary": "#000000",
  "neutralDark": "#151515",
  "black": "#0b0b0b",
  "white": "#fff2d4"
}'

ui <- function(id) {
  ns <- NS(id)
  ThemeProvider(
    theme = parseTheme(json = theme),
    # Using this `ifelse` because the dashboard view is not compatible
    # with `body`, as the background is kept the same as the parent app (dashboard)
    applyTo = ifelse(id == "app-sample", "body", "element"),
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
  shinyApp(ui("app-sample"), function(input, output) server("app-sample"))
}
