# Dropdown

A dropdown menu is a list in which the selected item is always visible
while other items are visible on demand by clicking a dropdown button.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Dropdown).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Dropdown(...)

Dropdown.shinyInput(inputId, ..., value = defaultValue)

updateDropdown.shinyInput(
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

- **defaultSelectedKeys** `string[] | number[]`  
  Keys that will be initially used to set selected items. This prop is
  only used when `multiSelect` is true (use `defaultSelectedKey` for
  single select). Mutually exclusive with `selectedKeys`.

- **dropdownWidth** `number`  
  Custom width for dropdown. If value is 0, width of the input field is
  used.

- **isDisabled** `boolean`  
  Deprecated at v0.52.0, use `disabled` instead.

- **keytipProps** `IKeytipProps`  
  Optional keytip for this dropdown

- **multiSelectDelimiter** `string`  
  When multiple items are selected, this will be used to separate values
  in the dropdown input.

- **notifyOnReselect** `boolean`  
  If true, `onChange` will still be called when an already-selected item
  is clicked again in single select mode. (Normally it would not be
  called in this case.)

- **onChange**
  `(event: React.FormEvent<HTMLDivElement>, option?: IDropdownOption, index?: number) => void`  
  Callback for when the selected option changes.

- **onChanged** `(option: IDropdownOption, index?: number) => void`  

- **onRenderCaretDown** `IRenderFunction<IDropdownProps>`  
  Custom renderer for chevron icon

- **onRenderLabel** `IRenderFunction<IDropdownProps>`  
  Custom renderer for the label.

- **onRenderPlaceholder** `IRenderFunction<IDropdownProps>`  
  Custom renderer for placeholder text

- **onRenderPlaceHolder** `IRenderFunction<IDropdownProps>`  
  Custom renderer for placeholder text

- **onRenderTitle** `IRenderFunction<IDropdownOption[]>`  
  Custom renderer for selected option displayed in input

- **options** `IDropdownOption[]`  
  Options for the dropdown. If using `defaultSelectedKey` or
  `defaultSelectedKeys`, options must be pure for correct behavior.

- **placeHolder** `string`  
  Input placeholder text. Displayed until an option is selected.

- **responsiveMode** `ResponsiveMode`  
  By default, the dropdown will render the standard way for screen sizes
  `large` and above, or in a panel on `small` and `medium` screens.
  Manually set this prop to override this behavior.

- **selectedKeys** `string[] | number[] | null`  
  Keys of the selected items, only used when `multiSelect` is true (use
  `selectedKey` for single select). If you provide this, you must
  maintain selection state by observing onChange events and passing a
  new prop value in when changed. Passing null will clear the selection.
  Mutually exclusive with `defaultSelectedKeys`.

- **styles**
  `IStyleFunctionOrObject<IDropdownStyleProps, IDropdownStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by higher order component.

## Best practices

### Layout

- Use a dropdown list when there are multiple choices that can be
  collapsed under one title, if the list of items is too long, or when
  space is constrained.

- Use a dropdown list when the selected option is more important than
  the alternatives (in contrast to radio buttons where all the choices
  are visible, putting equal emphasis on all options).

### Content

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

- The dropdown list label should describe what can be found in the menu.

- Use shortened statements or single words as list options.

- If there isn't a default option, use "Select an option" as placeholder
  text.

- If "None" is an option, include it.

- Write the choices using parallel construction. For example, start with
  the same part of speech or verb tense.

## Examples

``` r
# Example 1
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
    Dropdown.shinyInput(ns("dropdown"), value = "A", options = options),
    textOutput(ns("dropdownValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$dropdownValue <- renderText({
      sprintf("Value: %s", input$dropdown)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

# Rendering headers and dividers inside dropdown
DropdownMenuItemType <- function(type) {
  JS(paste0("jsmodule['@fluentui/react'].DropdownMenuItemType."), type)
}

ui <- function(id) {
  fluentPage(
    Dropdown(
      "fruit",
      label = "Fruit",
      multiSelect = TRUE,
      options = list(
        list(
          key = "fruitsHeader",
          text = "Fruit",
          itemType = DropdownMenuItemType("Header")
        ),
        list(key = "apple", text = "Apple"),
        list(key = "banana", text = "Banana"),
        list(key = "orange", text = "Orange", disabled = TRUE),
        list(key = "grape", text = "Grape"),
        list(
          key = "divider_1",
          text = "-",
          itemType = DropdownMenuItemType("Divider")
        ),
        list(
          key = "vegetablesHeader",
          text = "Vegetables",
          itemType = DropdownMenuItemType("Header"
          )
        ),
        list(key = "broccoli", text = "Broccoli"),
        list(key = "carrot", text = "Carrot"),
        list(key = "lettuce", text = "Lettuce")
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
