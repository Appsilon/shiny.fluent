# SpinButton

A spin button (`SpinButton`) allows someone to incrementally adjust
a value in small steps. It’s mainly used for numeric values, but other
values are supported too.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SpinButton).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
SpinButton(...)

SpinButton.shinyInput(inputId, ..., value = defaultValue)

updateSpinButton.shinyInput(
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

- **ariaDescribedBy** `string`  
  ID of a label which describes the control, if not using the default
  label.

- **ariaLabel** `string`  
  A description of the control for the benefit of screen reader users.

- **ariaPositionInSet** `number`  
  The position in the parent set (if in a set).

- **ariaSetSize** `number`  
  The total size of the parent set (if in a set).

- **ariaValueNow** `number`  
  Sets the control's aria-valuenow. This is the numeric form of `value`.
  Providing this only makes sense when using as a controlled component.

- **ariaValueText** `string`  

- **className** `string`  
  Custom className for the control.

- **componentRef** `IRefObject<ISpinButton>`  
  Gets the component ref.

- **decrementButtonAriaLabel** `string`  
  Accessible label text for the decrement button (for screen reader
  users).

- **decrementButtonIcon** `IIconProps`  
  Custom props for the decrement button.

- **defaultValue** `string`  
  Initial value of the control. Updates to this prop will not be
  respected.

Use this if you intend for the SpinButton to be an uncontrolled
component which maintains its own value. Mutually exclusive with
`value`.

- **disabled** `boolean`  
  Whether or not the control is disabled.

- **downArrowButtonStyles** `Partial<IButtonStyles>`  
  Custom styles for the down arrow button.

Note: The buttons are in a checked state when arrow keys are used to
incremenent/decrement the SpinButton. Use `rootChecked` instead of
`rootPressed` for styling when that is the case.

- **getClassNames**
  `(theme: ITheme, disabled: boolean, isFocused: boolean, keyboardSpinDirection: KeyboardSpinDirection, labelPosition?: Position, className?: string) => ISpinButtonClassNames`  
  Custom function for providing the classNames for the control. Can be
  used to provide all styles for the component instead of applying them
  on top of the default styles.

- **iconButtonProps** `IButtonProps`  
  Additional props for the up and down arrow buttons.

- **iconProps** `IIconProps`  
  Props for an icon to display alongside the control's label.

- **incrementButtonAriaLabel** `string`  
  Accessible label text for the increment button (for screen reader
  users).

- **incrementButtonIcon** `IIconProps`  
  Custom props for the increment button.

- **inputProps**
  `React.InputHTMLAttributes<HTMLElement | HTMLInputElement>`  
  Additional props for the input field.

- **keytipProps** `IKeytipProps`  
  Keytip for the control.

- **label** `string`  
  Descriptive label for the control.

- **labelPosition** `Position`  
  Where to position the control's label.

- **max** `number`  
  Max value of the control.

- **min** `number`  
  Min value of the control.

- **onBlur** `React.FocusEventHandler<HTMLInputElement>`  
  Callback for when the control loses focus.

- **onDecrement**
  `(value: string, event?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>) => string | void`  
  Callback for when the decrement button or down arrow key is pressed.

- **onFocus** `React.FocusEventHandler<HTMLInputElement>`  
  Callback for when the user focuses the control.

- **onIncrement**
  `(value: string, event?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>) => string | void`  
  Callback for when the increment button or up arrow key is pressed.

- **onValidate**
  `(value: string, event?: React.SyntheticEvent<HTMLElement>) => string | void`  
  Callback for when the entered value should be validated.

- **precision** `number`  
  How many decimal places the value should be rounded to.

The default is calculated based on the precision of `step`: i.e. if step
= 1, precision = 0. step = 0.0089, precision = 4. step = 300, precision
= 2. step = 23.00, precision = 2.

- **step** `number`  
  Difference between two adjacent values of the control. This value is
  used to calculate the precision of the input if no `precision` is
  given. The precision calculated this way will always be \\= 0.

- **styles** `Partial<ISpinButtonStyles>`  
  Custom styling for individual elements within the control.

- **theme** `ITheme`  
  Theme provided by HOC.

- **title** `string`  
  A more descriptive title for the control, visible on its tooltip.

- **upArrowButtonStyles** `Partial<IButtonStyles>`  
  Custom styles for the up arrow button.

Note: The buttons are in a checked state when arrow keys are used to
incremenent/decrement the SpinButton. Use `rootChecked` instead of
`rootPressed` for styling when that is the case.

- **value** `string`  
  Current value of the control.

Use this if you intend to pass in a new value as a result of change
events. Mutually exclusive with `defaultValue`.

## Best practices

### Layout

- Use a spin button when you need to incrementally change a value.

- Use a spin button when values are tied to a unit of measure.

- Don't use a spin button for binary settings.

- Don't use a spin button for a range of three values or less.

- Place labels to the left of the spin button control. For example,
  "Length of ruler (cm)".

- Spin button width should adjust to fit the number values.

### Content

- Include a label indicating what value the spin button changes.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    SpinButton.shinyInput(ns("spin"), value = 15, min = 0, max = 50, step = 5),
    textOutput(ns("spinValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$spinValue <- renderText({
      sprintf("Value: %s", input$spin)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
