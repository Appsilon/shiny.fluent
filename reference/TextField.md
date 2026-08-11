# TextField

Text fields (`TextField`) give people a way to enter and edit text.
They’re used in forms, modal dialogs, tables, and other surfaces where
text input is required.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/TextField).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
MaskedTextField(...)

TextField(...)

TextField.shinyInput(inputId, ..., value = defaultValue)

updateTextField.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

- inputId:

  ID of the component.

- value:

  Starting value.

- session:

  Object passed as the `session` argument to Shiny server.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
The update functions return nothing (called for side effects).

## Details

- **ariaLabel** `string`  
  Aria label for the text field.

- **autoAdjustHeight** `boolean`  
  For multiline text fields, whether or not to auto adjust text field
  height.

- **autoComplete** `string`  
  Whether the input field should have autocomplete enabled. This tells
  the browser to display options based on earlier typed values. Common
  values are 'on' and 'off' but for all possible values see the
  following links:
  https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete#Values
  https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#autofill

- **borderless** `boolean`  
  Whether or not the text field is borderless.

- **className** `string`  
  Optional class name that is added to the container of the component.

- **componentRef** `IRefObject<ITextField>`  
  Optional callback to access the ITextField component. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **defaultValue** `string`  
  Default value of the text field. Only provide this if the text field
  is an uncontrolled component; otherwise, use the `value` property.

- **deferredValidationTime** `number`  
  Text field will start to validate after users stop typing for
  `deferredValidationTime` milliseconds. Updates to this prop will not
  be respected.

- **description** `string`  
  Description displayed below the text field to provide additional
  details about what text to enter.

- **disabled** `boolean`  
  Disabled state of the text field.

- **errorMessage** `string | JSX.Element`  
  Static error message displayed below the text field. Use
  `onGetErrorMessage` to dynamically change the error message displayed
  (if any) based on the current value. `errorMessage` and
  `onGetErrorMessage` are mutually exclusive (`errorMessage` takes
  precedence).

- **iconProps** `IIconProps`  
  Props for an optional icon, displayed in the far right end of the text
  field.

- **inputClassName** `string`  
  Optional class name that is added specifically to the input/textarea
  element.

- **label** `string`  
  Label displayed above the text field (and read by screen readers).

- **mask** `string`  
  Only used by MaskedTextField: The masking string that defines the
  mask's behavior. A backslash will escape any character. Special format
  characters are: '9': `[0-9]` 'a': `[a-zA-Z]` '\*': `[a-zA-Z0-9]`

- **maskChar** `string`  
  Only used by MaskedTextField: The character to show in place of
  unfilled characters of the mask.

- **maskFormat** `{ [key: string]: RegExp; }`  
  Only used by MaskedTextField: An object defining the format characters
  and corresponding regexp values. Default format characters: { '9':
  /`[0-9]`/, 'a': /`[a-zA-Z]`/, '\*': /`[a-zA-Z0-9]`/ }

- **multiline** `boolean`  
  Whether or not the text field is a multiline text field.

- **onChange**
  `(event: React.FormEvent<HTMLInputElement | HTMLTextAreaElement>, newValue?: string) => void`  
  Callback for when the input value changes. This is called on both
  `input` and `change` events. (In a later version, this will probably
  only be called for the `change` event.)

- **onGetErrorMessage**
  `(value: string) => string | JSX.Element | PromiseLike<string | JSX.Element> | undefined`  
  Function used to determine whether the input value is valid and get an
  error message if not. Mutually exclusive with the static string
  `errorMessage` (it will take precedence over this).

When it returns `string | JSX.Element`: - If valid, it returns empty
string. - If invalid, it returns the error message and the text field
will show a red border and show an error message below the text field.

When it returns `Promise<string | JSX.Element>`: - The resolved value is
displayed as the error message. - If rejected, the value is thrown away.

- **onNotifyValidationResult**
  `(errorMessage: string | JSX.Element, value: string | undefined) => void`  
  Function called after validation completes.

