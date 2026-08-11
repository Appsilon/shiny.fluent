# Slider

A slider provides a visual indication of adjustable content, as well as
the current setting in the total range of content. Use a slider when you
want people to set defined values (such as volume or brightness), or
when people would benefit from instant feedback on the effect of setting
changes.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Slider).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Slider(...)

Slider.shinyInput(inputId, ..., value = defaultValue)

updateSlider.shinyInput(
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
  A description of the Slider for the benefit of screen readers.

- **ariaValueText** `(value: number) => string`  
  A text description of the Slider number value for the benefit of
  screen readers. This should be used when the Slider number value is
  not accurately represented by a number.

- **buttonProps** `React.HTMLAttributes<HTMLButtonElement>`  
  Optional mixin for additional props on the thumb button within the
  slider.

- **className** `string`  
  Optional className to attach to the slider root element.

- **componentRef** `IRefObject<ISlider>`  
  Optional callback to access the ISlider interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **defaultValue** `number`  
  The initial value of the Slider. Use this if you intend for the Slider
  to be an uncontrolled component. This value is mutually exclusive to
  value. Use one or the other.

- **disabled** `boolean`  
  Optional flag to render the Slider as disabled.

- **label** `string`  
  Description label of the Slider

- **max** `number`  
  The max value of the Slider

- **min** `number`  
  The min value of the Slider

- **onChange** `(value: number) => void`  
  Callback when the value has been changed

- **onChanged**
  `(event: MouseEvent | TouchEvent | KeyboardEvent, value: number) => void`  
  Callback on mouse up or touch end

- **originFromZero** `boolean`  
  Optional flag to attach the origin of slider to zero. Helpful when the
  range include negatives.

- **showValue** `boolean`  
  Whether to show the value on the right of the Slider.

- **snapToStep** `boolean`  
  Optional flag to decide that thumb will snap to closest value while
  moving the slider

- **step** `number`  
  The difference between the two adjacent values of the Slider

- **styles**
  `IStyleFunctionOrObject<ISliderStyleProps, ISliderStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **value** `number`  
  The initial value of the Slider. Use this if you intend to pass in a
  new value as a result of onChange events. This value is mutually
  exclusive to defaultValue. Use one or the other.

- **valueFormat** `(value: number) => string`  
  Optional function to format the slider value.

- **vertical** `boolean`  
  Optional flag to render the slider vertically. Defaults to rendering
  horizontal.

## Best practices

### Layout

- Don't use a slider for binary settings.

- Don't use a continuous slider if the range of values is large.

- Don't use for a range with fewer than three values.

- Sliders are typically horizontal but can be vertical, when needed.

### Content

- Include a label indicating what value the slider changes.

- Use step points if you don't want the slider to allow arbitrary values
  between minimum and maximum.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Slider.shinyInput(ns("slider"), value = 0, min = -100, max = 100),
    textOutput(ns("sliderValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$sliderValue <- renderText({
      sprintf("Value: %s", input$slider)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
