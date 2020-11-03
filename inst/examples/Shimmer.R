library(shiny.fluent)

if (interactive()) {
  ui <- tagList(
    withReact(
      div(
        p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
        Shimmer(),
        Shimmer(width = "75%"),
        Shimmer(width = "50%")
      )
    ),
    tags$head(tags$style(
      ".ms-Shimmer-container { margin: 10px 0 }"
    ))
  )

  shinyApp(
    ui = ui,
    server = function(input, output) {
    }
  )
}
