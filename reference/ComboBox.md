# ComboBox

A combo box (`ComboBox`) combines a text field and a drop-down menu,
giving people a way to select an option from a list or enter their own
choice.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ComboBox).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ComboBox(...)

VirtualizedComboBox(...)

ComboBox.shinyInput(inputId, ..., value = defaultValue)

updateComboBox.shinyInput(
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

- **allowFreeform** `boolean`  
  Whether the ComboBox is free form, meaning that the user input is not
  bound to provided options. Defaults to false.

- **ariaDescribedBy** `string`  
  Optional prop to add a string id that can be referenced inside the
  aria-describedby attribute

- **autoComplete** `'on' | 'off'`  
  Whether the ComboBox auto completes. As the user is inputing text, it
  will be suggested potential matches from the list of options. If the
  combo box is expanded, this will also scroll to the suggested option,
  and give it a selected style.

- **autofill** `IAutofillProps`  
  The AutofillProps to be passed into the Autofill component inside
  combobox

- **buttonIconProps** `IIconProps`  
  The IconProps to use for the button aspect of the combobox

- **caretDownButtonStyles** `Partial<IButtonStyles>`  
  Styles for the caret down button.

- **comboBoxOptionStyles** `Partial<IComboBoxOptionStyles>`  
  Default styles that should be applied to ComboBox options, in case an
  option does not come with user-defined custom styles

- **componentRef** `IRefObject<IComboBox>`  
  Optional callback to access the IComboBox interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **dropdownMaxWidth** `number`  
  Custom max width for dropdown

- **dropdownWidth** `number`  
  Custom width for dropdown (unless useComboBoxAsMenuWidth is undefined
  or false)

- **getClassNames**
  `(theme: ITheme, isOpen: boolean, disabled: boolean, required: boolean, focused: boolean, allowFreeForm: boolean, hasErrorMessage: boolean, className?: string) => IComboBoxClassNames`  
  Custom function for providing the classNames for the ComboBox. Can be
  used to provide all styles for the component instead of applying them
  on top of the default styles.

- **iconButtonProps** `IButtonProps`  
  Optional iconButton props on combo box

- **isButtonAriaHidden** `boolean`  
  Sets the 'aria-hidden' attribute on the ComboBox's button element
  instructing screen readers how to handle the element. This element is
  hidden by default because all functionality is handled by the input
  element and the arrow button is only meant to be decorative.

- **keytipProps** `IKeytipProps`  
  Optional keytip for this combo box

- **multiSelectDelimiter** `string`  
  When multiple items are selected, this will be used to separate values
  in the combobox input.

- **onChange**
  `(event: React.FormEvent<IComboBox>, option?: IComboBoxOption, index?: number, value?: string) => void`  
  Callback issued when either: 1) the selected option changes 2) a
  manually edited value is submitted. In this case there may not be a
  matched option if allowFreeform is also true (and hence only value
  would be true, the other parameter would be null in this case)

- **onItemClick**
  `(event: React.FormEvent<IComboBox>, option?: IComboBoxOption, index?: number) => void`  
  Callback issued when a ComboBox item is clicked.

- **onMenuDismiss** `() => void`  
  Function that gets invoked before the menu gets dismissed

- **onMenuDismissed** `() => void`  
  Function that gets invoked when the ComboBox menu is dismissed

- **onMenuOpen** `() => void`  
  Function that gets invoked when the ComboBox menu is launched

- **onPendingValueChanged**
  `(option?: IComboBoxOption, index?: number, value?: string) => void`  
  Callback issued when the user changes the pending value in ComboBox.
  This will be called any time the component is updated and there is a
  current pending value. Option, index, and value will all be undefined
  if no change has taken place and the previously entered pending value
  is still valid.

- **onRenderLabel** `IRenderFunction<IOnRenderComboBoxLabelProps>`  
  Custom render function for the label text.

- **onRenderLowerContent** `IRenderFunction<IComboBoxProps>`  
  Add additional content below the callout list.

- **onRenderUpperContent** `IRenderFunction<IComboBoxProps>`  
  Add additional content above the callout list.

- **onResolveOptions**
  `(options: IComboBoxOption[]) => IComboBoxOption[] | PromiseLike<IComboBoxOption[]>`  
  Callback issued when the options should be resolved, if they have been
  updated or if they need to be passed in the first time

- **onScrollToItem** `(itemIndex: number) => void`  
  Callback issued when the ComboBox requests the list to scroll to a
  specific element

- **options** `IComboBoxOption[]`  
  Collection of options for this ComboBox

- **persistMenu** `boolean`  
  Menu will not be created or destroyed when opened or closed, instead
  it will be hidden. This will improve perf of the menu opening but
  could potentially impact overall perf by having more elements in the
  dom. Should only be used when perf is important. Note: This may
  increase the amount of time it takes for the comboBox itself to mount.

- **scrollSelectedToTop** `boolean`  
  When options are scrollable the selected option is positioned at the
  top of the callout when it is opened (unless it has reached the end of
  the scrollbar).

- **shouldRestoreFocus** `boolean`  
  When specified, determines whether the callout (the menu which drops
  down) should restore the focus after being dismissed or not. If false,
  then the menu will not try to set focus to whichever element had focus
  before the menu was opened.

- **styles** `Partial<IComboBoxStyles>`  
  Custom styles for this component

- **text** `string`  
  Value to show in the input, does not have to map to a combobox option

- **theme** `ITheme`  
  Theme provided by HOC.

- **useComboBoxAsMenuWidth** `boolean`  
  Whether to use the ComboBoxes width as the menu's width

- **multiselectAccessibleText** `string`  
  Accessible text for label when combobox is multiselected.

- **props** `IComboBoxProps`  
  Props to render the combobox.

## Best practices

### Layout

- Use a combo box when there are multiple choices that can be collapsed
  under one title, when the list of items is long, or when space is
  constrained.

### Content

- Use single words or shortened statements as options.

- Don't use punctuation at the end of options.

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
    ComboBox.shinyInput(ns("combo"), value = list(text = "some text"),
      options = options, allowFreeform = TRUE
    ),
    textOutput(ns("comboValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$comboValue <- renderText({
      sprintf("Value: %s", input$combo$text)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
