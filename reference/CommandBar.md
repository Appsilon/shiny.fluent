# CommandBar

CommandBar is a surface that houses commands that operate on the content
of the window, panel, or parent region it resides above. CommandBars are
one of the most visible and recognizable ways to surface commands, and
can be an intuitive method for interacting with content on the page;
however, if overloaded or poorly organized, they can be difficult to use
and hide valuable commands from your user. CommandBars can also display
a search box for finding content, hold simple commands as well as menus,
or display the status of ongoing actions.

Commands should be sorted in order of importance, from left-to-right or
right-to-left depending on the culture. Secondarily, organize commands
in logical groupings for easier recall. CommandBars work best when they
display no more than 5-7 commands. This helps users quickly find your
most valuable features. If you need to show more commands, consider
using the overflow menu. If you need to render status or viewing
controls, these go on the right side of the CommandBar (or left side if
in a left-to-right experience). Do not display more than 2-3 items on
the right side as it will make the overall CommandBar difficult to
parse.

All command items should have an icon and a label. Commands can render
as labels only as well. In smaller widths, commands can just use icon
only, but only for the most recognizable and frequently used commands.
All other commands should go into an overflow where text labels can be
shown.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/CommandBar).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
CommandBar(...)

CommandBar.shinyInput(inputId, ..., itemValueGetter = function(el) el$key)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

- inputId:

  ID of the component. Value of the clicked CommandBarItem will be sent
  to this ID.

- itemValueGetter:

  A function that takes a CommandBarItem and returns a value to be sent
  to Shiny. By default it returns `key` of the item.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **buttonStyles** `IButtonStyles`  
  Custom styles for individual button

- **cacheKey** `string`  
  A custom cache key to be used for this item. If `cacheKey` is changed,
  the cache will invalidate. Defaults to `key` value.

- **commandBarButtonAs** `IComponentAs<ICommandBarItemProps>`  
  Method to override the render of the individual command bar button.
  Not used when item is rendered in overflow.

- **iconOnly** `boolean`  
  Show only an icon for this item, not text. Does not apply if item is
  in the overflow.

- **renderedInOverflow** `boolean`  
  Context under which the item is being rendered. This value is mutated
  by the CommandBar and is useful for adjusting the `onRender` function.

- **tooltipHostProps** `ITooltipHostProps`  
  Props for the tooltip when in `iconOnly` mode.

- **ariaLabel** `string`  
  Accessibility text to be read by the screen reader when the user's
  focus enters the command bar. The screen reader will read this text
  after reading information about the first focusable item in the
  command bar.

- **buttonAs** `IComponentAs<IButtonProps>`  
  Custom component for the near and far item buttons. Not used for
  overflow menu items.

- **className** `string`  
  Additional css class to apply to the command bar

- **componentRef** `IRefObject<ICommandBar>`  
  Optional callback to access the ICommandBar interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **dataDidRender** `(renderedData: any) => void`  
  Function to be called every time data is rendered. It provides the
  data that was actually rendered. A use case would be adding telemetry
  when a particular control is shown in an overflow or dropped as a
  result of `onReduceData`, or to count the number of renders that an
  implementation of `onReduceData` triggers.

- **farItems** `ICommandBarItemProps[]`  
  Items to render on the right side (or left, in RTL).
  ICommandBarItemProps extends IContextualMenuItem.

- **items** `ICommandBarItemProps[]`  
  Items to render. ICommandBarItemProps extends IContextualMenuItem.

- **onDataGrown** `(movedItem: ICommandBarItemProps) => void`  
  Callback invoked when data has been grown.

- **onDataReduced** `(movedItem: ICommandBarItemProps) => void`  
  Callback invoked when data has been reduced.

- **onGrowData**
  `(data: ICommandBarData) => ICommandBarData | undefined`  
  Custom function to grow data if items are too small for the given
  space. Return `undefined` if no more steps can be taken to avoid
  infinate loop.

- **onReduceData**
  `(data: ICommandBarData) => ICommandBarData | undefined`  
  Custom function to reduce data if items do not fit in given space.
  Return `undefined` if no more steps can be taken to avoid infinate
  loop.

- **overflowButtonAs** `IComponentAs<IButtonProps>`  
  Custom component for the overflow button.

- **overflowButtonProps** `IButtonProps`  
  Props to be passed to overflow button. If `menuProps` are passed
  through this prop, any items provided will be prepended to any
  computed overflow items.

- **overflowItems** `ICommandBarItemProps[]`  
  Default items to have in the overflow menu. ICommandBarItemProps
  extends IContextualMenuItem.

- **shiftOnReduce** `boolean`  
  When true, items will be 'shifted' off the front of the array when
  reduced, and unshifted during grow.

- **styles**
  `IStyleFunctionOrObject<ICommandBarStyleProps, ICommandBarStyles>`  
  Customized styling that will layer on top of the variant rules.

- **theme** `ITheme`  
  Theme provided by HOC.

## Examples

``` r
library(shiny)
library(shiny.fluent)

items <- function(ns) {
  list(
    CommandBarItem(
      key = ns("newItem"),
      text = "New",
      cacheKey = "myCacheKey",
      split = TRUE,
      iconProps = list(iconName = "Add"),
      subMenuProps = list(
        items = list(
          CommandBarItem(
            key = ns("emailMessage"),
            text = "Email message",
            iconProps = list(iconName = "Mail")
          ),
          CommandBarItem(
            key = ns("calendarEvent"),
            text = "Calendar event",
            iconProps = list(iconName = "Calendar")
          )
        )
      )
    ),
    CommandBarItem(
      key = ns("upload"),
      text = "Upload",
      iconProps = list(iconName = "Upload")
    ),
    CommandBarItem(
      key = ns("share"),
      text = "Share",
      iconProps = list(iconName = "Share")
    ),
    CommandBarItem(
      key = ns("download"),
      text = "Download",
      iconProps = list(iconName = "Download")
    )
  )
}

farItems <- function(ns) {
  list(
    CommandBarItem(
      key = ns("tile"),
      text = "Grid view",
      ariaLabel = "Grid view",
      iconOnly = TRUE,
      iconProps = list(iconName = "Tiles")
    ),
    CommandBarItem(
      key = ns("info"),
      text = "Info",
      ariaLabel = "Info",
      iconOnly = TRUE,
      iconProps = list(iconName = "Info")
    )
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CommandBar(
      items = items(ns),
      farItems = farItems(ns)
    ),
    textOutput(ns("commandBarItems")),
    CommandBar.shinyInput(
      inputId = ns("commandBar"),
      items = items(identity),
      farItems = farItems(identity)
    ),
    textOutput(ns("commandBar"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    commandBarItemClicked <- reactiveVal()
    observeEvent(input$newItem, commandBarItemClicked("newItem clicked (explicitly observed)"))
    observeEvent(input$upload, commandBarItemClicked("upload clicked (explicitly observed)"))
    output$commandBarItems <- renderText(commandBarItemClicked())
    output$commandBar <- renderText(input$commandBar)
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
