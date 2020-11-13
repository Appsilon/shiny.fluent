# Broken: React complains that img tags are void elements and must not have children.
# My guess is that we always provide a children prop to components
# (even if it's an empty list) and React doesn't like it in this case.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Image(src = "http://placehold.it/350x150")
    ),
    server = function(input, output) {
    }
  )
}
