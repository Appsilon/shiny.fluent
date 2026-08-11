# ColorPicker

The color picker (`ColorPicker`) is used to browse through and select
colors. By default, it lets people navigate through colors on a color
spectrum; or specify a color in either Red-Green-Blue (RGB); or alpha
color code; or Hexadecimal textboxes.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ColorPicker).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ColorPicker(...)

ColorPicker.shinyInput(inputId, ..., value = defaultValue)

updateColorPicker.shinyInput(
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

- **alphaLabel** `string`  
  Label for the alpha textfield.

- **alphaSliderHidden** `boolean`  
  Whether to hide the alpha (or transparency) slider and text field.

- **alphaType** `'alpha' | 'transparency' | 'none'`  
  `alpha` (the default) means display a slider and text field for
  editing alpha values. `transparency` also displays a slider and text
  field but for editing transparency values. `none` hides these
  controls.

Alpha represents the opacity of the color, whereas transparency
represents the transparentness of the color: i.e. a 30% transparent
color has 70% opaqueness.

- **blueLabel** `string`  
  Label for the blue text field.

- **className** `string`  
  Additional CSS class(es) to apply to the ColorPicker.

- **color** `IColor | string`  
  Object or CSS-compatible string to describe the color.

- **componentRef** `IRefObject<IColorPicker>`  
  Gets the component ref.

- **greenLabel** `string`  
  Label for the green text field.

- **hexLabel** `string`  
  Label for the hex text field.

- **onChange**
  `(ev: React.SyntheticEvent<HTMLElement>, color: IColor) => void`  
  Callback for when the user changes the color. (Not called when the
  color is changed via props.)

- **redLabel** `string`  
  Label for the red text field.

- **showPreview** `boolean`  
  Whether to show color preview box.

- **strings** `IColorPickerStrings`  
  Labels for elements within the ColorPicker. Defaults are provided in
  English only.

- **styles**
  `IStyleFunctionOrObject<IColorPickerStyleProps, IColorPickerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization).

- **ariaDescription** `string`  
  Detailed description for how to use the color rectangle. Moving the
  thumb horizontally adjusts saturation and moving it vertically adjusts
  value (essentially, brightness).

- **ariaLabel** `string`  
  Label of the ColorRectangle for the benefit of screen reader users.

- **ariaValueFormat** `string`  
  Format string for the color rectangle's current value as read by
  screen readers. The string must include descriptions and two
  placeholders for the current values: `{0}` for saturation and `{1}`
  for value/brightness.

- **className** `string`  
  Additional CSS class(es) to apply to the ColorRectangle.

- **color** `IColor`  
  Current color of the rectangle.

- **componentRef** `IRefObject<IColorRectangle>`  
  Gets the component ref.

- **minSize** `number`  
  Minimum width and height.

- **onChange**
  `(ev: React.MouseEvent | React.KeyboardEvent, color: IColor) => void`  
  Callback for when the color changes.

- **styles**
  `IStyleFunctionOrObject<IColorRectangleStyleProps, IColorRectangleStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization).

- **ariaLabel** `string`  
  Label of the ColorSlider for the benefit of screen reader users.

- **className** `string`  
  Additional CSS class(es) to apply to the ColorSlider.

- **componentRef** `IRefObject<IColorSlider>`  
  Gets the component ref.

- **isAlpha** `boolean`  
  If true, the slider represents an alpha slider and will display a gray
  checkered pattern in the background. Otherwise, the slider represents
  a hue slider.

- **maxValue** `number`  
  Maximum value of the slider.

- **minValue** `number`  
  Minimum value of the slider.

- **onChange**
  `(event: React.MouseEvent | React.KeyboardEvent, newValue?: number) => void`  
  Callback issued when the value changes.

- **overlayColor** `string`  
  Hex color to use when rendering an alpha or transparency slider's
  overlay, *without* the `#`.

- **overlayStyle** `React.CSSProperties`  
  Custom style for the overlay element.

- **styles**
  `IStyleFunctionOrObject<IColorSliderStyleProps, IColorSliderStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization).

- **thumbColor** `string`  
  CSS-compatible string for the color of the thumb element.

- **type** `'hue' | 'alpha' | 'transparency'`  
  Type of slider to display.

- **value** `number`  
  Current value of the slider.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    ColorPicker.shinyInput(ns("color"), value = "#00FF01"),
    textOutput(ns("colorValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$colorValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
