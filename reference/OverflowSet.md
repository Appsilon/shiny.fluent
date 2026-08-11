# OverflowSet

The OverflowSet is a flexible container component that is useful for
displaying a primary set of content with additional content in an
overflow callout. Note that the example below is only an example of how
to render the component, not a specific use case.

### Accessibility

By default, the OverflowSet is simply `role=group`. If you used as a
menu, you will need to add `role="menubar"` and add proper aria roles to
each rendered item (`menuitem`, `menuitemcheckbox`, `menuitemradio`)

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/OverflowSet).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
OverflowSet(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **key** `string`  
  Unique id to identify the item.

- **keytipProps** `IKeytipProps`  
  Optional keytip for the overflowSetItem.

- **className** `string`  
  Class name

- **componentRef** `IRefObject<IOverflowSet>`  
  Gets the component ref.

- **doNotContainWithinFocusZone** `boolean`  
  If true do not contain the OverflowSet inside of a FocusZone,
  otherwise the OverflowSet will contain a FocusZone. If this is set to
  true focusZoneProps will be ignored. Use one or the other.

- **focusZoneProps** `IFocusZoneProps`  
  Custom properties for OverflowSet's FocusZone. If
  doNotContainWithinFocusZone is set to true focusZoneProps will be
  ignored. Use one or the other.

- **items** `IOverflowSetItemProps[]`  
  An array of items to be rendered by your onRenderItem function in the
  primary content area

- **itemSubMenuProvider**
  `(item: IOverflowSetItemProps) => any[] | undefined`  
  Function that will take in an IOverflowSetItemProps and return the
  subMenu for that item. If not provided, will use
  'item.subMenuProps.items' by default. This is only used if your
  overflow set has keytips.

- **keytipSequences** `string[]`  
  Optional full keytip sequence for the overflow button, if it will have
  a keytip.

- **onRenderItem** `(item: IOverflowSetItemProps) => any`  
  Method to call when trying to render an item.

- **onRenderOverflowButton** `IRenderFunction<any[]>`  
  Rendering method for overflow button and contextual menu. The argument
  to the function is the overflowItems passed in as props to this
  function.

- **overflowItems** `IOverflowSetItemProps[]`  
  An array of items to be passed to overflow contextual menu

- **overflowSide** `'start' | 'end'`  
  Controls wether or not the overflow button is placed at the start or
  end of the items. This gives a reveresed visual behavior but maintains
  correct keyboard navigation.

- **role** `string`  
  The role for the OverflowSet.

- **styles**
  `IStyleFunctionOrObject<IOverflowSetProps, IOverflowSetStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **vertical** `boolean`  
  Change item layout direction to vertical/stacked. If role is set to
  `menubar`, `vertical={true}` will also add proper `aria-orientation`.

## Examples

``` r
library(shiny)
library(shiny.fluent)

items <- list(
  list(key = "item1", icon = "Add", name = "Link 1"),
  list(key = "item2", icon = "Upload", name = "Link 2"),
  list(key = "item3", icon = "Share", name = "Link 3")
)
overflowItems <- list(
  list(key = "item4", icon = "Mail", name = "Overflow Link 1"),
  list(key = "item5", icon = "Calendar", name = "Overflow Link 2")
)
onRenderItem <- JS("item =>
  jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
    role: 'menuitem',
    iconProps: { iconName: item.icon },
    styles: {
      root: { padding: '10px' }
    }
  })
")
onRenderOverflowButton <- JS("overflowItems =>
  jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
    role: 'menuitem',
    title: 'More items',
    styles: {
      root: { padding: '10px' }
    },
    menuIconProps: { iconName: 'More' },
    menuProps: { items: overflowItems }
  })
")


ui <- function(id) {
  ns <- NS(id)
  OverflowSet(
    vertical = TRUE,
    items = items,
    overflowItems = overflowItems,
    onRenderItem = onRenderItem,
    onRenderOverflowButton = onRenderOverflowButton
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
