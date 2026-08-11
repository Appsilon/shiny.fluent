# Dialog

A dialog box (`Dialog`) is a temporary pop-up that takes focus from
the page or app and requires people to interact with it. It’s primarily
used for confirming actions, such as deleting a file, or asking people
to make a choice.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Dialog).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Dialog(...)

DialogFooter(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Optional override class name

- **closeButtonAriaLabel** `string`  
  Label to be passed to to aria-label of close button

- **componentRef** `IRefObject<IDialogContent>`  
  Optional callback to access the IDialogContent interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **draggableHeaderClassName** `string`  
  The classname for when the header is draggable

- **isMultiline** `boolean`  
  Is inside a multiline wrapper

- **onDismiss** `(ev?: React.MouseEvent<HTMLButtonElement>) => any`  
  Callback for when the Dialog is dismissed from the close button or
  light dismiss, before the animation completes.

- **responsiveMode** `ResponsiveMode`  
  Responsive mode passed in from decorator.

- **showCloseButton** `boolean`  
  Show an 'x' close button in the upper-right corner

- **styles**
  `IStyleFunctionOrObject<IDialogContentStyleProps, IDialogContentStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **subText** `string`  
  The subtext to display in the dialog

- **subTextId** `string`  
  The Id for subText container

- **theme** `ITheme`  
  Theme provided by HOC.

- **title** `string | JSX.Element`  
  The title text to display at the top of the dialog.

- **titleId** `string`  
  The Id for title container

- **titleProps** `React.HTMLAttributes<HTMLDivElement>`  
  The props for title container.

- **topButtonsProps** `IButtonProps[]`  
  Other top buttons that will show up next to the close button

- **type** `DialogType`  
  The type of Dialog to display.

- **className** `string`  
  Optional override class name

- **componentRef** `IRefObject<IDialogFooter>`  
  Gets the component ref.

- **styles**
  `IStyleFunctionOrObject<IDialogFooterStyleProps, IDialogFooterStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

- **ariaDescribedById** `string`  
  Optional id for aria-DescribedBy

- **ariaLabelledById** `string`  
  Optional id for aria-LabelledBy

- **className** `string`  
  Optional class name to be added to the root class

- **componentRef** `IRefObject<IDialog>`  
  Optional callback to access the IDialog interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **containerClassName** `string`  
  Optional override for container class

- **contentClassName** `string`  
  Optional override content class

- **dialogContentProps** `IDialogContentProps`  
  Props to be passed through to Dialog Content

- **hidden** `boolean`  
  Whether the dialog is hidden.

- **isBlocking** `boolean`  
  Whether the dialog can be light dismissed by clicking outside the
  dialog (on the overlay).

- **isDarkOverlay** `boolean`  
  Whether the overlay is dark themed.

- **isOpen** `boolean`  
  Whether the dialog is displayed. Deprecated, use `hidden` instead.

- **maxWidth** `ICSSRule | ICSSPixelUnitRule`  
  Sets the maximum width for the dialog. It limits the width property to
  be larger than the value specified in max-width.

- **minWidth** `ICSSRule | ICSSPixelUnitRule`  
  Sets the minimum width of the dialog. It limits the width property to
  be not smaller than the value specified in min-width.

- **modalProps** `IModalProps`  
  Props to be passed through to Modal

- **onDismiss** `(ev?: React.MouseEvent<HTMLButtonElement>) => any`  
  A callback function for when the Dialog is dismissed from the close
  button or light dismiss. Can also be specified separately in content
  and modal.

- **onDismissed** `() => any`  
  A callback function which is called after the Dialog is dismissed and
  the animation is complete.

- **onLayerDidMount** `() => void`  
  A callback function for when the Dialog content is mounted on the
  overlay layer

- **onLayerMounted** `() => void`  
  Deprecated at 0.81.2, use `onLayerDidMount` instead.

- **styles**
  `IStyleFunctionOrObject<IDialogStyleProps, IDialogStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **subText** `string`  
  The subtext to display in the dialog.

- **theme** `ITheme`  
  Theme provided by HOC.

- **title** `string | JSX.Element`  
  The title text to display at the top of the dialog.

- **topButtonsProps** `IButtonProps[]`  
  Other top buttons that will show up next to the close button

- **type** `DialogType`  
  The type of Dialog to display.

## Best practices

### Layout

- Don't use more than three buttons.

- Dialog boxes consist of a header, body, and footer.

- Validate that people’s entries are acceptable before closing the
  dialog box. Show an inline validation error near the field they must
  correct.

- Blocking dialogs should be used very sparingly, only when it is
  critical that people make a choice or provide information before they
  can proceed. Blocking dialogs are generally used for irreversible or
  potentially destructive tasks. They’re typically paired with an
  overlay without a light dismiss.

#### Header

- Locks to the top of the dialog.

- May include an icon to the left of the title.

- Includes a Close button in the top-right corner.

#### Footer

- Lock buttons to the bottom of the dialog.

- Includes one primary button. A secondary button is optional.

#### Width

- Maximum is 340 pixels.

- Minimum is 288 pixels.

#### Height

- Maximum is 340 pixels.

- Minimum is 172 pixels.

### Content

#### Title

- Keep the title as concise as possible.

- Don’t use periods at the end of titles.

- This mandatory content should explain the main information in a clear,
  concise, and specific statement or question. For example, “Delete this
  file?” instead of “Are you sure?”

- The title shouldn’t be a description of the body content. For example,
  don’t use “Error” as a title. Instead, use an informative statement
  like “Your session ended.”

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

#### Body copy (Optional)

- Don't restate the title in the body.

- Use ending punctuation on sentences.

- Use actionable language, with the most important information at the
  beginning.

- Use the optional body content area for additional info or
  instructions, if needed. Only include information needed to help
  people make a decision.

#### Button labels

- Write button labels that are specific responses to the main
  information in the title. The title “Delete this file?” could have
  buttons labeled “Delete” and “Cancel”.

- Be concise. Limit labels to one or two words. Usually a single verb is
  best. Include a noun if there is any room for interpretation about
  what the verb means. For example, “Delete” or “Delete file”.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("showDialog"), text = "Open dialog"),
    reactOutput(ns("reactDialog"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    isDialogOpen <- reactiveVal(FALSE)
    output$reactDialog <- renderReact({
      dialogContentProps <- list(
        type = 0,
        title = "Missing Subject",
        closeButtonAriaLabel = "Close",
        subText = "Do you want to send this message without a subject?"
      )
      Dialog(
        hidden = !isDialogOpen(),
        onDismiss = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("hideDialog"),"', Math.random());",
          "}"
        )),
        dialogContentProps = dialogContentProps,
        modalProps = list(),
        DialogFooter(
          PrimaryButton.shinyInput(ns("dialogSend"), text = "Send"),
          DefaultButton.shinyInput(ns("dialogDontSend"), text = "Don't send")
        )
      )
    })

    observeEvent(input$showDialog, isDialogOpen(TRUE))
    observeEvent(input$hideDialog, isDialogOpen(FALSE))
    observeEvent(input$dialogSend, isDialogOpen(FALSE))
    observeEvent(input$dialogDontSend, isDialogOpen(FALSE))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
