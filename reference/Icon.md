# Icon

In a user interface, an icon is an image that represents an application,
a capability, or some other concept or specific entity with meaning for
the user. An icon is usually selectable but can also be a nonselectable
image, such as a company's logo.

For a list of icons, visit our [icon
documentation](https://developer.microsoft.com/en-us/fluentui#/styles/web/icons).

Note that icons are not bundled by default and typically must be loaded
by calling `initializeIcons` from the `@uifabric/icons` package at the
root of your application. See the [icon
documentation](https://developer.microsoft.com/en-us/fluentui#/styles/web/icons)
for more details.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Icon).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
FontIcon(...)

Icon(...)

ImageIcon(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Custom class to style the icon.

- **iconName** `string`  
  The name of the icon to use from the icon font. If string is empty, a
  placeholder icon will be rendered the same width as an icon.

- **ariaLabel** `string`  
  The aria label of the icon for the benefit of screen readers.

- **iconName** `string`  
  The name of the icon to use from the icon font. If string is empty, a
  placeholder icon will be rendered the same width as an icon.

- **iconType** `IconType`  
  The type of icon to render (image or icon font).

- **imageErrorAs** `React.ComponentType<IImageProps>`  
  If rendering an image icon, this component will be rendered in the
  event that loading the image fails.

- **imageProps** `IImageProps`  
  If rendering an image icon, these props will be passed to the Image
  component.

- **styles** `IStyleFunctionOrObject<IIconStyleProps, IIconStyles>`  
  Gets the styles for an Icon.

- **theme** `ITheme`  

- **className** `string`  
  Custom class to style the icon.

- **imageProps** `IImageProps`  
  Props passed to the Image component.

## Examples

``` r
library(shiny)
library(shiny.fluent)

style <- list(fontSize = 50, margin = 10)

ui <- function(id) {
  ns <- NS(id)
  tags$div(
    FontIcon(iconName = "CompassNW", style = style),
    FontIcon(iconName = "Dictionary", style = style),
    FontIcon(iconName = "TrainSolid", style = style)
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
