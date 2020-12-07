library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
      tags$script(HTML("
Fluent = window['shiny.fluent']
Fluent.loadTheme({
  defaultFontStyle: { fontFamily: 'Times New Roman', fontWeight: 'regular' }
})
")),
      withReact(
        Label('The default theme font has been changed to Times New Roman in this example')
      )
    ),
    server = function(input, output) {
    }
  )
}
