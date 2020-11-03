# Broken: JS() nested in planCardProps doesn't work.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      HoverCard(
        type = "PlainCard",
        plainCardProps = list(
          onRenderPlainCard = JS("(a, b, c) => 'HoverCard contents'"),
          style = list(margin = 10)
        ),
        onRenderPlainCard = JS("(a, b, c) => 'HoverCard contents'"),
        "Hover over me"
      )
    ),
    server = function(input, output) {
    }
  )
}
