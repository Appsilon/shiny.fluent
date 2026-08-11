# List

A list provides a base component for rendering large sets of items. It’s
agnostic of layout, the tile component used, and selection management.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/List).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
List(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **divProps** `React.HTMLAttributes<HTMLDivElement>`  
  Props to apply to the list root element.

- **pages** `IPage<T>[]`  
  The active pages to be rendered into the list. These will have been
  rendered using `onRenderPage`.

- **rootRef** `React.Ref<HTMLDivElement>`  
  The ref to be applied to the list root. The `List` uses this element
  to track scroll position and sizing.

- **surfaceElement** `JSX.Element | null`  
  The content to be rendered as the list surface element. This will have
  been rendered using `onRenderSurface`.

- **divProps** `React.HTMLAttributes<HTMLDivElement>`  
  Props to apply to the list surface element.

- **pageElements** `JSX.Element[]`  
  The content to be rendered representing all active pages.

- **pages** `IPage<T>[]`  
  The active pages to be rendered into the list. These will have been
  rendered using `onRenderPage`.

- **surfaceRef** `React.Ref<HTMLDivElement>`  
  A ref to be applied to the surface element. The `List` uses this
  element to track content size and focus.

- **className** `string`  
  Optional classname to append to root list.

- **componentRef** `IRefObject<IList>`  
  Optional callback to access the IList interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **getItemCountForPage**
  `(itemIndex?: number, visibleRect?: IRectangle) => number`  
  Method called by the list to get how many items to render per page
  from specified index. In general, use `getPageSpecification` instead.

- **getKey** `(item: T, index?: number) => string`  
  Optional callback to get the item key, to be used on render.

- **getPageHeight**
  `(itemIndex?: number, visibleRect?: IRectangle, itemCount?: number) => number`  
  Method called by the list to get the pixel height for a given page. By
  default, we measure the first page's height and default all other
  pages to that height when calculating the surface space. It is ideal
  to be able to adequately predict page heights in order to keep the
  surface space from jumping in pixels, which has been seen to cause
  browser performance issues. In general, use `getPageSpecification`
  instead.

- **getPageSpecification**
  `(itemIndex?: number, visibleRect?: IRectangle) => IPageSpecification`  
  Called by the list to get the specification for a page. Use this
  method to provide an allocation of items per page, as well as an
  estimated rendered height for the page. The list will use this to
  optimize virtualization.

- **getPageStyle** `(page: IPage<T>) => any`  
  Method called by the list to derive the page style object. For spacer
  pages, the list will derive the height and passed in heights will be
  ignored.

- **ignoreScrollingState** `boolean`  
  Whether to disable scroll state updates. This causes the isScrolling
  arg in onRenderCell to always be undefined. This is a performance
  optimization to let List skip a render cycle by not updating its
  scrolling state.

- **items** `T[]`  
  Items to render.

- **onPageAdded** `(page: IPage<T>) => void`  
  Optional callback for monitoring when a page is added.

- **onPageRemoved** `(page: IPage<T>) => void`  
  Optional callback for monitoring when a page is removed.

- **onPagesUpdated** `(pages: IPage<T>[]) => void`  
  Optional callback invoked when List rendering completed. This can be
  on initial mount or on re-render due to scrolling. This method will be
  called as a result of changes in List pages (added or removed), and
  after ALL the changes complete. To track individual page Add / Remove
  use onPageAdded / onPageRemoved instead.

- **onRenderCell**
  `(item?: T, index?: number, isScrolling?: boolean) => React.ReactNode`  
  Method to call when trying to render an item.

- **onRenderPage** `IRenderFunction<IPageProps<T>>`  
  Called when the List will render a page. Override this to control how
  cells are rendered within a page.

- **onRenderRoot** `IRenderFunction<IListOnRenderRootProps<T>>`  
  Render override for the element at the root of the `List`. Use this to
  apply some final attributes or structure to the content each time the
  list is updated with new active pages or items.

- **onRenderSurface** `IRenderFunction<IListOnRenderSurfaceProps<T>>`  
  Render override for the element representing the surface of the
  `List`. Use this to alter the structure of the rendered content if
  necessary on each update.

- **onShouldVirtualize** `(props: IListProps<T>) => boolean`  
  Optional callback to determine whether the list should be rendered in
  full, or virtualized. Virtualization will add and remove pages of
  items as the user scrolls them into the visible range. This benefits
  larger list scenarios by reducing the DOM on the screen, but can
  negatively affect performance for smaller lists. The default
  implementation will virtualize when this callback is not provided.

- **renderCount** `number`  
  Number of items to render. Defaults to items.length.

- **renderedWindowsAhead** `number`  
  In addition to the visible window, how many windowHeights should we
  render ahead.

- **renderedWindowsBehind** `number`  
  In addition to the visible window, how many windowHeights should we
  render behind.

- **role** `string`  
  The role to assign to the list root element. Use this to override the
  default assignment of 'list' to the root and 'listitem' to the cells.

- **startIndex** `number`  
  Index in items array to start rendering from. Defaults to 0.

- **usePageCache** `boolean`  
  Boolean value to enable render page caching. This is an experimental
  performance optimization that is off by default.

- **version** [`{}`](https://rdrr.io/r/base/Paren.html)  
  An object which can be passed in as a fresh instance to 'force update'
  the list.

- **page** `IPage<T>`  
  The allocation data for the page.

- **role** `string`  
  The role being assigned to the rendered page element by the list.

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

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

### FAQ

#### My scrollable content isn't updating on scroll, what should I do?

Add the data-is-scrollable="true" attribute to your scrollable element
containing the List.

By default, the List will use the `<body>` element as the scrollable
element. If you contain List within a scrollable `<div>` using overflow:
auto or scroll, List needs to listen for scroll events on that element
instead. On initialization, List will traverse up the DOM looking for
the first element with the data-is-scrollable attribute to know which
element to listen to for knowing when to re-evaulate the visible window.

#### My list isn't re-rendering when I mutate its items, what should I do?

To determine if List should re-render its contents, the component
performs a referential equality check on the items array in
its shouldComponentUpdate method. This is done to minimize the
performance overhead associating with re-rendering the virtualized list
pages, as recommended by the React documentation. As a result of this
implementation, List will not determine it should re-render if
values within the array are mutated. To avoid this problem, we recommend
re-creating the items array using a method such
as Array.prototype.concat or ES6 spread syntax shown below:

    public appendItems(): void {
      const { items } = this.state;

      this.setState({
        items: [...items, ...[{ name: 'Foo' }, { name: 'Bar' }]]
      })
    }

    public render(): JSX.Element {
      const { items } = this.state;

      return <List items={items} />;
    }

Since the items array has been re-created, the list will conclude that
its contents have changed and it should re-render the new values.

#### How do I limit rendering to improve performance?

Performance is important, and DOM content is expensive. Therefore, limit
what you render. The list component applies this principle by using UI
virtualization. Unlike a simple for loop that renders all items in a
set, a list only renders a subset of items, and as you scroll around,
the subset of rendered content is shifted. This gives a much better
experience for large sets, especially when the per-item components are
complex/render-intensive/network-intensive.

A list breaks down the set of items passed in into pages. Only pages
within a "materialized window" are actually rendered. As that window
changes due to scroll events, pages that fall outside that window are
removed, and their layout space is remembered and pushed into spacer
elements. This gives the user the experience of browsing massive amounts
of content but only using a small number of actual elements. This gives
the browser much less layout to resolve, and gives React DOM diffing
much less content to worry about.

Note: If onRenderCell is not provided in IListProps, the list will
attempt to render the name property for each object in the items array.

## Examples

``` r
library(shiny)
library(shiny.fluent)

items <- do.call(paste0, replicate(20, sample(LETTERS, 200, TRUE), FALSE))

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "overflow: auto; max-height: 400px",
    List(
      items = items,
      onRenderCell = JS("(item, index) => `${index} ${item}`")
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
