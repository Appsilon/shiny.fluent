# Coachmark

Coach marks (`Coachmark`) are used to draw a person’s attention
to parts of the UI and increase engagement
with those elements. A teaching bubble appears on hover
or selection of the coach mark.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Coachmark).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Coachmark(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **ariaAlertText** `string`  
  Text to announce to screen reader / narrator when Coachmark is
  displayed

- **ariaDescribedBy** `string`  
  Defines the element id referencing the element containing the
  description for the Coachmark.

- **ariaDescribedByText** `string`  
  Defines the text content for the ariaDescribedBy element

- **ariaLabelledBy** `string`  
  Defines the element id referencing the element containing label text
  for Coachmark.

- **ariaLabelledByText** `string`  
  Defines the text content for the ariaLabelledBy element

- **beaconColorOne** `string`  
  Beacon color one.

- **beaconColorTwo** `string`  
  Beacon color two.

- **beakHeight** `number`  
  The height of the Beak component.

- **beakWidth** `number`  
  The width of the Beak component.

- **className** `string`  
  If provided, additional class name to provide on the root element.

- **collapsed** `boolean`  
  The starting collapsed state for the Coachmark. Use `isCollapsed`
  instead.

- **color** `string`  
  Color of the Coachmark/TeachingBubble.

- **componentRef** `IRefObject<ICoachmark>`  
  Optional callback to access the ICoachmark interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **delayBeforeCoachmarkAnimation** `number`  
  Delay in milliseconds before Coachmark animation appears.

- **delayBeforeMouseOpen** `number`  
  Delay before allowing mouse movements to open the Coachmark.

- **height** `number`  
  The height of the Coachmark.

- **isCollapsed** `boolean`  
  The starting collapsed state for the Coachmark.

- **isPositionForced** `boolean`  
  Whether or not to force the Coachmark/TeachingBubble content to fit
  within the window bounds.

- **mouseProximityOffset** `number`  
  The distance in pixels the mouse is located before opening up the
  Coachmark.

- **onAnimationOpenEnd** `() => void`  
  Callback when the opening animation completes.

- **onAnimationOpenStart** `() => void`  
  Callback when the opening animation begins.

- **onDismiss** `(ev?: any) => void`  
  Callback when the Coachmark tries to close.

- **onMouseMove** `(e: MouseEvent) => void`  
  Callback to run when the mouse moves.

- **persistentBeak** `boolean`  
  If true then the Coachmark beak (arrow pointing towards target) will
  always be visible as long as Coachmark is visible

- **positioningContainerProps** `IPositioningContainerProps`  
  Props to pass to the PositioningContainer component. Specify the
  `directionalHint` to indicate on which edge the
  Coachmark/TeachingBubble should be positioned.

- **preventDismissOnLostFocus** `boolean`  
  If true then the Coachmark will not dismiss when it loses focus

- **preventFocusOnMount** `boolean`  
  If true then focus will not be set to the Coachmark when it mounts.
  Useful in cases where focus on coachmark is causing other components
  in page to dismiss upon losing focus.

- **styles**
  `IStyleFunctionOrObject<ICoachmarkStyleProps, ICoachmarkStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **target** `HTMLElement | string | null`  
  The target that the Coachmark should try to position itself based on.

- **teachingBubbleRef** `ITeachingBubble`  
  Ref for TeachingBubble

- **theme** `ITheme`  
  Theme provided by higher order component.

- **width** `number`  
  The width of the Coachmark.

- **ariaDescribedBy** `string`  
  Defines the element id referencing the element containing the
  description for the positioningContainer.

- **ariaLabel** `string`  
  Accessible label text for positioningContainer.

- **ariaLabelledBy** `string`  
  Defines the element id referencing the element containing label text
  for positioningContainer.

- **backgroundColor** `string`  
  The background color of the positioningContainer in hex format ie.
  \#ffffff.

- **bounds** `IRectangle`  
  The bounding rectangle for which the contextual menu can appear in.

- **className** `string`  
  CSS class to apply to the positioningContainer.

- **componentRef** `IRefObject<IPositioningContainer>`  
  All props for your component are to be defined here.

- **coverTarget** `boolean`  
  If true the position returned will have the menu element cover the
  target. If false then it will position next to the target;

- **directionalHint** `DirectionalHint`  
  How the element should be positioned

- **directionalHintFixed** `boolean`  
  If true the position will not change sides in an attempt to fit the
  positioningContainer within bounds. It will still attempt to align it
  to whatever bounds are given.

- **directionalHintForRTL** `DirectionalHint`  
  How the element should be positioned in RTL layouts. If not specified,
  a mirror of `directionalHint` will be used instead

- **doNotLayer** `boolean`  
  If true do not render on a new layer. If false render on a new layer.

- **finalHeight** `number`  
  Specify the final height of the content. To be used when expanding the
  content dynamically so that positioningContainer can adjust its
  position.

- **minPagePadding** `number`  
  The minimum distance the positioningContainer will be away from the
  edge of the screen.

- **offsetFromTarget** `number`  
  The gap between the positioningContainer and the target

- **onDismiss** `(ev?: any) => void`  
  Callback when the positioningContainer tries to close.

- **onLayerMounted** `() => void`  
  Optional callback when the layer content has mounted.

- **onPositioned** `(positions?: IPositionedData) => void`  
  Optional callback that is called once the positioningContainer has
  been correctly positioned.

- **positioningContainerMaxHeight** `number`  
  Set max height of positioningContainer When not set the
  positioningContainer will expand with contents up to the bottom of the
  screen

- **positioningContainerWidth** `number`  
  Custom width for positioningContainer including borders. If value is
  0, no width is applied.

- **preventDismissOnScroll** `boolean`  
  If true then the onClose will not not dismiss on scroll

- **role** `string`  
  Aria role assigned to the positioningContainer (Eg. dialog,
  alertdialog).

- **setInitialFocus** `boolean`  
  If true then the positioningContainer will attempt to focus the first
  focusable element that it contains. If it doesn't find an element, no
  focus will be set and the method will return false. This means that
  it's the contents responsibility to either set focus or have focusable
  items.

- **target** `HTMLElement | string | MouseEvent | Point | null`  
  The target that the positioningContainer should try to position itself
  based on. It can be either an HTMLElement a querySelector string of a
  valid HTMLElement or a MouseEvent. If MouseEvent is given then the
  origin point of the event will be used.

- **targetPoint** `Point`  
  Point used to position the positioningContainer. Deprecated, use
  `target` instead.

- **useTargetPoint** `boolean`  
  If true use a point rather than rectangle to position the
  positioningContainer. For example it can be used to position based on
  a click.

## Best practices

### Layout

- Only one coach mark and teaching bubble combo should be displayed at a
  time.

- Coach marks can be standalone or sequential. Sequential coach marks
  should be used sparingly to walk through complex multistep
  interactions. It’s recommended that a sequence
  of coach marks doesn’t exceed three steps.

- Coach marks are designed to only hold teaching bubbles.

- Coach mark size, color, and animation shouldn’t be altered.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    uiOutput(ns("coachmark")),
    DefaultButton.shinyInput(ns("toggleCoachmark"),
      id = "target", text = "Toggle coachmark"
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    coachmarkVisible <- reactiveVal(FALSE)
    observeEvent(input$toggleCoachmark, coachmarkVisible(!coachmarkVisible()))
    observeEvent(input$hideCoachmark, coachmarkVisible(FALSE))
    output$coachmark <- renderUI({
      if (coachmarkVisible()) Coachmark(
        target = "#target",
        TeachingBubbleContent(
          hasCloseButton = TRUE,
          onDismiss = triggerEvent(ns("hideCoachmark")),
          headline = "Example title",
          primaryButtonProps = list(text = "Try it"),
          secondaryButtonProps = list(text = "Try it again"),
          "Welcome to the land of coachmarks!"
        )
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
