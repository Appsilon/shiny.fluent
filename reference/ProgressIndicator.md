# ProgressIndicator

ProgressIndicators are used to show the completion status of an
operation lasting more than 2 seconds. If the state of progress cannot
be determined, use a Spinner instead. ProgressIndicators can appear in a
new panel, a flyout, under the UI initiating the operation, or even
replacing the initiating UI, as long as the UI can return if the
operation is canceled or is stopped.

ProgressIndicators feature a bar showing total units to completion, and
total units finished. The description of the operation appears above the
bar, and the status in text appears below. The description should tell
someone exactly what the operation is doing. Examples of formatting
include:

- **`[Object]`** is being **`[operation name]`**, or

- **`[Object]`** is being **`[operation name]`** to
  **`[destination name]`** or

- **`[Object]`** is being **`[operation name]`** from
  **`[source name]`** to **`[destination name]`**

Status text is generally in units elapsed and total units. If the
operation can be canceled, an “X” icon is used and should be placed in
the upper right, aligned with the baseline of the operation name. When
an error occurs, replace the status text with the error description
using ms-fontColor-redDark.

Real-world examples include copying files to a storage location, saving
edits to a file, and more. Use units that are informative and relevant
to give the best idea to users of how long the operation will take to
complete. Avoid time units as they are rarely accurate enough to be
trustworthy. Also, combine steps of a complex operation into one total
bar to avoid “rewinding” the bar. Instead change the operation
description to reflect the change if necessary. Bars moving backwards
reduce confidence in the service.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ProgressIndicator).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ProgressIndicator(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **ariaValueText** `string`  
  Text alternative of the progress status, used by screen readers for
  reading the value of the progress.

- **barHeight** `number`  
  Height of the ProgressIndicator

- **className** `string`  
  Additional css class to apply to the ProgressIndicator

- **description** `React.ReactNode`  
  Text describing or supplementing the operation. May be a string or
  React virtual elements.

- **label** `React.ReactNode`  
  Label to display above the control. May be a string or React virtual
  elements.

- **onRenderProgress** `IRenderFunction<IProgressIndicatorProps>`  
  A render override for the progress track.

- **percentComplete** `number`  
  Percentage of the operation's completeness, numerically between 0
  and 1. If this is not set, the indeterminate progress animation will
  be shown instead.

- **progressHidden** `boolean`  
  Whether or not to hide the progress state.

- **styles**
  `IStyleFunctionOrObject<IProgressIndicatorStyleProps, IProgressIndicatorStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **title** `string`  
  Deprecated at v0.43.0, to be removed at \\= v0.53.0. Use `label`
  instead.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  ProgressIndicator(
    label = "Example title",
    description = "Example description"
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
