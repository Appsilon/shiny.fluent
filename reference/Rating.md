# Rating

Ratings show people’s opinions of a product, helping others make
more informed purchasing decisions. People can also rate products
they’ve purchased.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Rating).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Rating(...)

Rating.shinyInput(inputId, ..., value = defaultValue)

updateRating.shinyInput(
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

- **allowZeroStars** `boolean`  
  Allow the rating value to be set to 0 instead of a minimum of 1.

- **ariaLabelFormat** `string`  
  Optional label format for a rating star that will be read by screen
  readers. Can be used like "{0} of {1} stars selected", where {0} will
  be substituted by the current rating and {1} will be substituted by
  the max rating.

- **ariaLabelId** `string`  
  Deprecated: Optional id of label describing this instance of Rating.

- **componentRef** `IRefObject<IRating>`  
  Optional callback to access the IRating interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **getAriaLabel** `(rating: number, max: number) => string`  

- **icon** `string`  
  Custom icon

- **max** `number`  
  Maximum rating, defaults to 5, has to be \\= min

- **min** `number`  
  Minimum rating, defaults to 1, has to be \\= 0

- **onChange**
  `(event: React.FocusEvent<HTMLElement>, rating?: number) => void`  
  Callback issued when the rating changes.

- **onChanged** `(rating: number) => void`  

- **rating** `number`  
  Selected rating, has to be an integer between min and max

- **readOnly** `boolean`  
  Optional flag to mark rating control as readOnly

- **size** `RatingSize`  
  Size of rating, defaults to small

- **styles**
  `IStyleFunctionOrObject<IRatingStyleProps, IRatingStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization.)

- **unselectedIcon** `string`  
  Custom icon for unselected rating elements.

## Best practices

### Layout

- Make it clear which item the rating pertains to by making sure the
  layout and grouping are clear when several items are on the page.

- Don't use the rating component for data that has a continuous range,
  such as the brightness of a photo. Instead, use a slider.

### Content

- Use a five-star rating system.

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Rating.shinyInput(ns("rating"), value = 2),
    textOutput(ns("ratingValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$ratingValue <- renderText({
      sprintf("Value: %s", input$rating)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
