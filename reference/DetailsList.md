# DetailsList

A details list (`DetailsList`) is a robust way to display an
information-rich collection of items, and allow people to sort,
group, and filter the content. Use a details
list when information density is critical.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/DetailsList).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
DetailsList(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **onColumnDragEnd**
  `(props: { dropLocation?: ColumnDragEndLocation; }, event: MouseEvent) => void`  
  Callback to notify the column dragEnd event to List Need this to check
  whether the dragEnd has happened on corresponding list or outside of
  the list

- **cellStyleProps** `ICellStyleProps`  
  Custom styles for cell rendering.

- **column** `IColumn`  
  The column definition for the component instance.

- **columnIndex** `number`  
  The column index for the component instance.

- **componentRef** `() => void`  
  A reference to the component instance.

- **dragDropHelper** `IDragDropHelper | null`  
  The drag and drop helper for the component instance.

- **isDraggable** `boolean`  
  Whether or not the column can be re-ordered via drag and drop.

- **isDropped** `boolean`  
  Whether or not the column has been dropped via drag and drop.

- **onColumnClick**
  `(ev: React.MouseEvent<HTMLElement>, column: IColumn) => void`  
  Callback fired when click event occurs.

- **onColumnContextMenu**
  `(column: IColumn, ev: React.MouseEvent<HTMLElement>) => void`  
  Callback fired on contextual menu event to provide contextual menu UI.

- **onRenderColumnHeaderTooltip**
  `IRenderFunction<IDetailsColumnRenderTooltipProps>`  
  Render function for providing a column header tooltip.

- **parentId** `string`  
  Parent ID used for accessibility label(s).

- **setDraggedItemIndex** `(itemIndex: number) => void`  

- **styles**
  `IStyleFunctionOrObject<IDetailsColumnStyleProps, IDetailsColumnStyles>`  
  The component styles to respect during render.

- **theme** `ITheme`  
  The theme object to respect during render.

- **updateDragInfo**
  `(props: { itemIndex: number; }, event?: MouseEvent) => void`  
  Callback on drag and drop event.

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **columns** `IColumn[]`  
  Column metadata

- **selection** `ISelection`  
  Selection from utilities

- **selectionMode** `SelectionMode`  
  Selection mode

- **onRenderFooter** `IRenderFunction<IDetailsGroupDividerProps>`  

- **onRenderHeader** `IRenderFunction<IDetailsGroupDividerProps>`  

- **ariaLabel** `string`  
  ariaLabel for the entire header

- **ariaLabelForSelectAllCheckbox** `string`  
  ariaLabel for the header checkbox that selects or deselects everything

- **ariaLabelForSelectionColumn** `string`  
  ariaLabel for the selection column

- **ariaLabelForToggleAllGroupsButton** `string`  
  ariaLabel for expand/collapse group button

- **className** `string`  
  Overriding class name

- **collapseAllVisibility** `CollapseAllVisibility`  
  Whether to collapse for all visibility

- **columnReorderOptions** `IColumnReorderOptions`  
  Column reordering options

- **columnReorderProps** `IColumnReorderHeaderProps`  
  Column reordering options

- **componentRef** `IRefObject<IDetailsHeader>`  
  Ref to the component itself

- **isAllCollapsed** `boolean`  
  Whether or not all is collapsed

- **layoutMode** `DetailsListLayoutMode`  
  Layout mode - fixedColumns or justified

- **minimumPixelsForDrag** `number`  
  Minimum pixels to be moved before dragging is registered

- **onColumnAutoResized**
  `(column: IColumn, columnIndex: number) => void`  
  Callback for when column is automatically resized

- **onColumnClick**
  `(ev: React.MouseEvent<HTMLElement>, column: IColumn) => void`  
  Callback for when the column is clicked

- **onColumnContextMenu**
  `(column: IColumn, ev: React.MouseEvent<HTMLElement>) => void`  
  Callback for when the column needs to show a context menu

- **onColumnIsSizingChanged**
  `(column: IColumn, isSizing: boolean) => void`  
  Callback for when column sizing has changed

- **onColumnResized**
  `(column: IColumn, newWidth: number, columnIndex: number) => void`  
  Callback for when column is resized

- **onRenderColumnHeaderTooltip**
  `IRenderFunction<IDetailsColumnRenderTooltipProps>`  
  Callback to render a tooltip for the column header

- **onRenderDetailsCheckbox** `IRenderFunction<IDetailsCheckboxProps>`  
  If provided, can be used to render a custom checkbox

- **onToggleCollapseAll** `(isAllCollapsed: boolean) => void`  
  Callback for when collapse all is toggled

- **selectAllVisibility** `SelectAllVisibility`  
  Select all button visibility

- **styles**
  `IStyleFunctionOrObject<IDetailsHeaderStyleProps, IDetailsHeaderStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme from the Higher Order Component

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **columns** `IColumn[]`  
  Column metadata

- **selection** `ISelection`  
  Selection from utilities

- **selectionMode** `SelectionMode`  
  Selection mode

- **cellStyleProps** `ICellStyleProps`  
  Rules for rendering column cells.

- **checkboxVisibility** `CheckboxVisibility | undefined`  
  Checkbox visibility

- **columns** `IColumn[]`  
  Column metadata

- **groupNestingDepth** `number`  
  Nesting depth of a grouping

- **indentWidth** `number | undefined`  
  How much to indent

- **rowWidth** `number`  
  Minimum width of the row.

- **selection** `ISelection | undefined`  
  Selection from utilities

- **selectionMode** `SelectionMode | undefined`  
  Selection mode

- **viewport** `IViewport | undefined`  
  View port of the virtualized list

- **ariaLabel** `string`  
  Accessible label describing or summarizing the list.

- **ariaLabelForGrid** `string`  
  Accessible label for the grid within the list.

- **ariaLabelForListHeader** `string`  
  Accessible label for the list header.

- **ariaLabelForSelectAllCheckbox** `string`  
  Accessible label for the select all checkbox.

- **ariaLabelForSelectionColumn** `string`  
  Accessible label for the name of the selection column.

- **cellStyleProps** `ICellStyleProps`  
  Props impacting the render style of cells. Since these have an impact
  on calculated column widths, they are handled separately from normal
  theme styling, but they are passed to the styling system.

- **checkboxCellClassName** `string`  
  Class name to add to the cell of a checkbox.

- **checkboxVisibility** `CheckboxVisibility`  
  Controls the visibility of selection check box.

- **checkButtonAriaLabel** `string`  
  Accessible label for the check button.

- **className** `string`  
  Class name to add to the root element.

- **columnReorderOptions** `IColumnReorderOptions`  
  Options for column reordering using drag and drop.

- **columns** `IColumn[]`  
  column defitions. If none are provided, default columns will be
  created based on the items' properties.

- **compact** `boolean`  
  Whether to render in compact mode.

- **componentRef** `IRefObject<IDetailsList>`  
  Callback to access the IDetailsList interface. Use this instead of ref
  for accessing the public methods and properties of the component.

- **constrainMode** `ConstrainMode`  
  Controls how the list contrains overflow.

- **disableSelectionZone** `boolean`  
  Whether to disable the built-in SelectionZone, so the host component
  can provide its own.

- **dragDropEvents** `IDragDropEvents`  
  Map of callback functions related to row drag and drop functionality.

- **enableUpdateAnimations** `boolean`  
  Whether to animate updates

- **enterModalSelectionOnTouch** `boolean`  
  Whether the selection zone should enter modal state on touch.

- **getCellValueKey**
  `(item?: any, index?: number, column?: IColumn) => string`  
  If provided, will be the "default" item column cell value return. A
  column's `getValueKey` can override `getCellValueKey`.

- **getGroupHeight** `IGroupedListProps['getGroupHeight']`  
  Callback to override default group height calculation used by list
  virtualization.

- **getKey** `(item: any, index?: number) => string`  
  Callback to get the item key, to be used in the selection and on
  render. Must be provided if sorting or filtering is enabled.

- **getRowAriaDescribedBy** `(item: any) => string`  
  Callback to get the aria-describedby IDs (space-separated strings) of
  elements that describe the item.

- **getRowAriaLabel** `(item: any) => string`  
  Callback to get the aria-label string for a given item.

- **groupProps** `IDetailsGroupRenderProps`  
  Override properties to render groups.

- **groups** `IGroup[]`  
  Grouping instructions.

- **indentWidth** `number`  
  Override for the indent width used for group nesting.

- **initialFocusedIndex** `number`  
  Default index to set focus to once the items have rendered and the
  index exists.

- **isHeaderVisible** `boolean`  
  Controls the visibility of the header.

- **isPlaceholderData** `boolean`  
  Set this to true to indicate that the items being displayed are
  placeholder data.

- **items** `any[]`  
  The items to render.

- **layoutMode** `DetailsListLayoutMode`  
  Controls how the columns are adjusted.

- **listProps** `IListProps`  
  Properties to pass through to the List components being rendered.

- **minimumPixelsForDrag** `number`  
  The minimum mouse move distance to interpret the action as drag event.

- **onActiveItemChanged**
  `(item?: any, index?: number, ev?: React.FocusEvent<HTMLElement>) => void`  
  Callback for when an item in the list becomes active by clicking
  anywhere inside the row or navigating to it with the keyboard.

- **onColumnHeaderClick**
  `(ev?: React.MouseEvent<HTMLElement>, column?: IColumn) => void`  
  Callback for when the user clicks on the column header.

- **onColumnHeaderContextMenu**
  `(column?: IColumn, ev?: React.MouseEvent<HTMLElement>) => void`  
  Callback for when the user asks for a contextual menu (usually via
  right click) from a column header.

- **onColumnResize**
  `(column?: IColumn, newWidth?: number, columnIndex?: number) => void`  
  Callback fired on column resize

- **onDidUpdate** `(detailsList?: DetailsListBase) => void`  
  Callback for when the list has been updated. Useful for telemetry
  tracking externally.

- **onItemContextMenu**
  `(item?: any, index?: number, ev?: Event) => void | boolean`  
  Callback for when the context menu of an item has been accessed. If
  undefined or false is returned, `ev.preventDefault()` will be called.

- **onItemInvoked** `(item?: any, index?: number, ev?: Event) => void`  
  Callback for when a given row has been invoked (by pressing enter
  while it is selected.)

- **onRenderCheckbox** `IRenderFunction<IDetailsListCheckboxProps>`  
  If provided, can be used to render a custom checkbox.

- **onRenderDetailsFooter** `IRenderFunction<IDetailsFooterProps>`  
  An override to render the details footer.

- **onRenderDetailsHeader** `IRenderFunction<IDetailsHeaderProps>`  
  An override to render the details header.

- **onRenderItemColumn**
  `(item?: any, index?: number, column?: IColumn) => React.ReactNode`  
  If provided, will be the "default" item column renderer method. This
  affects cells within the rows, not the rows themselves. If a column
  definition provides its own `onRender` method, that will be used
  instead of this.

- **onRenderMissingItem**
  `(index?: number, rowProps?: IDetailsRowProps) => React.ReactNode`  
  Callback for what to render when the item is missing.

- **onRenderRow** `IRenderFunction<IDetailsRowProps>`  
  Callback to override the default row rendering.

- **onRowDidMount** `(item?: any, index?: number) => void`  
  Callback for when a given row has been mounted. Useful for identifying
  when a row has been rendered on the page.

- **onRowWillUnmount** `(item?: any, index?: number) => void`  
  Callback for when a given row has been unmounted. Useful for
  identifying when a row has been removed from the page.

- **onShouldVirtualize** `(props: IListProps) => boolean`  
  Callback to determine whether the list should be rendered in full, or
  virtualized.

Virtualization will add and remove pages of items as the user scrolls
them into the visible range. This benefits larger list scenarios by
reducing the DOM on the screen, but can negatively affect performance
for smaller lists.

The default implementation will virtualize when this callback is not
provided.

- **rowElementEventMap**
  `{ eventName: string; callback: (context: IDragDropContext, event?: any) => void; }[]`  
  Event names and corresponding callbacks that will be registered to
  rendered row elements.

- **selection** `ISelection`  
  Selection model to track selection state.

- **selectionMode** `SelectionMode`  
  Controls how/if the details list manages selection. Options include
  none, single, multiple

- **selectionPreservedOnEmptyClick** `boolean`  
  By default, selection is cleared when clicking on an empty
  (non-focusable) section of the screen. Setting this value to true
  overrides that behavior and maintains selection.

- **selectionZoneProps** `ISelectionZoneProps`  
  Additional props to pass through to the SelectionZone created by
  default.

- **setKey** `string`  
  A key that uniquely identifies the given items. If provided, the
  selection will be reset when the key changes.

- **shouldApplyApplicationRole** `boolean`  
  Whether the role `application` should be applied to the list.

- **styles**
  `IStyleFunctionOrObject<IDetailsListStyleProps, IDetailsListStyles>`  
  Custom overrides to the themed or default styles.

- **theme** `ITheme`  
  Theme provided by a higher-order component.

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **usePageCache** `boolean`  
  Whether to enable render page caching. This is an experimental
  performance optimization that is off by default.

- **useReducedRowRenderer** `boolean`  
  Whether to re-render a row only when props changed. Might cause
  regression when depending on external updates.

- **viewport** `IViewport`  
  Viewport info, provided by the `withViewport` decorator.

- **cellsByColumn** `{ [columnKey: string]: React.ReactNode; }`  
  Optional pre-rendered content per column. Preferred over onRender or
  onRenderItemColumn if provided.

- **checkboxCellClassName** `string`  
  Class name for the checkbox cell

- **checkButtonAriaLabel** `string`  
  Check button's aria label

- **className** `string`  
  Overriding class name

- **collapseAllVisibility** `CollapseAllVisibility`  
  Collapse all visibility

- **compact** `boolean`  
  Whether to render in compact mode

- **componentRef** `IRefObject<IDetailsRow>`  
  Ref of the component

- **dragDropEvents** `IDragDropEvents`  
  Handling drag and drop events

- **dragDropHelper** `IDragDropHelper`  
  Helper for the drag and drop

- **enableUpdateAnimations** `boolean`  
  Whether to animate updates

- **eventsToRegister**
  `{ eventName: string; callback: (item?: any, index?: number, event?: any) => void; }[]`  
  A list of events to register

- **getRowAriaDescribedBy** `(item: any) => string`  
  Callback for getting the row aria-describedby

- **getRowAriaLabel** `(item: any) => string`  
  Callback for getting the row aria label

- **item** `any`  
  Data source for this component

- **itemIndex** `number`  
  Index of the collection of items of the DetailsList

- **onDidMount** `(row?: DetailsRowBase) => void`  
  Callback for did mount for parent

- **onRenderCheck** `(props: IDetailsRowCheckProps) => JSX.Element`  
  Callback for rendering a checkbox

- **onRenderDetailsCheckbox** `IRenderFunction<IDetailsCheckboxProps>`  
  If provided, can be used to render a custom checkbox

- **onWillUnmount** `(row?: DetailsRowBase) => void`  
  Callback for will mount for parent

- **rowFieldsAs** `React.ComponentType<IDetailsRowFieldsProps>`  
  DOM element into which to render row field

- **styles**
  `IStyleFunctionOrObject<IDetailsRowStyleProps, IDetailsRowStyles>`  
  Overriding styles to this row

- **theme** `ITheme`  
  Theme provided by styled() function

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **useReducedRowRenderer** `boolean`  
  Rerender DetailsRow only when props changed. Might cause regression
  when depending on external updates.

- **anySelected** `boolean`  
  Is any selected - also true for isSelectionModal

- **canSelect** `boolean`  
  Can this checkbox be selectable

- **checkClassName** `string`  
  The classname to be passed down to Check component

- **className** `string`  
  Optional className to attach to the slider root element.

- **compact** `boolean`  
  Is this in compact mode?

- **isHeader** `boolean`  
  Is the check part of the header in a DetailsList

- **isVisible** `boolean`  
  Whether or not this checkbox is visible

- **onRenderDetailsCheckbox** `IRenderFunction<IDetailsCheckboxProps>`  
  If provided, can be used to render a custom checkbox

- **selected** `boolean`  
  Whether or not this check is selected

- **styles**
  `IStyleFunctionOrObject<IDetailsRowCheckStyleProps, IDetailsRowCheckStyles>`  
  Style override

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **useFastIcons** `boolean`  
  Whether to use fast icon and check components. The icons can't be
  targeted by customization but are still customizable via class names.

- **cellStyleProps** `ICellStyleProps`  
  Style properties to customize cell render output.

- **columns** `IColumn[]`  
  Columns metadata

- **columnStartIndex** `number`  
  Index to start for the column

- **compact** `boolean`  
  whether to render as a compact field

- **enableUpdateAnimations** `boolean`  

- **item** `any`  
  Data source for this component

- **itemIndex** `number`  
  The item index of the collection for the DetailsList

- **rowClassNames**
  `{ [k in keyof Pick<IDetailsRowStyles, 'isMultiline' | 'isRowHeader' | 'cell' | 'cellAnimation' | 'cellPadded' | 'cellUnpadded' | 'fields'>]: string; }`  
  Subset of classnames currently generated in DetailsRow that are used
  within DetailsRowFields.

- **columns** `IColumn[]`  
  Column metadata

- **selection** `ISelection`  
  Selection from utilities

- **selectionMode** `SelectionMode`  
  Selection mode

- **ariaLabelForShimmer** `string`  
  Aria label for shimmer. Set on grid while shimmer is enabled.

- **detailsListStyles** `IDetailsListProps['styles']`  
  DetailsList styles to pass through.

- **enableShimmer** `boolean`  
  Boolean flag to control when to render placeholders vs real items.
  It's up to the consumer app to know when fetching of the data is done
  to toggle this prop.

- **onRenderCustomPlaceholder**
  `(rowProps: IDetailsRowProps, index?: number, defaultRender?: (props: IDetailsRowProps) => React.ReactNode) => React.ReactNode`  
  Custom placeholder renderer to be used when in need to override the
  default placeholder of a DetailsRow. `rowProps` argument is passed to
  leverage the calculated column measurements done by DetailsList or you
  can use the optional arguments of item `index` and `defaultRender` to
  execute additional logic before rendering the default placeholder.

- **removeFadingOverlay** `boolean`  
  Determines whether to remove a fading out to bottom overlay over the
  shimmering items used to further emphasize the unknown number of items
  that will be fetched.

- **shimmerLines** `number`  
  Number of shimmer placeholder lines to render.

- **shimmerOverlayStyles**
  `IStyleFunctionOrObject<IShimmeredDetailsListStyleProps, IShimmeredDetailsListStyles>`  
  Custom styles to override the styles specific to the
  ShimmeredDetailsList root area.

- **styles**
  `IStyleFunctionOrObject<IShimmeredDetailsListStyleProps, IShimmeredDetailsListStyles>`  
  Custom styles to override the styles specific to the
  ShimmeredDetailsList root area.

- **skipViewportMeasures** `boolean`  
  Whether or not to use ResizeObserver (if available) to detect and
  measure viewport on 'resize' events.

Falls back to window 'resize' event.

## Best practices

### Layout

- List items are composed of selection, icon, and name columns at
  minimum. You can include other columns, such as date modified, or any
  other metadata field associated with the collection.

- Avoid using file type icon overlays to denote status of a file as it
  can make the entire icon unclear.

- If there are multiple lines of text in a column, consider the variable
  row height variant.

- Give columns ample default width to display information.

### Content

- Use sentence-style capitalization for column headers—only capitalize
  the first word. For more info, see `[Capitalization]` in the Microsoft
  Writing Style Guide.

`[capitalization]`:
https://learn.microsoft.com/style-guide/capitalization

### FAQ

#### My scrollable content isn't updating on scroll. What should I do?

Add the `data-is-scrollable="true"` attribute to your scrollable element
containing the DetailsList.

By default, the List used within DetailsList will use the `body` element
as the scrollable element. If you contain the List within a scrollable
`div` using `overflow: auto` or `scroll`, the List needs to listen for
scroll events on that element instead. On initialization, the List will
traverse up the DOM looking for the first element with the
`data-is-scrollable` attribute to know which element to listen to for
knowing when to re-evaulate the visible window.

#### My List is not re-rendering when I mutate its items. What should I do?

To determine if the List within DetailsList should re-render its
contents, the component performs a referential equality check within its
`shouldComponentUpdate` method. This is done to minimize the performance
overhead associated with re-rendering the virtualized List pages, as
recommended by the [React
documentation](https://reactjs.org/docs/optimizing-performance.html#the-power-of-not-mutating-data).

As a result of this implementation, the inner List will not determine it
should re-render if the array values are mutated. To avoid this problem,
we recommend re-creating the items array backing the DetailsList by
using a method such as `Array.prototype.concat` or ES6 spread syntax
shown below:

By re-creating the items array without mutating the values, the inner
List will correctly determine its contents have changed and it should
then re-render with the new values.

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

items <- list(
  list(key = "1", name = "Mark", surname = "Swanson"),
  list(key = "2", name = "Josh", surname = "Johnson")
)

columns <- list(
  list(key = "name", fieldName = "name", name = "Name"),
  list(key = "surname", fieldName = "surname", name = "Surname")
)


ui <- function(id) {
  ns <- NS(id)
  DetailsList(items = items, columns = columns)
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

# Custom columns text alignment and formatting
items <- list(
  list(
    key = "1",
    name = "Mark",
    number = "2"
  ),
  list(
    key = "2",
    name = "Josh",
    number = "1"
  )
)

columns <- list(
  list(
    key = "name",
    fieldName = "name",
    name = "Name"
  ),
  list(
    key = "number",
    fieldName = "number",
    name = "Number"
  )
)

ui <- function(id) {
  DetailsList(
    items = items,
    columns = columns,
    onRenderItemColumn = JS("(item, index, column) => {
      const fieldContent = item[column.fieldName]
      switch (column.key) {
        case 'name':
          return React.createElement(
            'span',
            {
              style: { textAlign: 'right', width: '100%', display: 'block' }
            },
            fieldContent
          );
        case 'number':
          return React.createElement(
            'span',
            {
              style: { textAlign: 'left', width: '100%', display: 'block' }
            },
            `%${fieldContent}`
          );
        default:
          return React.createElement('span', null, fieldContent);
      }
    }")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 3
library(shiny)
library(shiny.fluent)

# Selecting rows in DetailsList
CustomComponents <- tags$script(HTML("(function() {
  const React = jsmodule['react'];
  const Fluent = jsmodule['@fluentui/react'];
  const Shiny = jsmodule['@/shiny'];
  const CustomComponents = jsmodule['CustomComponents'] ??= {};

  function useSelection(inputId) {
    const selection = React.useRef(new Fluent.Selection({
      onSelectionChanged() {
        const value = this.getSelectedIndices().map(i => i + 1); // R uses 1-based indexing.
        Shiny.setInputValue(inputId, value);
      }
    }));
    return selection.current;
  }

  CustomComponents.DetailsList = function DetailsList({ inputId, ...rest }) {
    const selection = useSelection(inputId);
    return React.createElement(Fluent.DetailsList, { selection, ...rest });
  }
})()"))

DetailsList.shinyInput <- function(inputId, ...) {
  shiny.react::reactElement(
    module = "CustomComponents",
    name = "DetailsList",
    props = shiny.react::asProps(inputId = inputId, ...),
    deps = shinyFluentDependency()
  )
}

items <- list(
  list(name = "Apple"),
  list(name = "Banana"),
  list(name = "Cherry")
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CustomComponents,
    DetailsList.shinyInput(ns("selection"), items = items),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text <- renderText(paste(input$selection, collapse = ", "))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
