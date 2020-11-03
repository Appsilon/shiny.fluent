library(shiny.fluent)
library(stringi)

if (interactive()) {
  pane <- function(header, paragraphs) (
    div(
      Sticky(
        div(
          style = "background-color: #80CAF1; border-top: 1px solid; border-bottom: 1px solid",
          header
        )
      ),
      stri_rand_lipsum(paragraphs)
    )
  )
  shinyApp(
    ui = withReact(
      ScrollablePane(
        styles = list(
          root = list(height = "500px", width = "400px")
        ),
        pane("Some text", 3),
        pane("A lot of text", 5),
        pane("Just a short ending", 1)
      )
    ),
    server = function(input, output) {
    }
  )
}
