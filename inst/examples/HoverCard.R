library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = HoverCard(
      type = "PlainCard",
      plainCardProps = JS("{
        onRenderPlainCard: (a, b, c) => 'HoverCard contents',
        style: { margin: 10 }
      }"),
      "Hover over me"
    ),
    server = function(input, output) {}
  )
}
