# Spinner

A Spinner is an outline of a circle which animates around itself
indicating to the user that things are processing. A Spinner is shown
when it's unsure how long a task will take making it the indeterminate
version of a ProgressIndicator. They can be various sizes, located
inline with content or centered. They generally appear after an action
is being processed or committed. They are subtle and generally do not
take up much space, but are transitions from the completed task.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Spinner).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Spinner(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **ariaLabel** `string`  
  Alternative status label for screen reader

- **ariaLive** `'assertive' | 'polite' | 'off'`  
  Politeness setting for label update announcement.

- **className** `string`  
  Additional CSS class(es) to apply to the Spinner.

- **componentRef** `IRefObject<ISpinner>`  
  Optional callback to access the ISpinner interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **label** `string`  
  The label to show next to the Spinner. Label updates will be announced
  to the screen readers. Use ariaLive to control politeness level.

- **labelPosition** `SpinnerLabelPosition`  
  The position of the label in regards of the spinner animation.

- **size** `SpinnerSize`  
  The size of Spinner to render. { extraSmall, small, medium, large }

- **styles**
  `IStyleFunctionOrObject<ISpinnerStyleProps, ISpinnerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization.)

- **type** `SpinnerType`  
  Deprecated and will be removed at \\= 2.0.0. Use `SpinnerSize`
  instead.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Spinner(size = 3, label = "Loading, please wait...")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
