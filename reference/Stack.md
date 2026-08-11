# Stack

A `Stack` is a container-type component that abstracts the
implementation of a flexbox in order to define the layout of its
children components.

### Stack Properties

Although the `Stack` component has a number of different properties,
there are three in particular that define the overall layout that the
component has:

1.  Direction: Refers to whether the stacking of children components is
    horizontal or vertical. By default the `Stack` component is
    vertical, but can be turned horizontal by adding the `horizontal`
    property when using the component.

2.  Alignment: Refers to how the children components are aligned inside
    the container. This is controlled via the `verticalAlign` and
    `horizontalAlign` properties. One thing to notice here is that while
    flexbox containers align always across the cross axis, `Stack` aims
    to remove the mental strain involved in this process by making the
    `verticalAlign` and `horizontalAlign` properties always follow the
    vertical and horizontal axes, respectively, regardless of the
    direction of the `Stack`.

3.  Spacing: Refers to the space that exists between children components
    inside the `Stack`. This is controlled via the `gap` and
    `verticalGap` properties.

### Stack Items

The `Stack` component provides an abstraction of a flexbox container but
there are some flexbox related properties that are applied on specific
children of the flexbox instead of being applied on the container. This
is where `Stack Items` comes into play.

A `Stack Item` abstracts those properties that are or can be
specifically applied on flexbox's children, like `grow` and `shrink`.

To use a `Stack Item` in an application, the `Stack` component should be
imported and `Stack.Item` should be used inside of a `Stack`. This is
done so that the existence of the `Stack Item` is inherently linked to
the `Stack` component.

#### Stack Wrapping

Aside from the previously mentioned properties, there is another
property called `wrap` that determines if items overflow the `Stack`
container or wrap around it. The wrap property only works in the
direction of the `Stack`, which means that the children components can
still overflow in the perpendicular direction (i.e. in a
`Vertical Stack`, items might overflow horizontally and vice versa).

#### Stack Nesting

`Stacks` can be nested inside one another in order to be able to
configure the layout of the application as desired.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Stack).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Stack(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **align**
  `'auto' | 'stretch' | 'baseline' | 'start' | 'center' | 'end'`  
  Defines how to align the StackItem along the x-axis (for vertical
  Stacks) or the y-axis (for horizontal Stacks).

- **className** `string`  
  Defines a CSS class name used to style the StackItem.

- **disableShrink** `boolean`  
  Defines whether the StackItem should be prevented from shrinking. This
  can be used to prevent a StackItem from shrinking when it is inside of
  a Stack that has shrinking items.

- **grow** `boolean | number | 'inherit' | 'initial' | 'unset'`  
  Defines how much to grow the StackItem in proportion to its siblings.

- **order** `number | string`  
  Defines order of the StackItem.

- **shrink** `boolean | number | 'inherit' | 'initial' | 'unset'`  
  Defines at what ratio should the StackItem shrink to fit the available
  space.

- **verticalFill** `boolean`  
  Defines whether the StackItem should take up 100% of the height of its
  parent.

- **as** `React.ElementType<React.HTMLAttributes<HTMLElement>>`  
  Defines how to render the Stack.

- **disableShrink** `boolean`  
  Defines whether Stack children should not shrink to fit the available
  space.

- **gap** `number | string`  
  Defines the spacing between Stack children. The property is specified
  as a value for 'row gap', followed optionally by a value for 'column
  gap'. If 'column gap' is omitted, it's set to the same value as 'row
  gap'.

- **grow** `boolean | number | 'inherit' | 'initial' | 'unset'`  
  Defines how much to grow the Stack in proportion to its siblings.

- **horizontal** `boolean`  
  Defines whether to render Stack children horizontally.

- **horizontalAlign** `Alignment`  
  Defines how to align Stack children horizontally (along the x-axis).

- **maxHeight** `number | string`  
  Defines the maximum height that the Stack can take.

- **maxWidth** `number | string`  
  Defines the maximum width that the Stack can take.

- **padding** `number | string`  
  Defines the inner padding of the Stack.

- **reversed** `boolean`  
  Defines whether to render Stack children in the opposite direction
  (bottom-to-top if it's a vertical Stack and right-to-left if it's a
  horizontal Stack).

- **verticalAlign** `Alignment`  
  Defines how to align Stack children vertically (along the y-axis).

- **verticalFill** `boolean`  
  Defines whether the Stack should take up 100% of the height of its
  parent. This property is required to be set to true when using the
  `grow` flag on children in vertical oriented Stacks. Stacks are
  rendered as block elements and grow horizontally to the container
  already.

- **wrap** `boolean`  
  Defines whether Stack children should wrap onto multiple rows or
  columns when they are about to overflow the size of the Stack.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Stack(
    tokens = list(childrenGap = 10),
    reversed = TRUE,
    span("Item One"),
    span("Item Two"),
    span("Item Three")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
