# Breadcrumb

Breadcrumbs should be used as a navigational aid in your app or site.
They indicate the current page’s location within a hierarchy and help
the user understand where they are in relation to the rest of that
hierarchy. They also afford one-click access to higher levels of that
hierarchy.

Breadcrumbs are typically placed, in horizontal form, under the masthead
or navigation of an experience, above the primary content area.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Breadcrumb).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Breadcrumb(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **ariaLabel** `string`  
  Aria label for the root element of the breadcrumb (which is a
  navigation landmark).

- **className** `string`  
  Optional class for the root breadcrumb element.

- **componentRef** `IRefObject<IBreadcrumb>`  
  Optional callback to access the IBreadcrumb interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **dividerAs** `IComponentAs<IDividerAsProps>`  
  Render a custom divider in place of the default chevron `>`

- **focusZoneProps** `IFocusZoneProps`  
  Extra props for the root FocusZone.

- **items** `IBreadcrumbItem[]`  
  Collection of breadcrumbs to render

- **maxDisplayedItems** `number`  
  The maximum number of breadcrumbs to display before coalescing. If not
  specified, all breadcrumbs will be rendered.

- **onGrowData**
  `(data: IBreadcrumbData) => IBreadcrumbData | undefined`  
  Method that determines how to group the length of the breadcrumb.
  Return undefined to never increase breadcrumb length.

- **onReduceData**
  `(data: IBreadcrumbData) => IBreadcrumbData | undefined`  
  Method that determines how to reduce the length of the breadcrumb.
  Return undefined to never reduce breadcrumb length.

- **onRenderItem** `IRenderFunction<IBreadcrumbItem>`  
  Custom render function for each breadcrumb item.

- **onRenderOverflowIcon** `IRenderFunction<IButtonProps>`  
  Render a custom overflow icon in place of the default icon `...`

- **overflowAriaLabel** `string`  
  Aria label for the overflow button.

- **overflowIndex** `number`  
  Optional index where overflow items will be collapsed. Defaults to 0.

- **styles**
  `IStyleFunctionOrObject<IBreadcrumbStyleProps, IBreadcrumbStyles>`  

- **theme** `ITheme`  

- **tooltipHostProps** `ITooltipHostProps`  
  Extra props for the TooltipHost which wraps each breadcrumb item.

- **item** `IBreadcrumbItem`  
  Breadcrumb item to left of the divider to be passed for custom
  rendering. For overflowed items, it will be last item in the list.

## Examples

``` r
library(shiny)
library(shiny.fluent)

items <- list(
  list(text = "Files", key = "Files", href = "#/page"),
  list(text = "Folder 1", key = "f1", href = "#/page"),
  list(text = "Folder 2", key = "f2", href = "#/page"),
  list(text = "Folder 3", key = "f3", href = "#/page"),
  list(text = "Folder 4 (non-clickable)", key = "f4"),
  list(text = "Folder 5", key = "f5", href = "#/page", isCurrentItem = TRUE)
)

ui <- function(id) {
  Breadcrumb(
    items = items,
    maxDisplayedItems = 3,
    ariaLabel = "Breadcrumb with items rendered as links",
    overflowAriaLabel = "More links"
  )
}
server <- function(id) {
  moduleServer(id, function(input, output, session) { })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
