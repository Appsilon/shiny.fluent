# Text

Text is a component for displaying text. You can use Text to standardize
text across your web app.

You can specify the `variant` prop to apply font styles to Text. This
variant pulls from the Fluent UI React theme loaded on the page. If you
do not specify the `variant` prop, by default, Text applies the styling
from specifying the `variant` value to `medium`.

The Text control is inline wrap by default. You can specify `block` to
enable block and `nowrap` to enable `nowrap`. For ellipsis on overflow
to work properly, `block` and `nowrap` should be manually set to `true`.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Text).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Text(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **as** `React.ElementType<React.HTMLAttributes<HTMLElement>>`  
  Optionally render the component as another component type or
  primitive.

- **block** `boolean`  
  Whether the text is displayed as a block element.

Note that in order for ellipsis on overflow to work properly, `block`
and `nowrap` should be set to true.

- **nowrap** `boolean`  
  Whether the text is not wrapped.

Note that in order for ellipsis on overflow to work properly, `block`
and `nowrap` should be set to true.

- **variant** `keyof IFontStyles`  
  Optional font type for Text.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Text(variant = "xLarge", "Some text with a nice Fluent UI font")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
