library(shiny.fluent)

if (interactive()) {
  items <- do.call(paste0, replicate(20, sample(LETTERS, 200, TRUE), FALSE))
  shinyApp(
    ui = div(
      style = "overflow: auto; max-height: 400px",
      List(
        items = items,
        onRenderCell = JS("(item, index) => `${index} ${item}`")
      )
    ),
    server = function(input, output) {}
  )
}
