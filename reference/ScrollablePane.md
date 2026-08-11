# ScrollablePane

A scrollable pane (`ScrollablePane`) is a helper component that's used
with the `Sticky` component. It will "stick" to the top or bottom
of the scrollable region and remain visible.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ScrollablePane).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ScrollablePane(...)

Sticky(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Additional css class to apply to the ScrollablePane

- **componentRef** `IRefObject<IScrollablePane>`  
  Optional callback to access the IScrollablePane interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **initialScrollPosition** `number`  
  Sets the initial scroll position of the ScrollablePane

- **scrollbarVisibility** `ScrollbarVisibility`  

- **styles**
  `IStyleFunctionOrObject<IScrollablePaneStyleProps, IScrollablePaneStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

## Best practices

### Layout

- Use the sticky component on block-level elements.

- Sticky components should ideally be section headers and/or footers.

- Use `position: absolute`. Ensure that the parent element has an
  explicit `height` and `position: relative`, or has space already
  allocated for the scrollable pane.

- Ensure that the total height of `Sticky` components does not exceed
  the height of the `ScrollablePane`.

## Examples

``` r
library(shiny)
library(shiny.fluent)

pane <- function(header, paragraphs) (
  div(
    Sticky(
      div(
        style = "background-color: #80CAF1; border-top: 1px solid; border-bottom: 1px solid",
        header
      )
    ),
    stringi::stri_rand_lipsum(paragraphs)
  )
)

ui <- function(id) {
  ns <- NS(id)
  ScrollablePane(
    styles = list(
      root = list(position = "relative", height = "500px", width = "400px")
    ),
    pane("Some text", 3),
    pane("A lot of text", 5),
    pane("Just a short ending", 1)
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
