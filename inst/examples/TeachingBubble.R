library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      div(
        DefaultButton("toggle", text = "Button"),
        TeachingBubble(
          target = "#toggle",
          headline = "Very useful!"
        )
      )
    ),
    server = function(input, output) {
    }
  )
}
