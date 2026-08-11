# Panel

Panels are overlays that contain supplementary content and are used for
complex creation, edit, or management
experiences.  For example, viewing details about an item in a
list or editing settings.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Panel).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Panel(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **allowTouchBodyScroll** `boolean`  
  Allow body scroll on content and overlay on touch devices. Changing
  after mounting has no effect.

- **className** `string`  
  Additional css class to apply to the Panel

- **closeButtonAriaLabel** `string`  
  Aria label on close button

- **componentId** `string`  
  Deprecated property. Serves no function.

- **componentRef** `IRefObject<IPanel>`  
  Optional callback to access the IPanel interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **customWidth** `string`  
  Custom panel width, used only when `type` is set to
  `PanelType.custom`.

- **elementToFocusOnDismiss** `HTMLElement`  
  Sets the HTMLElement to focus on when exiting the FocusTrapZone.

- **firstFocusableSelector** `string`  
  Indicates the selector for first focusable item. Deprecated, use
  `focusTrapZoneProps`.

- **focusTrapZoneProps** `IFocusTrapZoneProps`  
  Optional props to pass to the FocusTrapZone component to manage focus
  in the panel.

- **forceFocusInsideTrap** `boolean`  
  Indicates whether Panel should force focus inside the focus trap zone.
  If not explicitly specified, behavior aligns with FocusTrapZone's
  default behavior. Deprecated, use `focusTrapZoneProps`.

- **hasCloseButton** `boolean`  
  Has the close button visible.

- **headerClassName** `string`  
  Optional parameter to provider the class name for header text

- **headerText** `string`  
  Header text for the Panel.

- **headerTextProps** `React.HTMLAttributes<HTMLDivElement>`  
  The props for header text container.

- **ignoreExternalFocusing** `boolean`  
  Indicates if this Panel will ignore keeping track of HTMLElement that
  activated the Zone. Deprecated, use `focusTrapZoneProps`.

- **isBlocking** `boolean`  
  Whether the panel uses a modal overlay or not

- **isFooterAtBottom** `boolean`  
  Determines if content should stretch to fill available space putting
  footer at the bottom of the page

- **isHiddenOnDismiss** `boolean`  
  Whether the panel is hidden on dismiss, instead of destroyed in the
  DOM. Protects the contents from being destroyed when the panel is
  dismissed.

- **isLightDismiss** `boolean`  
  Whether the panel can be light dismissed.

- **isOpen** `boolean`  
  Whether the panel is displayed. If true, will cause panel to stay open
  even if dismissed. If false, will cause panel to stay hidden. If
  undefined, will allow the panel to control its own visility through
  open/dismiss methods.

- **layerProps** `ILayerProps`  
  Optional props to pass to the Layer component hosting the panel.

- **onDismiss** `(ev?: React.SyntheticEvent<HTMLElement>) => void`  
  A callback function for when the panel is closed, before the animation
  completes. If the panel should NOT be dismissed based on some keyboard
  event, then simply call ev.preventDefault() on it

- **onDismissed** `() => void`  
  A callback function which is called **after** the Panel is dismissed
  and the animation is complete. (If you need to update the Panel's
  `isOpen` prop in response to a dismiss event, use `onDismiss`
  instead.)

- **onLightDismissClick** `() => void`  
  Optional custom function to handle clicks outside the panel in
  lightdismiss mode

- **onOpen** `() => void`  
  A callback function for when the Panel is opened, before the animation
  completes.

- **onOpened** `() => void`  
  A callback function for when the Panel is opened, after the animation
  completes.

- **onOuterClick** `() => void`  
  Optional custom function to handle clicks outside this component

- **onRenderBody** `IRenderFunction<IPanelProps>`  
  Optional custom renderer for body region. Replaces any children passed
  into the component.

- **onRenderFooter** `IRenderFunction<IPanelProps>`  
  Optional custom renderer for footer region. Replaces sticky footer.

- **onRenderFooterContent** `IRenderFunction<IPanelProps>`  
  Custom renderer for content in the sticky footer

- **onRenderHeader** `IPanelHeaderRenderer`  
  Optional custom renderer for header region. Replaces current title

- **onRenderNavigation** `IRenderFunction<IPanelProps>`  
  Optional custom renderer navigation region. Replaces the region that
  contains the close button.

- **onRenderNavigationContent** `IRenderFunction<IPanelProps>`  
  Optional custom renderer for content in the navigation region.
  Replaces current close button.

- **overlayProps** `IOverlayProps`  
  Optional props to pass to the Overlay component that the panel uses.

- **styles** `IStyleFunctionOrObject<IPanelStyleProps, IPanelStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **type** `PanelType`  
  Type of the panel.

## Best practices

### Layout

- Use for self-contained experiences where someone doesn’t need to
  interact with the app view to complete the task.

- Consider how the panel and its contained contents will scale across
  responsive web breakpoints.

#### Header

- Include a close button in the top-right corner.

- Lock the title to the top of the panel.

- The header can contain a variety of components. Components are stacked
  under the main title, locked to the top, and push content down.

#### Body

- The body is a flexible container that can house a wide variety of
  components, content, and formatting.

- Content can scroll.

#### Footer

- Standard footers include primary and secondary buttons to confirm or
  cancel the changes or task.

- Read-only panels may contain a single Close button.

- Lock the footer to the bottom of the panel.

### Content

#### Title

- Titles should explain the panel content in clear, concise, and
  specific terms.

- Keep the length of the title to one line, if possible.

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see `[Capitalization]` in the Microsoft Writing
  Style Guide.

- Don’t put a period at the end of the title.

`[capitalization]`:
https://learn.microsoft.com/style-guide/capitalization

#### Button labels

- Be concise. Limit labels to one or two words. Usually a single verb is
  best. Include a noun if there’s any room for interpretation about what
  the verb means. For example, “Save” or “Save settings.”

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("showPanel"), text = "Open panel"),
    reactOutput(ns("reactPanel"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    isPanelOpen <- reactiveVal(FALSE)
    output$reactPanel <- renderReact({
      Panel(
        headerText = "Sample panel",
        isOpen = isPanelOpen(),
        "Content goes here.",
        onDismiss = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("hidePanel"), "', Math.random());",
          "}"
        ))
      )
    })
    observeEvent(input$showPanel, isPanelOpen(TRUE))
    observeEvent(input$hidePanel, isPanelOpen(FALSE))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
