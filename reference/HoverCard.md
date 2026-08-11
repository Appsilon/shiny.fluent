# HoverCard

Hover cards (`HoverCard`) show commands and information, such
as metadata and activity, when someone hovers over an item.

- Tabbing with a keyboard to the element triggering the HoverCard to
  open on focus (see first example). In this case no further navigation
  within the card is available and navigating to the next element will
  close the card.

- Tabbing with a keyboard to the element triggering the HoverCard and
  opening when the hotKey is pressed (see second example). When the card
  is opened it will automatically focus the first focusable element of
  the card content.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/HoverCard).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
HoverCard(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **compactCardHeight** `number`  
  Height of compact card

- **expandedCardHeight** `number`  
  Height of expanded card

- **mode** `ExpandingCardMode`  
  Use to open the card in expanded format and not wait for the delay

- **onRenderCompactCard** `IRenderFunction<any>`  
  Render function to populate compact content area

- **onRenderExpandedCard** `IRenderFunction<any>`  
  Render function to populate expanded content area

- **cardDismissDelay** `number`  
  Length of card dismiss delay. A min number is necessary for pointer to
  hop between target and card

- **cardOpenDelay** `number`  
  Length of compact card delay

- **className** `string`  
  Additional CSS class(es) to apply to the HoverCard root element.

- **componentRef** `IRefObject<IHoverCard>`  
  Optional callback to access the IHoverCardHost interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **eventListenerTarget** `HTMLElement | string | null`  
  This prop is to separate the target to anchor hover card from the
  target to attach event listener. If set, this prop separates the
  target to anchor the hover card from the target to attach the event
  listener. When no `eventListenerTarget` given, HoverCard will use
  `target` prop or its root to set event listener.

- **expandedCardOpenDelay** `number`  
  Time in ms when expanded card should open after compact card

- **expandingCardProps** `IExpandingCardProps`  
  Additional ExpandingCard props to pass through HoverCard like
  renderers, target. gapSpace etc. Used along with 'type' prop set to
  HoverCardType.expanding. Reference detail properties in ICardProps and
  IExpandingCardProps.

- **instantOpenOnClick** `boolean`  
  Enables instant open of the full card upon click

- **onCardExpand** `() => void`  
  Callback when visible card is expanded.

- **onCardHide** `() => void`  
  Callback when card hides

- **onCardVisible** `() => void`  
  Callback when card becomes visible

- **openHotKey** `KeyCodes`  
  HotKey used for opening the HoverCard when tabbed to target.

- **plainCardProps** `IPlainCardProps`  
  Additional PlainCard props to pass through HoverCard like renderers,
  target, gapSpace etc. Used along with 'type' prop set to
  HoverCardType.plain. See for more details ICardProps and
  IPlainCardProps interfaces.

- **setAriaDescribedBy** `boolean`  
  Whether or not to mark the container as described by the hover card.
  If not specified, the caller should mark as element as described by
  the hover card id.

- **setInitialFocus** `boolean`  
  Set to true to set focus on the first focusable element in the card.
  Works in pair with the 'trapFocus' prop.

- **shouldBlockHoverCard** `() => void`  
  Should block hover card or not

- **sticky** `boolean`  
  If true disables Card dismiss upon mouse leave, so that card sticks
  around.

- **styles**
  `IStyleFunctionOrObject<IHoverCardStyleProps, IHoverCardStyles>`  
  Custom styles for this component

- **target** `HTMLElement | string | null`  
  Optional target element to tag hover card on. If not provided and
  using HoverCard as a wrapper, don't set the 'data-is-focusable=true'
  attribute to the root of the wrapped child. If no target is given,
  HoverCard will use its root as a target and become the focusable
  element with a focus listener attached to it.

- **theme** `ITheme`  
  Theme provided by higher order component.

- **trapFocus** `boolean`  
  Set to true if you want to render the content of the HoverCard in a
  FocusTrapZone for accessibility reasons. Optionally 'setInitialFocus'
  prop can be set to true to move focus inside the FocusTrapZone.

- **type** `HoverCardType`  
  Type of the hover card to render.

- **onRenderPlainCard** `IRenderFunction<any>`  
  Render function to populate compact content area

## Best practices

### Layout

- Hover cards contain both compact and expanded states, with
  the compact state appearing after 500 milliseconds and the expanded
  state appearing as the user continues to hover
  after 1500 milliseconds.

- The hover card positions itself automatically, depending upon where
  the target is on the viewport. Position the target so the card doesn’t
  obstruct inline commanding on the item.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  HoverCard(
    type = "PlainCard",
    plainCardProps = JS("{
      onRenderPlainCard: (a, b, c) => 'HoverCard contents',
      style: { margin: 10 }
    }"),
    "Hover over me"
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
