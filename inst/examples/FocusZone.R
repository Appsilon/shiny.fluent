library(shiny.fluent)

if (interactive()) {
  tokens <- list(childrenGap = 20)

  shinyApp(
    ui = withReact(
      Stack(
        tokens = tokens,
        horizontalAlign = "start",
        FocusZone(
          Stack(
            tokens = tokens,
            horizontal = TRUE,
            verticalAlign = "center",
            tags$span("Enabled FocusZone:"),
            DefaultButton("input1", text = "Button 1"),
            DefaultButton("input2", text = "Button 2"),
            TextField("input3", placeholder = "FocusZone TextField"),
            DefaultButton("input4", text = "Button 3")
          )
        ),
        DefaultButton("input5", text = "Tabbable Element 1"),
        FocusZone(
          disabled = TRUE,
          Stack(
            tokens = tokens,
            horizontal = TRUE,
            verticalAlign = "center",
            tags$span("Disabled FocusZone:"),
            DefaultButton("input6", text = "Button 1"),
            DefaultButton("input7", text = "Button 2")
          )
        ),
        TextField("input8", placeholder = "Tabbable Element 2")
      )
    ),
    server = function(input, output) {
    }
  )
}
