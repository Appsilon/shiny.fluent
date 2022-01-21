library(shiny)
library(shiny.fluent)

if (interactive()) { 
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
  shinyApp(
    ui = ThemeProvider(
      theme = theme,
      applyTo = "body",
      Stack(
        tokens = list(childrenGap = "10px"),
        style = list(width = 250),
        PrimaryButton(text = "PrimaryButton"),
        Checkbox(label = "Checkbox"),
        ChoiceGroup(label = "ChoiceGroup", options = options)
      )
    ),
    server = function(input, output) { }
  )
}

if (interactive()) {
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
  writeLines(theme, "theme.json")

  shinyApp(
    ui = ThemeProvider(
      theme = "theme.json",
      applyTo = "body",
      Stack(
        tokens = list(childrenGap = "10px"),
        style = list(width = 250),
        PrimaryButton(text = "PrimaryButton"),
        Checkbox(label = "Checkbox"),
        ChoiceGroup(label = "ChoiceGroup", options = options)
      )
    ),
    server = function(input, output) { }
  )
}
