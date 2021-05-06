library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
      div(
        p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
        Shimmer(),
        Shimmer(width = "75%"),
        Shimmer(width = "50%")
      ),
      tags$head(tags$style(
        ".ms-Shimmer-container { margin: 10px 0 }"
      ))
    ),
    server = function(input, output) {}
  )
}