- **onRenderDescription** `IRenderFunction<ITextFieldProps>`  
  Custom renderer for the description.

- **onRenderLabel** `IRenderFunction<ITextFieldProps>`  
  Custom renderer for the label. If you don't call defaultRender, ensure
  that you give your custom-rendered label an id and that you set the
  textfield's aria-labelledby prop to that id.

- **onRenderPrefix** `IRenderFunction<ITextFieldProps>`  
  Custom render function for prefix.

- **onRenderSuffix** `IRenderFunction<ITextFieldProps>`  
  Custom render function for suffix.

- **prefix** `string`  
  Prefix displayed before the text field contents. This is not included
  in the value. Ensure a descriptive label is present to assist screen
  readers, as the value does not include the prefix.

- **readOnly** `boolean`  
  If true, the text field is readonly.

- **resizable** `boolean`  
  For multiline text fields, whether or not the field is resizable.

- **styles**
  `IStyleFunctionOrObject<ITextFieldStyleProps, ITextFieldStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **suffix** `string`  
  Suffix displayed after the text field contents. This is not included
  in the value. Ensure a descriptive label is present to assist screen
  readers, as the value does not include the suffix.

- **theme** `ITheme`  
  Theme (provided through customization).

- **underlined** `boolean`  
  Whether or not the text field is underlined.

- **validateOnFocusIn** `boolean`  
  Run validation when focus moves into the input, and **do not**
  validate on change.

(Unless this prop and/or `validateOnFocusOut` is set to true, validation
will run on every change.)

- **validateOnFocusOut** `boolean`  
  Run validation when focus moves out of the input, and **do not**
  validate on change.

(Unless this prop and/or `validateOnFocusIn` is set to true, validation
will run on every change.)

- **validateOnLoad** `boolean`  
  Whether validation should run when the input is initially rendered.

- **value** `string`  
  Current value of the text field. Only provide this if the text field
  is a controlled component where you are maintaining its current state;
  otherwise, use the `defaultValue` property.

## Best practices

### Layout

- Use a multiline text field when long entries are expected.

- Don't place a text field in the middle of a sentence, because the
  sentence structure might not make sense in all languages. For example,
  "Remind me in `[textfield]` weeks" should instead read, "Remind me in
  this many weeks: `[textfield]`".

- Format the text field for the expected entry. For example, when
  someone needs to enter a phone number, use an input mask to indicate
  that three sets of digits should be entered.

### Content

- Include a short label above the text field to communicate what
  information should be entered. Don't use placeholder text instead of a
  label. Placeholder text poses a variety of accessibility issues
  (including possible problems with color/contrast, and people thinking
  the form input is already filled out).

- When part of a form, make it clear which fields are required vs.
  optional. If the input is required, add "(required)" to the label.
  Don't exclusively use "\\" to indicate required inputs as it is often
  not read by screen readers. For example, "First name (required)".

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    TextField.shinyInput(ns("text")),
    textOutput(ns("textValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$textValue <- renderText({
      sprintf("Value: %s", input$text)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

# Using custom handler to convert input to uppercase
CustomComponents <- tags$script(HTML("(function() {
  const { InputAdapter } = jsmodule['@/shiny.react'];
  const { TextField } = jsmodule['@fluentui/react'];
  const CustomComponents = jsmodule['CustomComponents'] ??= {};

  CustomComponents.UpperCaseTextField = InputAdapter(TextField, (value, setValue) => ({
    value: value.toUpperCase(),
    onChange: (e, v) => setValue(v.toUpperCase()),
  }));
})();"))

UpperCaseTextField <- function(inputId, ..., value = "") {
  shiny.react::reactElement(
    module = "CustomComponents",
    name = "UpperCaseTextField",
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = shinyFluentDependency()
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CustomComponents,
    UpperCaseTextField(ns("uppercase_text")),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text <- renderText(input$uppercase_text)
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
