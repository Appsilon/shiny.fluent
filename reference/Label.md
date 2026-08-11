# Label

Labels give a name or title to a control or group of controls, including
text fields, check boxes, combo boxes, radio buttons, and drop-down
menus.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Label).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Label(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **as** `IComponentAs<React.AllHTMLAttributes<HTMLElement>>`  
  Render the root element as another type.

- **componentRef** `IRefObject<ILabel>`  
  Optional callback to access the ILabel interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **disabled** `boolean`  
  Renders the label as disabled.

- **required** `boolean`  
  Whether the associated form field is required or not

- **styles** `IStyleFunctionOrObject<ILabelStyleProps, ILabelStyles>`  
  Styles for the label.

- **theme** `ITheme`  
  Theme provided by HOC.

## Best practices

### Layout

- Labels should be close to the control they're paired with.

### Content

- Labels should describe the purpose of the control.

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

- Be short and concise.

- Use nouns or short noun phrases.

- Don't use labels as instructional text. For example, "Click to get
  started".

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Label("Required label", required = TRUE)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
