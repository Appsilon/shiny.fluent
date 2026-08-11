# Pivot

The Pivot control and related tabs pattern are used for navigating
frequently accessed, distinct content categories. Pivots allow for
navigation between two or more content views and relies on text headers
to articulate the different sections of content.

- Tapping on a pivot item header navigates to that header's section
  content.

Tabs are a visual variant of Pivot that use a combination of icons and
text or just icons to articulate section content.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Pivot).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Pivot(...)

PivotItem(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **alwaysRender** `boolean`  
  Defines whether to always render the pivot item (regardless of whether
  it is selected or not). Useful if you're rendering content that is
  expensive to mount.

- **ariaLabel** `string`  
  The aria label of each pivot link which will read by screen reader
  instead of linkText.

Note that unless you have compelling requirements you should not
override aria-label.

- **componentRef** `IRefObject<{}>`  
  Gets the component ref.

- **headerButtonProps**
  `IButtonProps | { [key: string]: string | number | boolean; }`  
  Props for the header command button. This provides a way to pass in
  native props, such as data-\* and aria-\*, for each pivot header/link
  element.

- **headerText** `string`  
  The text displayed of each pivot link.

- **itemCount** `number | string`  
  Defines an optional item count displayed in parentheses just after the
  `linkText`.

Examples: completed (4), Unread (99+)

- **itemIcon** `string`  
  An optional icon to show next to the pivot link.

- **itemKey** `string`  
  An required key to uniquely identify a pivot item.

Note: The 'key' from react props cannot be used inside component.

- **keytipProps** `IKeytipProps`  
  Optional keytip for this PivotItem.

- **linkText** `string`  
  The text displayed of each pivot link - renaming to `headerText`.

- **onRenderItemLink** `IRenderFunction<IPivotItemProps>`  
  Optional custom renderer for the pivot item link.

- **className** `string`  
  Additional css class to apply to the Pivot

- **componentRef** `IRefObject<IPivot>`  
  Optional callback to access the IPivot interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **defaultSelectedIndex** `number`  
  Default selected index for the pivot. Only provide this if the pivot
  is an uncontrolled component; otherwise, use the `selectedKey`
  property.

This property is also mutually exclusive with `defaultSelectedKey`.

- **defaultSelectedKey** `string`  
  Default selected key for the pivot. Only provide this if the pivot is
  an uncontrolled component; otherwise, use the `selectedKey` property.

This property is also mutually exclusive with `defaultSelectedIndex`.

- **getTabId** `(itemKey: string, index: number) => string`  
  Callback to customize how IDs are generated for each tab header.
  Useful if you're rendering content outside and need to connect
  aria-labelledby.

- **headersOnly** `boolean`  
  Whether to skip rendering the tabpanel with the content of the
  selected tab. Use this prop if you plan to separately render the tab
  content and don't want to leave an empty tabpanel in the page that may
  confuse Screen Readers.

- **initialSelectedIndex** `number`  
  Index of the pivot item initially selected. Mutually exclusive with
  `initialSelectedKey`. Only provide this if the pivot is an
  uncontrolled component; otherwise, use `selectedKey`.

- **initialSelectedKey** `string`  
  Key of the pivot item initially selected. Mutually exclusive with
  `initialSelectedIndex`. Only provide this if the pivot is an
  uncontrolled component; otherwise, use `selectedKey`.

- **linkFormat** `PivotLinkFormat`  
  PivotLinkFormat to use (links, tabs)

- **linkSize** `PivotLinkSize`  
  PivotLinkSize to use (normal, large)

- **onLinkClick**
  `(item?: PivotItem, ev?: React.MouseEvent<HTMLElement>) => void`  
  Callback for when the selected pivot item is changed.

- **selectedKey** `string | null`  
  Key of the selected pivot item. Updating this will override the
  Pivot's selected item state. Only provide this if the pivot is a
  controlled component where you are maintaining the current state;
  otherwise, use `defaultSelectedKey`.

- **styles** `IStyleFunctionOrObject<IPivotStyleProps, IPivotStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Pivot(
    PivotItem(headerText = "Tab 1", Label("Hello 1")),
    PivotItem(headerText = "Tab 2", Label("Hello 2"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
