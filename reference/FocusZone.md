# FocusZone

FocusZones abstract arrow key navigation behaviors. Tabbable elements
(buttons, anchors, and elements with data-is-focusable='true'
attributes) are considered when pressing directional arrow keys and
focus is moved appropriately. Tabbing to a zone sets focus only to the
current "active" element, making it simple to use the tab key to
transition from one zone to the next, rather than through every
focusable element.

Using a FocusZone is simple. Just wrap a bunch of content inside of a
FocusZone, and arrows and tabbling will be handled for you! See examples
below.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/FocusZone).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
FocusZone(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **allowFocusRoot** `boolean`  
  Allows focus to park on root when focus is in the `FocusZone` at
  render time.

- **allowTabKey** `boolean`  
  Allows tab key to be handled to tab through a list of items in the
  focus zone, an unfortunate side effect is that users will not be able
  to tab out of the focus zone and have to hit escape or some other key.

- **ariaDescribedBy** `string`  
  Sets the aria-describedby attribute.

- **ariaLabelledBy** `string`  
  Sets the aria-labelledby attribute.

- **as** `React.ElementType`  
  A component that should be used as the root element of the FocusZone
  component.

- **checkForNoWrap** `boolean`  
  Determines whether to check for data-no-horizontal-wrap or
  data-no-vertical-wrap attributes when determining how to move focus

- **className** `string`  
  Additional class name to provide on the root element, in addition to
  the ms-FocusZone class.

- **componentRef** `IRefObject<IFocusZone>`  
  Optional callback to access the IFocusZone interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **defaultActiveElement** `string`  
  Optionally provide a selector for identifying the initial active
  element.

- **defaultTabbableElement**
  `string | ((root: HTMLElement) => HTMLElement)`  
  Optionally defines the initial tabbable element inside the FocusZone.
  If a string is passed then it is treated as a selector for identifying
  the initial tabbable element. If a function is passed then it uses the
  root element as a parameter to return the initial tabbable element.

- **direction** `FocusZoneDirection`  
  Defines which arrows to react to.

- **disabled** `boolean`  
  If set, the FocusZone will not be tabbable and keyboard navigation
  will be disabled. This does not affect disabled attribute of any
  child.

- **doNotAllowFocusEventToPropagate** `boolean`  
  Whether the FocusZone should allow focus events to propagate past the
  FocusZone.

- **elementType** `any`  
  Element type the root element will use. Default is "div".

- **handleTabKey** `FocusZoneTabbableElements`  
  Allows tab key to be handled to tab through a list of items in the
  focus zone, an unfortunate side effect is that users will not be able
  to tab out of the focus zone and have to hit escape or some other key.

- **isCircularNavigation** `boolean`  
  If set, will cycle to the beginning of the targets once the user
  navigates to the next target while at the end, and to the end when
  navigate to the previous at the beginning.

- **isInnerZoneKeystroke**
  `(ev: React.KeyboardEvent<HTMLElement>) => boolean`  
  If provided, this callback will be executed on keypresses to determine
  if the user intends to navigate into the inner zone. Returning true
  will ask the first inner zone to set focus.

- **onActiveElementChanged**
  `(element?: HTMLElement, ev?: React.FocusEvent<HTMLElement>) => void`  
  Callback for when one of immediate children elements gets active by
  getting focused or by having one of its respective children elements
  focused.

- **onBeforeFocus** `(childElement?: HTMLElement) => boolean`  
  Callback method for determining if focus should indeed be set on the
  given element.

- **onFocus**
  `(event: React.FocusEvent<HTMLElement | FocusZone>) => void`  
  Callback called when "focus" event triggered in FocusZone.

- **onFocusNotification** `() => void`  
  Callback to notify creators that focus has been set on the FocusZone

- **pagingSupportDisabled** `boolean`  
  Determines whether to disable the paging support for Page Up and Page
  Down keyboard scenarios.

- **preventDefaultWhenHandled** `boolean`  
  If true, FocusZone prevents the default behavior of Keyboard events
  when changing focus between elements.

- **preventFocusRestoration** `boolean`  
  If true, prevents the FocusZone from attempting to restore the focus
  to the inner element when the focus is on the root element after
  componentDidUpdate.

- **rootProps** `React.HTMLAttributes<HTMLDivElement>`  
  Deprecated at v1.12.1. DIV props provided to the FocusZone will be
  mixed into the root element.

- **shouldEnterInnerZone**
  `(ev: React.KeyboardEvent<HTMLElement>) => boolean`  
  Callback function that will be executed on keypresses to determine if
  the user intends to navigate into the inner (nested) zone. Returning
  true will ask the first inner zone to set focus.

- **shouldFocusInnerElementWhenReceivedFocus** `boolean`  
  If true and FocusZone's root element (container) receives focus, the
  focus will land either on the defaultTabbableElement (if set) or on
  the first tabbable element of this FocusZone. Usually a case for
  nested focus zones, when the nested focus zone's container is a
  focusable element.

- **shouldFocusOnMount** `boolean`  
  Determines if a default tabbable element should be force focused on
  FocusZone mount. @default false

- **shouldInputLoseFocusOnArrowKey**
  `(inputElement: HTMLInputElement) => boolean`  
  A callback method to determine if the input element should lose focus
  on arrow keys

- **shouldRaiseClicks** `boolean`  
  Determines whether the FocusZone will walk up the DOM trying to invoke
  click callbacks on focusable elements on Enter and Space keydowns to
  ensure accessibility for tags that don't guarantee this behavior.

- **shouldReceiveFocus** `(childElement?: HTMLElement) => boolean`  
  Callback method for determining if focus should indeed be set on the
  given element.

- **shouldResetActiveElementWhenTabFromZone** `boolean`  
  If true and TAB key is not handled by FocusZone, resets current active
  element to null value. For example, when roving index is not desirable
  and focus should always reset to the default tabbable element.

- **stopFocusPropagation** `boolean`  
  Whether the FocusZone should allow focus events to propagate past the
  FocusZone.

## Examples

``` r
library(shiny)
library(shiny.fluent)

tokens <- list(childrenGap = 20)

ui <- function(id) {
  ns <- NS(id)
  Stack(
    tokens = tokens,
    horizontalAlign = "start",
    FocusZone(
      Stack(
        tokens = tokens,
        horizontal = TRUE,
        verticalAlign = "center",
        tags$span("Enabled FocusZone:"),
        DefaultButton(text = "Button 1"),
        DefaultButton(text = "Button 2"),
        TextField(placeholder = "FocusZone TextField"),
        DefaultButton(text = "Button 3")
      )
    ),
    DefaultButton(text = "Tabbable Element 1"),
    FocusZone(
      disabled = TRUE,
      Stack(
        tokens = tokens,
        horizontal = TRUE,
        verticalAlign = "center",
        tags$span("Disabled FocusZone:"),
        DefaultButton(text = "Button 1"),
        DefaultButton(text = "Button 2")
      )
    ),
    TextField(placeholder = "Tabbable Element 2")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
