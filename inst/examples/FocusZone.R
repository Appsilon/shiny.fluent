library(shiny.fluent)

if (interactive()) {
  tokens <- list(childrenGap = 20)

  shinyApp(
    ui = Stack(
      tokens = tokens,
      horizontalAlign = "start",
      FocusZone(
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Enabled FocusZone:"),
          DefaultButton(text = "Button 1"),
          DefaultButton(text = "Button 2"),
          TextField(placeholder = "FocusZone TextField"),
          DefaultButton(text = "Button 3")
        )
      ),
      DefaultButton(text = "Tabbable Element 1"),
      FocusZone(
        disabled = TRUE,
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Disabled FocusZone:"),
          DefaultButton(text = "Button 1"),
          DefaultButton(text = "Button 2")
        )
      ),
      TextField(placeholder = "Tabbable Element 2")
    ),
    server = function(input, output) {}
  )
}
