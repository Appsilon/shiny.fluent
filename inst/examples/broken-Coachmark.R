# Broken: Seems to require the use of refs to attach to an element.
library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = withReact(
      Coachmark("Helpful text")
    ),
    server = function(input, output) {
    }
  )
}
