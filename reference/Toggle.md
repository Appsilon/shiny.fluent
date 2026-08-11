# Toggle

A toggle represents a physical switch that allows someone to choose
between two mutually exclusive options.  For
example, “On/Off”, “Show/Hide”. Choosing an option should produce an
immediate result.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Toggle).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Toggle(...)

Toggle.shinyInput(inputId, ..., value = defaultValue)

updateToggle.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

- inputId:

  ID of the component.

- value:

  Starting value.

- session:

  Object passed as the `session` argument to Shiny server.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
The update functions return nothing (called for side effects).

## Details

- **ariaLabel** `string`  
  Text for screen-reader to announce as the name of the toggle.

- **as** `IComponentAs<React.HTMLAttributes<HTMLElement>>`  
  Render the root element as another type.

- **checked** `boolean`  
  Checked state of the toggle. If you are maintaining state yourself,
  use this property. Otherwise use `defaultChecked`.

- **componentRef** `IRefObject<IToggle>`  
  Optional callback to access the IToggle interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **defaultChecked** `boolean`  
  Initial state of the toggle. If you want the toggle to maintain its
  own state, use this. Otherwise use `checked`.

- **disabled** `boolean`  
  Optional disabled flag.

- **inlineLabel** `boolean`  
  Whether the label (not the onText/offText) should be positioned inline
  with the toggle control. Left (right in RTL) side when on/off text
  provided VS right (left in RTL) side when no on/off text. Caution:
  when not providing on/off text user may get confused in
  differentiating the on/off states of the toggle.

- **keytipProps** `IKeytipProps`  
  Optional keytip for this toggle

- **label** `string | JSX.Element`  
  A label for the toggle.

- **offAriaLabel** `string`  

- **offText** `string`  
  Text to display when toggle is OFF. Caution: when not providing on/off
  text user may get confused in differentiating the on/off states of the
  toggle.

- **onAriaLabel** `string`  

- **onChange**
  `(event: React.MouseEvent<HTMLElement>, checked?: boolean) => void`  
  Callback issued when the value changes.

- **onChanged** `(checked: boolean) => void`  

- **onText** `string`  
  Text to display when toggle is ON. Caution: when not providing on/off
  text user may get confused in differentiating the on/off states of the
  toggle.

- **role** `'checkbox' | 'switch' | 'menuitemcheckbox'`  
  (Optional) Specify whether to use the "switch" role (ARIA 1.1) or the
  checkbox role (ARIA 1.0). If unspecified, defaults to "switch".

- **styles**
  `IStyleFunctionOrObject<IToggleStyleProps, IToggleStyles>`  
  Optional styles for the component.

- **theme** `ITheme`  
  Theme provided by HOC.

## Best practices

### Layout

- When people need to perform extra steps for changes to take effect,
  use a check box instead. For example, if they must click a "Submit",
  "Next", or "OK" button to apply changes, use a check box.

### Content

- Only replace the On/Off labels if there are more specific labels for
  the setting. For example, you might use Show/Hide if the setting is
  "Show images".

- Keep descriptive text short and concise—two to four words; preferably
  nouns. For example, "Focused inbox" or "WiFi".

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Toggle.shinyInput(ns("toggle"), value = TRUE),
    textOutput(ns("toggleValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$toggleValue <- renderText({
      sprintf("Value: %s", input$toggle)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
