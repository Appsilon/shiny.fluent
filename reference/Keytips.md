# Keytips

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Keytips).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
KeytipLayer(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **componentRef** `IRefObject<IKeytipLayer>`  
  Optional callback to access the KeytipLayer component. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **content** `string`  
  String to put inside the layer to be used for the aria-describedby for
  the component with the keytip Should be one of the starting sequences

- **keytipExitSequences** `IKeytipTransitionKey[]`  
  List of key sequences that will exit keytips mode

- **keytipReturnSequences** `IKeytipTransitionKey[]`  
  List of key sequences that execute the return functionality in keytips
  (going back to the previous level of keytips)

- **keytipStartSequences** `IKeytipTransitionKey[]`  
  List of key sequences that will start keytips mode

- **onEnterKeytipMode** `() => void`  
  Callback function triggered when keytip mode is entered

- **onExitKeytipMode**
  `(ev?: React.KeyboardEvent<HTMLElement> | React.MouseEvent<HTMLElement>) => void`  
  Callback function triggered when keytip mode is exited. ev is the
  Mouse or Keyboard Event that triggered the exit, if any.

- **styles**
  `IStyleFunctionOrObject<IKeytipLayerStyleProps, IKeytipLayerStyles>`  
  (Optional) Call to provide customized styling.

- **calloutProps** `ICalloutProps`  
  ICalloutProps to pass to the callout element

- **content** `string`  
  Content to put inside the keytip

- **disabled** `boolean`  
  T/F if the corresponding control for this keytip is disabled

- **hasDynamicChildren** `boolean`  
  Whether or not this keytip will have children keytips that are
  dynamically created (DOM is generated on keytip activation). Common
  cases are a Pivot or Modal.

- **hasMenu** `boolean`  
  Whether or not this keytip belongs to a component that has a menu
  Keytip mode will stay on when a menu is opened, even if the items in
  that menu have no keytips

- **keySequences** `string[]`  
  Array of KeySequences which is the full key sequence to trigger this
  keytip Should not include initial 'start' key sequence

- **offset** `Point`  
  Offset x and y for the keytip, added from the top-left corner By
  default the keytip will be anchored to the bottom-center of the
  element

- **onExecute**
  `(executeTarget: HTMLElement | null, target: HTMLElement | null) => void`  
  Function to call when this keytip is activated. 'executeTarget' is the
  DOM element marked with 'data-ktp-execute-target'. 'target' is the DOM
  element marked with 'data-ktp-target'.

- **onReturn**
  `(executeTarget: HTMLElement | null, target: HTMLElement | null) => void`  
  Function to call when the keytip is the currentKeytip and a return
  sequence is pressed. 'executeTarget' is the DOM element marked with
  'data-ktp-execute-target'. 'target' is the DOM element marked with
  'data-ktp-target'.

- **overflowSetSequence** `string[]`  
  Full KeySequence of the overflow set button, will be set automatically
  if this keytip is inside an overflow

- **styles**
  `IStyleFunctionOrObject<IKeytipStyleProps, IKeytipStyles>`  
  Optional styles for the component.

- **theme** `ITheme`  
  Theme for the component

- **visible** `boolean`  
  T/F if the keytip is visible

## Examples

``` r
library(shiny)
library(shiny.fluent)

makeScript <- function(js) {
  tagList(
    shiny.react::reactDependency(),
    htmltools::htmlDependency(
      name = "KeytipsExample",
      version = "0", # Not used.
      src = c(href = ""), # Not used.
      head = paste0("<script>", js, "</script>")
    )
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    makeScript(paste0("setTimeout(() => {
      const btnExecute = (el) => {
        el.click();
      };

      const keytipConfig = {
        keytips: [
          // Button example
          {
            id: 'Button',
            content: '1A',
            optionalProps: {
              onExecute: btnExecute,
            },
          },
          {
            id: 'CompoundButton',
            content: '1B',
            optionalProps: {
              onExecute: btnExecute,
            },
          },
          {
            id: 'ButtonWithMenu',
            content: '2A',
            optionalProps: {
              onExecute: btnExecute,
            },
            children: [
              {
                id: 'ButtonMenuItem1',
                content: 'E',
                optionalProps: {
                  onExecute: btnExecute,
                },
              },
              {
                id: 'ButtonMenuItem2',
                content: '8',
                optionalProps: {
                  onExecute: btnExecute,
                },
              },
            ],
          }
        ],
      };

      keytipMap = jsmodule['@fluentui/react'].buildKeytipConfigMap(keytipConfig);

      window.buttonProps = {
        items: [
          {
            key: 'buttonMenuItem1',
            text: 'Menu Item 1',
            keytipProps: keytipMap.ButtonMenuItem1,
            onClick: () => Shiny.setInputValue('", ns("button3"), "', Math.random())
          },
          {
            key: 'buttonMenuItem2',
            text: 'Menu Item 2',
            keytipProps: keytipMap.ButtonMenuItem2,
            onClick: () => Shiny.setInputValue('", ns("button3"), "', Math.random())
          },
        ],
      };
    })")),
    textOutput(ns("keytipsResult")),
    div(
      Label(
        paste0(
          "To open keytips, hit 'Alt-Windows' on Windows/Linux and 'Option-Control' on macOS.",
          "Keytips will appear. Type what you see, e.g. 1 and then A to 'click' the first button."
        )
      ),
      Label(
        paste0(
          "When multiple Keytips start with the same character,",
          "typing that character will filter the visible keytips."
        )
      ),
      KeytipLayer(),
      Stack(horizontal = TRUE, tokens = list(childrenGap = 20),
        DefaultButton.shinyInput(
          ns("button1"),
          keytipProps = JS("keytipMap.Button"),
          text = "Button"
        ),
        CompoundButton.shinyInput(
          ns("button2"),
          style = list(marginBottom = 28),
          keytipProps = JS("keytipMap.CompoundButton"),
          text = "Compound Button",
          secondaryText = 'With a Keytip'
        ),
        DefaultButton.shinyInput(
          ns("button3"),
          keytipProps = JS("keytipMap.ButtonWithMenu"),
          text = "Button with Menu",
          menuProps = JS("buttonProps")
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    clicks <- reactiveVal(0)
    addClick <- function() clicks(clicks() + 1)
    output$keytipsResult <- renderText(paste("Buttons clicked: ", clicks()))
    observeEvent(input$button1, addClick())
    observeEvent(input$button2, addClick())
    observeEvent(input$button3, addClick())
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
