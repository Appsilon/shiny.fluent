# Image

An image is a graphic representation of something (e.g photo or
illustration). The borders have been added to these examples in order to
help visualize empty space in the image frame.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Image).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Image(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Additional css class to apply to the Component

- **coverStyle** `ImageCoverStyle`  
  Specifies the cover style to be used for this image. If not specified,
  this will be dynamically calculated based on the aspect ratio for the
  image.

- **errorSrc** `string`  
  Deprecated at v1.3.6, to replace the src in case of errors, use
  `onLoadingStateChange` instead and rerender the Image with a
  difference src.

- **imageFit** `ImageFit`  
  Used to determine how the image is scaled and cropped to fit the
  frame.

- **maximizeFrame** `boolean`  
  If true, the image frame will expand to fill its parent container.

- **onLoadingStateChange** `(loadState: ImageLoadState) => void`  
  Optional callback method for when the image load state has changed.
  The 'loadState' parameter indicates the current state of the Image.

- **shouldFadeIn** `boolean`  
  If true, fades the image in when loaded.

- **shouldStartVisible** `boolean`  
  If true, the image starts as visible and is hidden on error.
  Otherwise, the image is hidden until it is successfully loaded. This
  disables shouldFadeIn.

- **styles** `IStyleFunctionOrObject<IImageStyleProps, IImageStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Image(src = "https://via.placeholder.com/350x150")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
