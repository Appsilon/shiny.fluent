# SearchBox

A search box (`SearchBox`) provides an input field for searching
content within a site or app to find specific items.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SearchBox).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
SearchBox(...)

SearchBox.shinyInput(inputId, ..., value = defaultValue)

updateSearchBox.shinyInput(
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
  The aria label of the SearchBox for the benefit of screen readers.

- **className** `string`  
  CSS class to apply to the SearchBox.

- **clearButtonProps** `IButtonProps`  
  The props for the clear button.

- **componentRef** `IRefObject<ISearchBox>`  
  Optional callback to access the ISearchBox interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **defaultValue** `string`  
  The default value of the text in the SearchBox, in the case of an
  uncontrolled component. This prop is being deprecated since so far,
  uncontrolled behavior has not been implemented.

- **disableAnimation** `boolean`  
  Whether or not to animate the SearchBox icon on focus.

- **iconProps**
  `Pick<IIconProps, Exclude<keyof IIconProps, 'className'>>`  
  The props for the icon.

- **labelText** `string`  
  Deprecated. Use `placeholder` instead.

- **onChange**
  `(event?: React.ChangeEvent<HTMLInputElement>, newValue?: string) => void`  
  Callback function for when the typed input for the SearchBox has
  changed.

- **onChanged** `(newValue: any) => void`  
  Deprecated at v0.52.2, use `onChange` instead.

- **onClear** `(ev?: any) => void`  
  Callback executed when the user clears the search box by either
  clicking 'X' or hitting escape.

- **onEscape** `(ev?: any) => void`  
  Callback executed when the user presses escape in the search box.

- **onSearch** `(newValue: any) => void`  
  Callback executed when the user presses enter in the search box.

- **placeholder** `string`  
  Placeholder for the search box.

- **styles**
  `IStyleFunctionOrObject<ISearchBoxStyleProps, ISearchBoxStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization).

- **underlined** `boolean`  
  Whether or not the SearchBox is underlined.

- **value** `string`  
  The value of the text in the SearchBox.

## Best practices

### Layout

- Don't build a custom search control based on the default text box or
  any other control.

- Use a search box without a parent container when it's not restricted
  to a certain width to accommodate other content. This search box will
  span the entire width of the space it's in.

### Content

- Use placeholder text in the search box to describe what people can
  search for. For example, "Search", "Search files", or "Search contacts
  list".

- Although search entry points tend to be similarly visualized, they can
  provide access to results that range from broad to narrow. By
  effectively communicating the scope of a search, you can ensure that
  people's expectations are met by the capabilities of the search you're
  performing, which will reduce the possibility of frustration. The
  search entry point should be placed near the content being searched.  
    
  Some common search scopes include:

  - **Global**: Search across multiple sources of cloud and local
    content. Varied results include URLs, documents, media, actions,
    apps, and more.

  - **Web**: Search a web index. Results include pages, entities, and
    answers.

  - **My stuff**: Search across devices, cloud, social graphs, and more.
    Results are varied but are constrained by the connection to user
    accounts.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    SearchBox.shinyInput(ns("search"), placeholder = "Search"),
    textOutput(ns("searchValue"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$searchValue <- renderText({
      sprintf("Value: %s", input$search)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
