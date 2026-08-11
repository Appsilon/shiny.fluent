# SwatchColorPicker

A swatch color picker (`SwatchColorPicker`) displays color options as
a grid. It can be shown by itself, with a header and dividers, or as a
button that expands to show the swatch color picker.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SwatchColorPicker).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
SwatchColorPicker(...)

SwatchColorPicker.shinyInput(inputId, ..., value = defaultValue)

updateSwatchColorPicker.shinyInput(
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

- **color** `string`  
  The CSS-compatible string to describe the color

- **id** `string`  
  Arbitrary unique string associated with this option

- **index** `number`  
  Index for this option

- **label** `string`  
  Tooltip and aria label for this item

- **borderWidth** `number`  
  Width of the border that indicates a selected/hovered cell, in pixels.

- **circle** `boolean`  
  True if this cell should be rendered as a circle, false if it should
  be a square. @default `true` (render as circle)

- **color** `string`  
  The CSS-compatible string to describe the color

- **disabled** `boolean`  
  Whether this cell should be disabled @default false

- **height** `number`  
  Height of the cell, in pixels

- **id** `string`  
  Used as a PREFIX for the cell's ID (the cell will not have this
  literal string as its ID).

- **idPrefix** `string`  
  Prefix for this cell's ID. Will be required in a future version once
  `id` is removed.

- **index** `number`  
  Index for this option

- **item** `IColorCellProps`  
  Item to render

- **label** `string`  
  Tooltip and aria label for this item

- **onClick** `(item: IColorCellProps) => void`  
  Handler for when a color cell is clicked.

- **onFocus** `(item: IColorCellProps) => void`  

- **onHover** `(item?: IColorCellProps) => void`  

- **onKeyDown** `(ev: React.KeyboardEvent<HTMLButtonElement>) => void`  

- **onMouseEnter**
  `(ev: React.MouseEvent<HTMLButtonElement>) => boolean`  
  Mouse enter handler. Returns true if the event should be processed,
  false otherwise.

- **onMouseLeave** `(ev: React.MouseEvent<HTMLButtonElement>) => void`  

- **onMouseMove**
  `(ev: React.MouseEvent<HTMLButtonElement>) => boolean`  
  Mouse move handler. Returns true if the event should be processed,
  false otherwise.

- **onWheel** `(ev: React.MouseEvent<HTMLButtonElement>) => void`  

- **selected** `boolean`  
  Whether this cell is currently selected

- **styles**
  `IStyleFunctionOrObject<IColorPickerGridCellStyleProps, IColorPickerGridCellStyles>`  
  Custom styles for the component.

- **theme** `ITheme`  
  The theme object to use for styling.

- **width** `number`  
  Width of the cell, in pixels

- **ariaPosInSet** `number`  
  Position this grid is in the parent set (index in a parent menu, for
  example)

- **ariaSetSize** `number`  
  Size of the parent set (size of parent menu, for example)

- **cellBorderWidth** `number`  
  Width of the border indicating a hovered/selected cell, in pixels

- **cellHeight** `number`  
  Height of an individual cell, in pixels

- **cellMargin** `number`  
  The distance between cells, in pixels

- **cellShape** `'circle' | 'square'`  
  The shape of the color cells. @default 'circle'

- **cellWidth** `number`  
  Width of an individual cell, in pixels

- **className** `string`  
  Additional class name to provide on the root element

- **colorCells** `IColorCellProps[]`  
  The color cells that will be made available to the user.

Note: When the reference to this prop changes, regardless of how many
color cells change, all of the color cells will be re-rendered
(potentially bad perf) because we memoize based on this prop's
reference.

- **columnCount** `number`  
  Number of columns for the swatch color picker

- **disabled** `boolean`  
  Whether the control is disabled.

- **doNotContainWithinFocusZone** `boolean`  
  If false (the default), the grid is contained inside a FocusZone. If
  true, a FocusZone is not used. @default false

- **focusOnHover** `boolean`  
  Whether to update focus when a cell is hovered.

- **getColorGridCellStyles**
  `IStyleFunctionOrObject<IColorPickerGridCellStyleProps, IColorPickerGridCellStyles>`  
  Styles for the grid cells.

- **id** `string`  
  ID for the swatch color picker's root element. Also used as a prefix
  for the IDs of color cells.

- **isControlled** `boolean`  
  Indicates whether the SwatchColorPicker is fully controlled. When
  true, the component will not set its internal state to track the
  selected color. Instead, the parent component will be responsible for
  handling state in the callbacks like `onColorChanged`.

NOTE: This property is a temporary workaround to force the component to
be fully controllable without breaking existing behavior

- **mouseLeaveParentSelector** `string | undefined`  
  Selector to focus on mouse leave. Should only be used in conjunction
  with `focusOnHover`.

- **onCellFocused** `(id?: string, color?: string) => void`  
  Callback for when the user focuses a color cell. If `id` and `color`
  are unspecified, cells are no longer being focused.

- **onCellHovered** `(id?: string, color?: string) => void`  
  Callback for when the user hovers over a color cell. If `id` and
  `color` are unspecified, cells are no longer being hovered.

- **onColorChanged** `(id?: string, color?: string) => void`  
  Callback for when the user changes the color. If `id` and `color` are
  unspecified, there is no selected cell. (e.g. the user executed the
  currently selected cell to unselect it)

- **positionInSet** `number`  

- **selectedId** `string`  
  The ID of color cell that is currently selected

- **setSize** `number`  

- **shouldFocusCircularNavigate** `boolean`  
  Whether focus should cycle back to the beginning once the user
  navigates past the end (and vice versa). Only relevant if
  `doNotContainWithinFocusZone` is not true.

- **styles**
  `IStyleFunctionOrObject<ISwatchColorPickerStyleProps, ISwatchColorPickerStyles>`  
  Styles for the component.

- **theme** `ITheme`  
  Theme to apply to the component.

## Best practices

### Layout

- Use a swatch color picker when there are multiple color options that
  can be grouped or collapsed under one title.

- Don’t use a swatch color picker when there’s a large number of
  color options. The best component for that is a color picker.

## Examples

``` r
library(shiny)
library(shiny.fluent)

colorCells <- list(
  list(id = "orange", color = "#ca5010"),
  list(id = "cyan", color = "#038387"),
  list(id = "blueMagenta", color = "#8764b8"),
  list(id = "magenta", color = "#881798"),
  list(id = "white", color = "#ffffff")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    SwatchColorPicker.shinyInput(ns("color"), value = "orange",
      colorCells = colorCells, columnCount = length(colorCells)
    ),
    textOutput(ns("swatchValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$swatchValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
