# Layer

A Layer is a technical component that does not have specific Design
guidance.

Layers are used to render content outside of a DOM tree, at the end of
the document. This allows content to escape traditional boundaries
caused by "overflow: hidden" css rules and keeps it on the top without
using z-index rules. This is useful for example in ContextualMenu and
Tooltip scenarios, where the content should always overlay everything
else.

There are some special considerations. Due to the nature of rendering
content elsewhere asynchronously, React refs within content will not be
resolvable synchronously at the time the Layer is mounted. Therefore, to
use refs correctly, use functional refs
`ref={ (el) => { this._root = el; }` rather than string refs
`ref='root'`. Additionally measuring the physical Layer element will not
include any of the children, since it won't render it. Events that
propgate from within the content will not go through the Layer element
as well.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Layer).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Layer(...)

LayerHost(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Additional css class to apply to the Layer

- **componentRef** `IRefObject<ILayer>`  
  Optional callback to access the ILayer interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **eventBubblingEnabled** `boolean`  
  When enabled, Layer allows events to bubble up from Layer content.
  Traditionally Layer has not had this behavior. This prop preserves
  backwards compatibility by default while allowing users to opt in to
  the new event bubbling functionality.

- **hostId** `string`  
  The optional id property provided on a LayerHost that this Layer
  should render within. The LayerHost does not need to be immediately
  available but once has been rendered, and if missing, we'll avoid
  trying to render the Layer content until the host is available. If an
  id is not provided, we will render the Layer content in a fixed
  position element rendered at the end of the document.

- **insertFirst** `boolean`  
  Whether the layer should be added as the first child of the host. If
  true, the layer will be inserted as the first child of the host By
  default, the layer will be appended at the end to the host

- **onLayerDidMount** `() => void`  
  Callback for when the layer is mounted.

- **onLayerMounted** `() => void`  
  Callback for when the layer is mounted.

- **onLayerWillUnmount** `() => void`  
  Callback for when the layer is unmounted.

- **styles** `IStyleFunctionOrObject<ILayerStyleProps, ILayerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    style = "margin-top: 60px; border: 1px solid navy; padding: 10px; background: #eee;",
    Checkbox.shinyInput(ns("useLayer"), value = FALSE, label = "Display a message in a layer"),
    reactOutput(ns("layer"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$layer <- renderReact({
      box <- div(
        style = "background-color: #60C7FF; margin: 10px; padding: 10px",
        "Hello!"
      )
      if (isTRUE(input$useLayer)) Layer(box)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    LayerHost(id = "host", style = list(border = "1px dashed", padding = 10)),
    "Layer children are rendered in the LayerHost",
    Layer(hostId = "host", "Content")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
