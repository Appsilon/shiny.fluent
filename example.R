# Example 2
library(shiny)
devtools::load_all()


# Split button with menu
menuProps <- list(
  items = list(
    list(
      key = "emailMessage",
      text = "Email message",
      onClick = JS("() => alert('Email message clicked')"),
      iconProps = list(
        iconName = "Mail"
      )
    ),
    list(
      key = "calendarEvent",
      text = "Calendar event",
      onClick = JS("() => alert('Calendar event clicked')"),
      iconProps = list(
        iconName = "Calendar"
      )
    )
  )
)

shinyApp(
  ui = fluentPage(
    Stack(
      horizontal = TRUE,
      wrap = TRUE,
      tokens = list(
        childrenGap = 40
      ),
      DefaultButton.shinyInput(
        inputId = "button_1",
        text = "Standard",
        primary = FALSE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        disabled = FALSE,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = "button_2",
        text = "Primary",
        primary = TRUE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        disabled = FALSE,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = "button_3",
        text = "Main action disabled",
        primaryDisabled = NA,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = "button_4",
        text = "Disabled",
        disabled = TRUE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        checked = FALSE
      )
    ),
    uiOutput("text")
  ),
  server = function(input, output) {
    output$text <- renderUI({
      lapply(seq_len(4), function(i) {
        paste0("button_", i, ": ", input[[paste0("button_", i)]])
      })
    })
  }
)

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
