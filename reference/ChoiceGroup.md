# ChoiceGroup

Radio buttons (`ChoiceGroup`) let people select a single option from two
or more choices.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ChoiceGroup).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ChoiceGroup(...)

ChoiceGroup.shinyInput(inputId, ..., value = defaultValue)

updateChoiceGroup.shinyInput(
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

- **componentRef** `IRefObject<IChoiceGroupOption>`  
  Optional callback to access the IChoiceGroup interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **focused** `boolean`  
  Indicates if the ChoiceGroupOption should appear focused, visually

- **name** `string`  
  This value is used to group each ChoiceGroupOption into the same
  logical ChoiceGroup

- **onBlur**
  `(ev: React.FocusEvent<HTMLElement>, props?: IChoiceGroupOption) => void`  
  A callback for receiving a notification when the choice has lost
  focus.

- **onChange**
  `(evt?: React.FormEvent<HTMLElement | HTMLInputElement>, props?: IChoiceGroupOption) => void`  
  A callback for receiving a notification when the choice has been
  changed.

- **onFocus**
  `(ev?: React.FocusEvent<HTMLElement | HTMLInputElement>, props?: IChoiceGroupOption) => void | undefined`  
  A callback for receiving a notification when the choice has received
  focus.

- **required** `boolean`  
  If true, it specifies that an option must be selected in the
  ChoiceGroup before submitting the form

- **theme** `ITheme`  
  Theme (provided through customization.)

- **ariaLabelledBy** `string`  
  ID of an element to use as the aria label for this ChoiceGroup.

- **componentRef** `IRefObject<IChoiceGroup>`  
  Optional callback to access the IChoiceGroup interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **defaultSelectedKey** `string | number`  
  The key of the option that will be initially checked.

- **label** `string`  
  Descriptive label for the choice group.

- **onChange**
  `(ev?: React.FormEvent<HTMLElement | HTMLInputElement>, option?: IChoiceGroupOption) => void`  
  A callback for receiving a notification when the choice has been
  changed.

- **onChanged**
  `(option: IChoiceGroupOption, evt?: React.FormEvent<HTMLElement | HTMLInputElement>) => void`  
  Deprecated and will be removed by 07/17/2017. Use `onChange` instead.

- **options** `IChoiceGroupOption[]`  
  The options for the choice group.

- **selectedKey** `string | number`  
  The key of the selected option. If you provide this, you must maintain
  selection state by observing onChange events and passing a new value
  in when changed.

- **styles**
  `IStyleFunctionOrObject<IChoiceGroupStyleProps, IChoiceGroupStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization).

## Best practices

### Layout

- Use radio buttons when there are two to seven options, you have enough
  screen space, and the options are important enough to be a good use of
  that screen space.

- If there are more than seven options, use a drop-down menu instead.

- To give people a way to select more than one option, use check boxes
  instead.

- If a default option is recommended for most people in most situations,
  use a drop-down menu instead.

- Align radio buttons vertically instead of horizontally, if possible.
  Horizontal alignment is harder to read and localize. If there are only
  two mutually exclusive options, combine them into a single check box
  or toggle. For example, use a check box for "I agree" statements
  instead of radio buttons for "I agree" and "I disagree".

### Content

- List the options in a logical order, such as most likely to be
  selected to least, simplest operation to most complex, or least risk
  to most. Listing options in alphabetical order isn't recommended
  because the order will change when the text is localized.

- Select the safest (to prevent loss of data or system access), most
  secure, and most private option as the default. If safety and security
  aren't factors, select the most likely or convenient option.

- Use a phrase for the label, rather than a full sentence.

- Make sure to give people the option to not make a choice. For example,
  include a "None" option.

## Examples

``` r
library(shiny)
library(shiny.fluent)

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
)

ui <- function(id) {
  ns <- NS(id)
  div(
    ChoiceGroup.shinyInput(ns("choice"), value = "B", options = options),
    textOutput(ns("groupValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$groupValue <- renderText({
      sprintf("Value: %s", input$choice)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
