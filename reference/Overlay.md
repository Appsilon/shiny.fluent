# Overlay

Overlays are used to render a semi-transparent layer on top of existing
UI. Overlays help focus the user on the content that sits above the
added layer and are often used to help designate a modal or blocking
experience. Overlays can be seen used in conjunction with Panels and
Dialogs.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Overlay).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Overlay(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **allowTouchBodyScroll** `boolean`  
  Allow body scroll on touch devices. Changing after mounting has no
  effect.

- **className** `string`  
  Additional css class to apply to the Overlay

- **componentRef** `IRefObject<IOverlay>`  
  Gets the component ref.

- **isDarkThemed** `boolean`  
  Whether to use the dark-themed overlay.

- **onClick** `() => void`  

- **styles**
  `IStyleFunctionOrObject<IOverlayStyleProps, IOverlayStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("toggleOverlay"), text = "Open Overlay"),
    reactOutput(ns("overlay"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    show <- reactiveVal(FALSE)
    observeEvent(input$toggleOverlay, show(!show()))
    output$overlay <- renderReact({
      if (show()) {
        Overlay(
          onClick = JS(paste0(
            "function() {",
            "  Shiny.setInputValue('", ns("toggleOverlay"), "', Math.random());",
            "}"
          )),
          isDarkThemed = TRUE,
          div(
            style = "background: white; width: 50vw; height: 20rem; margin: auto;",
            div(
              style = "padding: 2rem;",
              h1("Inside Overlay"),
              p("Click anywhere to hide.")
            )
          )
        )
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
