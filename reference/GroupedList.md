# GroupedList

A grouped list (`GroupedList`) allows you to render a set of items as
multiple lists with various grouping properties.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/GroupedList).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
GroupedList(...)

GroupHeader(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Custom className

- **compact** `boolean`  
  Boolean value to indicate if the component should render in compact
  mode. Set to false by default

- **componentRef** `IRefObject<{}>`  

- **expandButtonProps** `React.HTMLAttributes<HTMLButtonElement>`  
  Props for expand/collapse button

- **footerText** `string`  
  Text to display for the group footer.

- **group** `IGroup`  
  The group to be rendered by the header.

- **groupIndex** `number`  
  The index of the group.

- **groupLevel** `number`  
  The indent level of the group.

- **groups** `IGroup[]`  
  Stores parent group's children.

- **indentWidth** `number`  
  Width corresponding to a single level. This is multiplied by the
  groupLevel to get the full spacer width for the group.

- **isCollapsedGroupSelectVisible** `boolean`  
  Determines if the group selection check box is shown for collapsed
  groups.

- **isGroupLoading** `(group: IGroup) => boolean`  
  Callback to determine if a group has missing items and needs to load
  them from the server.

- **isSelected** `boolean`  
  Deprecated at v.65.1 and will be removed by v 1.0. Use `selected`
  instead.

- **loadingText** `string`  
  Text shown on group headers to indicate the group is being loaded.

- **onGroupHeaderClick** `(group: IGroup) => void`  
  Callback for when the group header is clicked.

- **onRenderTitle** `IRenderFunction<IGroupHeaderProps>`  
  Override which allows the caller to provider a custom renderer for the
  GroupHeader title.

- **onToggleCollapse** `(group: IGroup) => void`  
  Callback for when the group is expanded or collapsed.

- **onToggleSelectGroup** `(group: IGroup) => void`  
  Callback for when the group is selected.

- **onToggleSummarize** `(group: IGroup) => void`  
  Callback for when the group "Show All" link is clicked

- **selected** `boolean`  
  If all items in the group are selected.

- **selectionMode** `SelectionMode`  
  The selection mode of the list the group lives within.

- **showAllLinkText** `string`  
  Text to display for the group "Show All" link.

- **theme** `ITheme`  
  Theme provided by the Higher Order Component

- **viewport** `IViewport`  
  A reference to the viewport in which the header is rendered.

- **className** `string`  
  Optional class name to add to the root element.

- **compact** `boolean`  
  Boolean value to indicate if the component should render in compact
  mode. Set to false by default

- **componentRef** `IRefObject<IGroupedList>`  
  Optional callback to access the IGroupedList interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **dragDropEvents** `IDragDropEvents`  
  Map of callback functions related to drag and drop functionality.

- **dragDropHelper** `IDragDropHelper`  
  helper to manage drag/drop across item and groups

- **eventsToRegister**
  `{ eventName: string; callback: (context: IDragDropContext, event?: any) => void; }[]`  
  Event names and corresponding callbacks that will be registered to
  groups and rendered elements

- **focusZoneProps** `IFocusZoneProps`  
  Optional properties to pass through to the FocusZone.

- **getGroupHeight** `(group: IGroup, groupIndex: number) => number`  
  Optional function to override default group height calculation used by
  list virtualization.

- **groupProps** `IGroupRenderProps`  
  Optional override properties to render groups.

- **groups** `IGroup[]`  
  Optional grouping instructions.

- **items** `any[]`  
  List of items to render.

- **listProps** `IListProps`  
  Optional properties to pass through to the list components being
  rendered.

- **onGroupExpandStateChanged**
  `(isSomeGroupExpanded: boolean) => void`  
  Optional callback when the group expand state changes between all
  collapsed and at least one group is expanded.

- **onRenderCell**
  `(nestingDepth?: number, item?: any, index?: number) => React.ReactNode`  
  Rendering callback to render the group items.

- **onShouldVirtualize** `(props: IListProps) => boolean`  
  Optional callback to determine whether the list should be rendered in
  full, or virtualized. Virtualization will add and remove pages of
  items as the user scrolls them into the visible range. This benefits
  larger list scenarios by reducing the DOM on the screen, but can
  negatively affect performance for smaller lists. The default
  implementation will virtualize when this callback is not provided.

- **selection** `ISelection`  
  Optional selection model to track selection state.

- **selectionMode** `SelectionMode`  
  Controls how/if the list manages selection.

- **styles**
  `IStyleFunctionOrObject<IGroupedListStyleProps, IGroupedListStyles>`  
  Style function to be passed in to override the themed or default
  styles

- **theme** `ITheme`  
  Theme that is passed in from Higher Order Component

- **usePageCache** `boolean`  
  boolean to control if pages containing unchanged items should be
  cached, this is a perf optimization The same property in List.Props

- **viewport** `IViewport`  
  Optional Viewport, provided by the parent component.

- **styles**
  `IStyleFunctionOrObject<IGroupFooterStyleProps, IGroupFooterStyles>`  
  Style function to be passed in to override the themed or default
  styles

- **checked** `boolean`  

- **theme** `ITheme`  

- **ariaPosInSet** `number`  
  Defines an element's number or position in the current set of
  listitems or treeitems

- **ariaSetSize** `number`  
  Defines the number of items in the current set of listitems or
  treeitems

- **expandButtonIcon** `string`  
  Defines the name of a custom icon to be used for group headers. If not
  set, the default icon will be used

- **expandButtonProps** `React.HTMLAttributes<HTMLButtonElement>`  
  Native props for the GroupHeader expand and collapse button

- **groupedListId** `string`  
  GroupedList id for aria-controls

- **onRenderGroupHeaderCheckbox**
  `IRenderFunction<IGroupHeaderCheckboxProps>`  
  If provided, can be used to render a custom checkbox

- **selectAllButtonProps** `React.HTMLAttributes<HTMLButtonElement>`  
  Native props for the GroupHeader select all button

- **styles**
  `IStyleFunctionOrObject<IGroupHeaderStyleProps, IGroupHeaderStyles>`  
  Style function to be passed in to override the themed or default
  styles

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **collapseAllVisibility** `CollapseAllVisibility`  
  Flag to indicate whether to ignore the collapsing icon on header.

- **footerProps** `IGroupFooterProps`  
  Information to pass in to the group footer.

- **getGroupItemLimit** `(group: IGroup) => number`  
  Grouping item limit.

- **headerProps** `IGroupHeaderProps`  
  Information to pass in to the group header.

- **isAllGroupsCollapsed** `boolean`  
  Boolean indicating if all groups are in collapsed state.

- **onRenderFooter** `IRenderFunction<IGroupFooterProps>`  
  Override which allows the caller to provide a custom footer.

- **onRenderHeader** `IRenderFunction<IGroupHeaderProps>`  
  Override which allows the caller to provide a custom header.

- **onRenderShowAll** `IRenderFunction<IGroupShowAllProps>`  
  Override which allows the caller to provide a custom Show All link.

- **onToggleCollapseAll** `(isAllCollapsed: boolean) => void`  
  Callback for when all groups are expanded or collapsed.

- **role** `string`  
  Override which allows the caller to provide a custom aria role

- **showAllProps** `IGroupShowAllProps`  
  Information to pass in to the group Show all footer.

- **showEmptyGroups** `boolean`  
  Boolean indicating if empty groups are shown

- **showAllLinkText** `string`  
  The Show All link text.

- **styles**
  `IStyleFunctionOrObject<IGroupShowAllStyleProps, IGroupShowAllStyles>`  
  Style function to be passed in to override the themed or default
  styles

- **count** `number`  
  Count of spacer(s)

- **indentWidth** `number`  
  How much to indent

- **styles**
  `IStyleFunctionOrObject<IGroupSpacerStyleProps, IGroupSpacerStyles>`  
  Style function to be passed in to override the themed or default
  styles

- **theme** `ITheme`  
  Theme from Higher Order Component

## Best practices

### FAQ

#### My List is not re-rendering when I mutate its items. What should I do?

To determine if the list within the grouped list should re-render its
contents, the component performs a referential equality check within its
`shouldComponentUpdate` method. This is done to minimize the performance
overhead associating with re-rendering the virtualized List pages, as
recommended by the [React
documentation](https://reactjs.org/docs/optimizing-performance.html#the-power-of-not-mutating-data).

As a result of this implementation, the inner list will not determine it
should re-render if the array values are mutated. To avoid this problem,
we recommend re-creating the items array backing the grouped list by
using a method such as `Array.prototype.concat` or ES6 spread syntax
shown below:

By re-creating the items array without mutating the values, the inner
List will correctly determine its contents have changed and then it
should re-render with the new values.

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  GroupedList(
    items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
    groups = list(
      list(key = "g1", name = "Some items", startIndex = 0, count = 2),
      list(key = "g2", name = "More items", startIndex = 2, count = 3)
    ),
    selectionMode = 0,
    onRenderCell = JS("(depth, item) => (
      jsmodule['react'].createElement('span', { style: { paddingLeft: 49 } }, item)
    )")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  fluentPage(
    GroupedList(
      items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
      groups = list(
        list(key = "g1", name = "Some items", startIndex = 0, count = 2),
        list(key = "g2", name = "More items", startIndex = 2, count = 3)
      ),
      selectionMode = 0,
      onRenderCell = JS(
        "(depth, item) => (
          jsmodule['react'].createElement('span', { style: { paddingLeft: 50 } }, item)
        )"
      ),
      groupProps = list(
        onRenderHeader = JS(
          "(props) => (
            jsmodule['react'].createElement(
              jsmodule['@fluentui/react'].GroupHeader,
              { ...props, styles: { headerCount: { display: 'none' } } },
              props
            )
          )"
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
