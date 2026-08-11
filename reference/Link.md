# Link

Links lead to another part of an app, other pages, or help articles.
They can also be used to initiate commands.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Link).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Link(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **as** `string | React.ComponentClass | React.FunctionComponent`  
  A component that should be used as the root element of the link
  returned from the Link component.

- **componentRef** `IRefObject<ILink>`  
  Optional callback to access the ILink interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **disabled** `boolean`  
  Whether the link is disabled

- **keytipProps** `IKeytipProps`  
  Optional keytip for this Link

- **styles** `IStyleFunctionOrObject<ILinkStyleProps, ILinkStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme (provided through customization.)

## Best practices

### Layout

- Links visually indicate that they can be clicked, typically by being
  displayed using the visited or unvisited link system colors.
  Traditionally, links are underlined as well, but that approach is
  often reserved for body copy links within an article.

### Content

- People should be able to accurately predict the result of selecting a
  link based on its link text and optional tooltip.

- Use descriptive, actionable link text when possible. Avoid using URLs
  as link text.

- Don't use if the action is destructive or irreversible. Links aren't
  appropriate for commands with significant consequences.

- Keep discrete links far enough apart that people can differentiate
  between them and easily select each one.

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
  Link(href = "https://appsilon.com", "Appsilon")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
