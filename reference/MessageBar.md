# MessageBar

A banner (`MessageBar`) displays errors, warnings, or important
information about an open app or file. For example, if a file failed to
upload an error message bar should appear.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/MessageBar).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
MessageBar(...)

MessageBarButton(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **actions** `JSX.Element`  
  The actions you want to show on the other side.

- **ariaLabel** `string`  
  A description of the message bar for the benefit of screen readers.

- **className** `string`  
  Additional CSS class(es) to apply to the MessageBar.

- **componentRef** `IRefObject<IMessageBar>`  
  Optional callback to access the IMessageBar interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **dismissButtonAriaLabel** `string`  
  Aria label on dismiss button if onDismiss is defined.

- **dismissIconProps** `IIconProps`  
  Custom icon prop to replace the dismiss icon. If unset, default will
  be the Fabric Clear icon.

- **isMultiline** `boolean`  
  Determines if the message bar is multi lined. If false, and the text
  overflows over buttons or to another line, it is clipped.

- **messageBarIconProps** `IIconProps`  
  Custom icon prop to replace the message bar icon. If unset, default
  will be the icon set by messageBarType.

- **messageBarType** `MessageBarType`  
  The type of MessageBar to render.

- **onDismiss**
  `(ev?: React.MouseEvent<HTMLElement | BaseButton | Button>) => any`  
  Whether the message bar has a dismiss button and its callback. If
  null, we don't show a dismiss button.

- **overflowButtonAriaLabel** `string`  
  Aria label on overflow button if truncated is defined.

- **styles**
  `IStyleFunctionOrObject<IMessageBarStyleProps, IMessageBarStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization.)

- **truncated** `boolean`  
  Determines if the message bar text is truncated. If true, a button
  will render to toggle between a single line view and multiline view.
  This prop is for single line message bars with no buttons only in a
  limited space scenario.

## Best practices

### Layout

- A message bar is most commonly found near the top of an app,
  underneath the app's main command bar. For example, the Microsoft
  Office message bar is positioned beneath the Ribbon, but above the
  document canvas.

- Multiple message bars can appear at a time, but a given scenario or
  related set of scenarios should aim to only show one message bar at a
  time. Message bars are rarely shown in direct response to an action;
  rather, they should be shown when there’s something a person should
  know about the overall app or document.

- Use the icons options to indicate the message type: the Info icon for
  information messages; ShieldAlert icon for security-related messages;
  the Warning icon for non-blocking errors; ErrorBadge icon for critical
  errors; the Blocked icon for blocking messages; and the Completed icon
  for success messages.

### Content

Message bars should include:

#### Title

Limit titles to 50 characters (including spaces) to
leave room for text expansion when translated. People should be able to
scan the title to determine the purpose of the message. Capitalize only
the first word of the title and any proper nouns.

#### Body text

Describe the information or error state concisely, ideally in a single
sentence. Limit the message to fewer than 512 characters (including
spaces) to leave room for text expansion when translated. Include end
punctuation for complete sentences.

#### Action buttons (Optional)

Offer one to two action buttons to help people solve any errors they're
receiving. Limit button text to fewer than 50 charactesr (including
spaces) to leave room for translation. Action buttons can have any
callback attached to them and should provide people with options to
address the notification and dismiss the message bar.

#### Link (Optional)

Don’t use buttons when a subtler link will suffice. Reserve the use of a
button for when the MessageBar has a single ”hero” action that is
useful at that particular moment. Avoid using more than one button.

#### Close button

Always offer a quick way for people to close a message bar, unless there
is an issue that must be resolved immediately, such as an expired
subscription.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  MessageBar("Message")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
