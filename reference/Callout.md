# Callout

A callout is an anchored tip that can be used to teach people
or guide them through the app without blocking them.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Callout).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Callout(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **alignTargetEdge** `boolean`  
  If true the positioning logic will prefer to flip edges rather than to
  nudge the rectangle to fit within bounds, thus making sure the element
  aligns perfectly with target's alignment edge

- **ariaDescribedBy** `string`  
  Defines the element id referencing the element containing the
  description for the callout.

- **ariaLabel** `string`  
  Accessible label text for callout.

- **ariaLabelledBy** `string`  
  Defines the element id referencing the element containing label text
  for callout.

- **backgroundColor** `string`  
  The background color of the Callout in hex format ie. \#ffffff.

- **beakWidth** `number`  
  The width of the beak.

- **bounds**
  `IRectangle | ((target?: Target, targetWindow?: Window) => IRectangle | undefined)`  
  The bounding rectangle (or callback that returns a rectangle) for
  which the contextual menu can appear in.

- **calloutMaxHeight** `number`  
  Set max height of callout When not set the callout will expand with
  contents up to the bottom of the screen

- **calloutMaxWidth** `number`  
  Custom width for callout including borders. If value is 0, no width is
  applied.

- **calloutWidth** `number`  
  Custom width for callout including borders. If value is 0, no width is
  applied.

- **className** `string`  
  CSS class to apply to the callout.

- **coverTarget** `boolean`  
  If true the position returned will have the menu element cover the
  target. If false then it will position next to the target;

- **directionalHint** `DirectionalHint`  
  How the element should be positioned

- **directionalHintFixed** `boolean`  
  If true the position will not change sides in an attempt to fit the
  callout within bounds. It will still attempt to align it to whatever
  bounds are given.

- **directionalHintForRTL** `DirectionalHint`  
  How the element should be positioned in RTL layouts. If not specified,
  a mirror of the `directionalHint` alignment edge will be used instead.
  This means that `DirectionalHint.BottomLeft` will change to
  `DirectionalHint.BottomRight` but `DirectionalHint.LeftAuto` will not
  change.

- **doNotLayer** `boolean`  
  If true do not render on a new layer. If false render on a new layer.

- **finalHeight** `number`  
  Specify the final height of the content. To be used when expanding the
  content dynamically so that callout can adjust its position.

- **gapSpace** `number`  
  The gap between the Callout and the target

- **hidden** `boolean`  
  If specified, renders the Callout in a hidden state. Use this flag,
  rather than rendering a callout conditionally based on visibility, to
  improve rendering performance when it becomes visible. Note: When
  callout is hidden its content will not be rendered. It will only
  render once the callout is visible.

- **hideOverflow** `boolean`  
  Manually set OverflowYHidden style prop to true on calloutMain element
  A variety of callout load animations will need this to hide the
  scollbar that can appear

- **isBeakVisible** `boolean`  
  If true then the beak is visible. If false it will not be shown.

- **layerProps** `ILayerProps`  
  Optional props to pass to the Layer component hosting the panel.

- **minPagePadding** `number`  
  The minimum distance the callout will be away from the edge of the
  screen.

- **onDismiss** `(ev?: any) => void`  
  Callback when the Callout tries to close.

- **onLayerMounted** `() => void`  
  Optional callback when the layer content has mounted.

- **onPositioned** `(positions?: ICalloutPositionedInfo) => void`  
  Optional callback that is called once the callout has been correctly
  positioned.

- **onRestoreFocus**
  `(options: { originalElement?: HTMLElement | Window; containsFocus: boolean; }) => void`  
  Called when the component is unmounting, and focus needs to be
  restored. Argument passed down contains two variables, the element
  that the underlying popup believes focus should go to \* and whether
  or not the popup currently contains focus. If this is provided, focus
  will not be restored automatically, you'll need to call
  originalElement.focus()

- **onScroll** `() => void`  
  Callback when the Callout body is scrolled.

- **preventDismissOnLostFocus** `boolean`  
  If true then the callout will not dismiss when it loses focus

- **preventDismissOnResize** `boolean`  
  If true then the callout will not dismiss on resize

- **preventDismissOnScroll** `boolean`  
  If true then the callout will not dismiss on scroll

- **role** `string`  
  Aria role assigned to the callout (Eg. dialog, alertdialog).

- **setInitialFocus** `boolean`  
  If true then the callout will attempt to focus the first focusable
  element that it contains. If it doesn't find an element, no focus will
  be set and the method will return false. This means that it's the
  contents responsibility to either set focus or have focusable items.

- **shouldRestoreFocus** `boolean`  
  If true, when this component is unmounted, focus will be restored to
  the element that had focus when the component first mounted.

- **shouldUpdateWhenHidden** `boolean`  
  If true, the component will be updated even when hidden=true. Note
  that this would consume resources to update even though nothing is
  being shown to the user. This might be helpful though if your updates
  are small and you want the callout to be revealed fast to the user
  when hidden is set to false.

- **style** `React.CSSProperties`  
  CSS style to apply to the callout.

If you set `overflowY` in this object, it provides a performance
optimization by preventing Popup (underlying component of Callout) from
calculating whether it needs a scroll bar.

- **styles**
  `IStyleFunctionOrObject<ICalloutContentStyleProps, ICalloutContentStyles>`  
  Optional styles for the component.

- **target** `Target`  
  The target that the Callout should try to position itself based on. It
  can be either an Element a querySelector string of a valid Element or
  a MouseEvent. If MouseEvent is given then the origin point of the
  event will be used.

- **theme** `ITheme`  
  Optional theme for component

## Best practices

### Layout

- Don’t use a callout to ask for action confirmation; use
  a dialog instead.

- Place a callout near the object being described. At the pointer’s tail
  or head, if possible.

- Don't use large, unformatted blocks of text in your callout. They're
  difficult to read and overwhelming.

- Don’t block important UI with the placement of your callout. It's a
  poor user experience that will lead to frustration.

- Don’t open a callout from within another callout.

- Don’t show callouts on hidden elements.

- Don’t overuse callouts. Too many callouts opening automatically can be
  perceived as interrupting someone's workflow.

- For a particularly complex concept that needs explanation, place an
  info icon (`iconClassNames.info`) next to the concept to indicate
  there's more helpful information available. When someone hovers over
  or selects the icon, the callout should appear.

### Content

- Because the content inside of a callout isn't always visible, don't
  put required information in a callout.

- Short sentences or sentence fragments are best.

- Don't use obvious tip text or text that simply repeats what is already
  on the screen. Limit the information inside of a callout to
  supplemental information.

- When additional context or a more advanced description is necessary,
  consider placing a link to "Learn more" at the bottom of the callout.
  When clicked, open the additional content in a new window or panel.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("toggleCallout"), text = "Toggle Callout"),
    reactOutput(ns("callout"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    show <- reactiveVal(FALSE)
    observeEvent(input$toggleCallout, show(!show()))
    output$callout <- renderReact({
      if (show()) {
        Callout(
          tags$div(
            style = "margin: 10px",
            "Callout contents"
          )
        )
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
