library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
      tags$script(HTML("
        Fluent = jsmodule['@fluentui/react']
        Fluent.loadTheme({
          defaultFontStyle: { fontFamily: 'Times New Roman', fontWeight: 'regular' }
        })
      ")),
      Label('The default theme font has been changed to Times New Roman in this example')
    ),
    server = function(input, output) {}
  )
}
