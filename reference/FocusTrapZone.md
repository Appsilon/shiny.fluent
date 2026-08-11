# FocusTrapZone

FocusTrapZone is used to trap the focus in any html element. Pressing
tab will circle focus within the inner focusable elements of the
FocusTrapZone.

**Note:** Trapping focus will restrict interaction with other elements
in the website such as the side nav. Turn off the "Use trap zone" toggle
control to allow this interaction to happen again.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/FocusTrapZone).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
FocusTrapCallout(...)

FocusTrapZone(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **ariaLabelledBy** `string`  
  Sets the aria-labelledby attribute.

- **componentRef** `IRefObject<IFocusTrapZone>`  
  Optional callback to access the IFocusTrapZone interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **disabled** `boolean`  
  Whether to disable the FocusTrapZone's focus trapping behavior.

- **disableFirstFocus** `boolean`  
  Do not put focus onto the first element inside the focus trap zone.

- **elementToFocusOnDismiss** `HTMLElement`  
  Sets the element to focus on when exiting the FocusTrapZone.

- **enableAriaHiddenSiblings** `boolean`  
  Puts aria-hidden=true on all non-ancestors of the current element, for
  screen readers. This is an experimental feature that will be graduated
  to default behavior after testing. This flag will be removed with the
  next major release.

- **firstFocusableSelector** `string | (() => string)`  
  Class name (not actual selector) for first focusable item. Do not
  append a dot. Only applies if `focusPreviouslyFocusedInnerElement` is
  false.

- **focusPreviouslyFocusedInnerElement** `boolean`  
  Specifies which descendant element to focus when `focus()` is called.
  If false, use the first focusable descendant, filtered by the
  `firstFocusableSelector` property if present. If true, use the element
  that was focused when the trap zone last had a focused descendant (or
  fall back to the first focusable descendant if the trap zone has never
  been focused).

- **forceFocusInsideTrap** `boolean`  
  Whether the focus trap zone should force focus to stay inside of it.

- **ignoreExternalFocusing** `boolean`  
  If false (the default), the trap zone will restore focus to the
  element which activated it once the trap zone is unmounted or
  disabled. Set to true to disable this behavior.

- **isClickableOutsideFocusTrap** `boolean`  
  Whether clicks are allowed outside this FocusTrapZone.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  reactOutput(ns("focusTrapZone"))
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$focusTrapZone <- renderReact({
      useTrapZone <- isTRUE(input$useTrapZone)
      stackStyles <- list(root = list(
        border = if (useTrapZone) '2px solid #ababab' else 'transparent',
        padding = 10
      ))
      textFieldStyles <- list(root = list(width = 300));
      stackTokens = list(childrenGap = 8);

      div(
        FocusTrapZone(
          disabled = !useTrapZone,
          Stack(
            horizontalAlign = "start",
            tokens = stackTokens,
            styles = stackStyles,
            Toggle.shinyInput(ns("useTrapZone"),
              value = FALSE,
              label = "Use trap zone",
              onText = "On (toggle to exit)",
              offText = "Off (toggle to trap focus)"
            ),
            TextField.shinyInput(
              ns("textInput"),
              label = "Input inside trap zone",
              styles = textFieldStyles
            ),
            Link(
              href = "https://bing.com",
              target = "_blank",
              "Hyperlink inside trap zone"
            )
          )
        ),
        Link(
          href = "https://bing.com",
          target = "_blank",
          "Hyperlink outside trap zone"
        )
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
