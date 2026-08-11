# Tooltip

A good tooltip briefly describes unlabeled controls or provides a bit of
additional information about labeled controls, when this is
useful. It can also help customers navigate the UI by offering
additional—not redundant—information about control labels, icons, and
links. A tooltip should always add valuable information; use sparingly.

There are two components you can use to display a tooltip:

- **Tooltip:** A styled tooltip that you can display on a chosen target.

- **TooltipHost:** A wrapper that automatically shows a tooltip when the
  wrapped element is hovered or focused.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Tooltip).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
TooltipHost(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **calloutProps** `ICalloutProps`  
  Additional properties to pass through for Callout.

- **className** `string`  
  Class name to apply to the *tooltip itself*, not the host. To apply a
  class to the host, use `hostClassName` or `styles.root`.

- **closeDelay** `number`  
  Number of milliseconds to delay closing the tooltip, so that the user
  has time to hover over the tooltip and interact with it. Hovering over
  the tooltip will count as hovering over the host, so that the tooltip
  will stay open if the user is actively interacting with it.

- **componentRef** `IRefObject<ITooltipHost>`  
  Optional callback to access the ITooltipHost interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **content** `string | JSX.Element | JSX.Element[]`  
  Content to display in the Tooltip.

- **delay** `TooltipDelay`  
  Length of delay before showing the tooltip on hover.

- **directionalHint** `DirectionalHint`  
  How the tooltip should be anchored to its `targetElement`.

- **directionalHintForRTL** `DirectionalHint`  
  How the element should be positioned in RTL layouts. If not specified,
  a mirror of `directionalHint` will be used.

- **hostClassName** `string`  
  Class name to apply to tooltip host.

- **id** `string`  
  Optional ID to pass through to the tooltip (not used on the host
  itself). Auto-generated if not provided.

- **onTooltipToggle**
  `onTooltipToggle?(isTooltipVisible: boolean): void;`  
  Notifies when tooltip becomes visible or hidden, whatever the trigger
  was.

- **overflowMode** `TooltipOverflowMode`  
  If this is unset (the default), the tooltip is always shown even if
  there's no overflow.

If set, only show the tooltip if the specified element (`Self` or
`Parent`) has overflow. When set to `Parent`, the parent element is also
used as the tooltip's target element.

Note that even with `Self` mode, the TooltipHost *does not* check
whether any children have overflow.

- **setAriaDescribedBy** `boolean`  
  Whether or not to mark the TooltipHost root element as described by
  the tooltip. If not specified, the caller should pass an `id` to the
  TooltipHost (to be passed through to the Tooltip) and mark the
  appropriate element as `aria-describedby` the `id`.

- **styles**
  `IStyleFunctionOrObject<ITooltipHostStyleProps, ITooltipHostStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by higher-order component.

- **tooltipProps** `ITooltipProps`  
  Additional properties to pass through for Tooltip.

- **calloutProps** `ICalloutProps`  
  Properties to pass through for Callout.

- **componentRef** `IRefObject<ITooltip>`  
  Optional callback to access the ITooltip interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **content** `string | JSX.Element | JSX.Element[]`  
  Content to be passed to the tooltip

- **delay** `TooltipDelay`  
  Length of delay. Set to `TooltipDelay.zero` if you do not want a
  delay.

- **directionalHint** `DirectionalHint`  
  How the tooltip should be anchored to its `targetElement`.

- **directionalHintForRTL** `DirectionalHint`  
  How the element should be positioned in RTL layouts. If not specified,
  a mirror of `directionalHint` will be used instead

- **maxWidth** `string | null`  
  Max width of tooltip

- **onRenderContent** `IRenderFunction<ITooltipProps>`  
  Render function to populate tooltip content.

- **styles**
  `IStyleFunctionOrObject<ITooltipStyleProps, ITooltipStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **targetElement** `HTMLElement`  
  Element to anchor the Tooltip to.

- **theme** `ITheme`  
  Theme provided by higher-order component.

## Best practices

### Content

- Don’t use a tooltip to restate a button name that’s already shown in
  the UI.

- When a control or UI element is unlabeled, use a simple, descriptive
  noun phrase. For example: “Highlighting pen”. Only capitalize the
  first word (unless a subsequent word is a proper noun), and don’t use
  a period.

- For a disabled control that could use an explanation, provide a brief
  description of the state in which the control will be enabled.
  For example: “This feature is available for line charts.”

- Only use periods for complete sentences.

For a UI label that needs some explanation:

- Briefly describe what you can do with the UI element.

- Use the imperative verb form. For example, "Find text in this
  file" (not "Finds text in this file").

- Don't include end punctuation unless there is at least one complete
  sentence.

For a truncated label or a label that’s likely to truncate in some
languages:

- Provide the untruncated label in the tooltip.

- Don't provide a tooltip if the untruncated info is provided elsewhere
  on the page or flow.

- Optional: On another line, provide a clarifying description, but only
  if needed.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  TooltipHost(
    content = "This is the tooltip content",
    delay = 0,
    Text("Hover over me")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
