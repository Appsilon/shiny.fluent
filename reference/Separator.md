# Separator

A separator visually separates content into groups.

You can render content in the separator by specifying the component's
children. The component's children can be plain text or a component like
Icon. The content is center-aligned by default.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Separator).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Separator(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **alignContent** `'start' | 'center' | 'end'`  
  Where the content should be aligned in the separator.

- **styles**
  `IStyleFunctionOrObject<ISeparatorStyleProps, ISeparatorStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization.)

- **vertical** `boolean`  
  Whether the element is a vertical separator.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Separator("Text")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
