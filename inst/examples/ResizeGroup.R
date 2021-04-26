library(shiny.fluent)

if (interactive()) {
  data <- list(
    items = list(
      "many", "strings", "with", "varying", "length", "sometimes", "very", "short",
      "other", "times", "extraordinarily", "long"
    )
  )
  onRenderData <- JS("data =>
    data.items.map(item =>
      jsmodule['react'].createElement('div',
        {
          style: {
            display: 'inline-block',
            backgroundColor: 'orange',
            padding: '10px',
            margin: '10px',
            fontSize: '20px',
          }
        },
        item
      )
    )
  ")
  onReduceData <- JS("data => ({ items: data.items.slice(0, -1) })")
  shinyApp(
    ui = div(
      p("Resize the browser to see how the elements are hidden when they do not fit:"),
      ResizeGroup(
        data = data,
        onRenderData = onRenderData,
        onReduceData = onReduceData
      )
    ),
    server = function(input, output) {}
  )
}
