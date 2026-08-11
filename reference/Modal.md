# Modal

Modals are temporary pop-ups that take focus from the page or app and
require people to interact with them. Unlike a dialog box (`Dialog`), a
modal should be used for hosting lengthy content, such as
privacy statements or license agreements, or for asking people to
perform complex or multiple actions, such as changing settings.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Modal).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Modal(...)
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
  Optional class name to be added to the root class

- **componentRef** `IRefObject<IModal>`  
  Optional callback to access the IDialog interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **containerClassName** `string`  
  Optional override for container class

- **dragOptions** `IDragOptions`  
  The options to make the modal draggable

- **enableAriaHiddenSiblings** `boolean`  
  Puts aria-hidden=true on all non-ancestors of the current modal, for
  screen readers. This is an experimental feature that will be graduated
  to default behavior after testing. This flag will be removed with the
  next major release.

- **isBlocking** `boolean`  
  Whether the dialog can be light dismissed by clicking outside the
  dialog (on the overlay).

- **isDarkOverlay** `boolean`  
  Whether the overlay is dark themed.

- **isModeless** `boolean`  
  Whether the dialog should be modeless (e.g. not dismiss when
  focusing/clicking outside of the dialog). if true: isBlocking is
  ignored, there will be no overlay (isDarkOverlay is ignored),
  isClickableOutsideFocusTrap is true, and forceFocusInsideTrap is false

- **isOpen** `boolean`  
  Whether the dialog is displayed.

- **layerProps** `ILayerProps`  
  Defines an optional set of props to be passed through to Layer

- **onDismiss** `(ev?: React.MouseEvent<HTMLButtonElement>) => any`  
  A callback function for when the Modal is dismissed light dismiss,
  before the animation completes.

- **onDismissed** `() => any`  
  A callback function which is called after the Modal is dismissed and
  the animation is complete.

- **onLayerDidMount** `() => void`  
  A callback function for when the Modal content is mounted on the
  overlay layer

- **overlay** `IOverlayProps`  
  Defines an optional set of props to be passed through to Overlay

- **scrollableContentClassName** `string`  
  Optional override for scrollable content class

- **styles** `IStyleFunctionOrObject<IModalStyleProps, IModalStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **subtitleAriaId** `string`  
  ARIA id for the subtitle of the Modal, if any

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **titleAriaId** `string`  
  ARIA id for the title of the Modal, if any

- **topOffsetFixed** `boolean`  
  Whether the modal should have top offset fixed once opened and expand
  from the bottom only when the content changes dynamically.

## Best practices

### Layout

- Use a variable width with a minimum width of 288 pixels.

- Use a variable height with a minimum height of 172 pixels.

- Center vertically and horizontally in the available space.

- Always have at least one focusable element inside a modal.

- Blocking modals (`Modeless Modal`) should be used very sparingly, only
  when it's critical for people to make a choice or provide information
  before they can proceed.

- Provide a clear way for people to dismiss the control, such as a Close
  button, which should always go in the upper right corner.

### Content

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    reactOutput(ns("modal")),
    PrimaryButton.shinyInput(ns("showModal"), text = "Show modal"),
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    modalVisible <- reactiveVal(FALSE)
    observeEvent(input$showModal, modalVisible(TRUE))
    observeEvent(input$hideModal, modalVisible(FALSE))
    output$modal <- renderReact({
      Modal(isOpen = modalVisible(),
        Stack(tokens = list(padding = "15px", childrenGap = "10px"),
          div(style = list(display = "flex"),
            Text("Title", variant = "large"),
            div(style = list(flexGrow = 1)),
            IconButton.shinyInput(
              ns("hideModal"),
              iconProps = list(iconName = "Cancel")
            ),
          ),
          div(
            p("A paragraph of text."),
            p("Another paragraph.")
          )
        )
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
