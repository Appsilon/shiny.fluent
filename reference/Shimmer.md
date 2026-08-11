# Shimmer

Shimmer is a temporary animation placeholder for when a service call
takes time to return data and we don't want to block rendering the rest
of the UI.

If a smooth transition from Shimmer to content is desired, wrap the
content node with a Shimmer element and use the `isDataLoaded` prop to
trigger the transition. In cases where the content node is not wrapped
in a Shimmer, use the `shimmerElements` or `customElementsGroup` props,
and once data arrives, manually replace the Shimmer UI with the intended
content. See the examples below for reference.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Shimmer).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Shimmer(...)

ShimmerElementsGroup(...)

ShimmeredDetailsList(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **borderStyle** `IRawStyle`  
  Use to set custom styling of the shimmerCircle borders.

- **componentRef** `IRefObject<IShimmerCircle>`  
  Optional callback to access the IShimmerCircle interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **height** `number`  
  Sets the height of the circle.

- **styles**
  `IStyleFunctionOrObject<IShimmerCircleStyleProps, IShimmerCircleStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **backgroundColor** `string`  
  Defines the background color of the space in between and around
  shimmer elements.

- **componentRef** `IRefObject<IShimmerElementsGroup>`  
  Optional callback to access the IShimmerElementsGroup interface. Use
  this instead of ref for accessing the public methods and properties of
  the component.

- **flexWrap** `boolean`  
  Optional boolean for enabling flexWrap of the container containing the
  shimmerElements.

- **rowHeight** `number`  
  Optional maximum row height of the shimmerElements container.

- **shimmerElements** `IShimmerElement[]`  
  Elements to render in one group of the Shimmer.

- **styles**
  `IStyleFunctionOrObject<IShimmerElementsGroupStyleProps, IShimmerElementsGroupStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **width** `string`  
  Optional width for ShimmerElements container.

- **borderStyle** `IRawStyle`  
  Use to set custom styling of the shimmerGap borders.

- **componentRef** `IRefObject<IShimmerGap>`  
  Optional callback to access the IShimmerGap interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **height** `number`  
  Sets the height of the gap.

- **styles**
  `IStyleFunctionOrObject<IShimmerGapStyleProps, IShimmerGapStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **width** `number | string`  
  Sets width value of the gap.

- **borderStyle** `IRawStyle`  
  Use to set custom styling of the shimmerLine borders.

- **componentRef** `IRefObject<IShimmerLine>`  
  Optional callback to access the IShimmerLine interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **height** `number`  
  Sets the height of the rectangle.

- **styles**
  `IStyleFunctionOrObject<IShimmerLineStyleProps, IShimmerLineStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **width** `number | string`  
  Sets width value of the line.

- **ariaLabel** `string`  
  Localized string of the status label for screen reader

- **className** `string`  
  Additional CSS class(es) to apply to the Shimmer container.

- **componentRef** `IRefObject<IShimmer>`  
  Optional callback to access the IShimmer interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **customElementsGroup** `React.ReactNode`  
  Custom elements when necessary to build complex placeholder skeletons.

- **isDataLoaded** `boolean`  
  Controls when the shimmer is swapped with actual data through an
  animated transition.

- **shimmerColors** `IShimmerColors`  
  Defines an object with possible colors to pass for Shimmer
  customization used on different backgrounds.

- **shimmerElements** `IShimmerElement[]`  
  Elements to render in one line of the Shimmer.

- **styles**
  `IStyleFunctionOrObject<IShimmerStyleProps, IShimmerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **width** `number | string`  
  Sets the width value of the shimmer wave wrapper.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
      Shimmer(),
      Shimmer(width = "75%"),
      Shimmer(width = "50%")
    ),
    tags$head(tags$style(
      ".ms-Shimmer-container { margin: 10px 0 }"
    ))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
