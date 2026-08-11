# Announced

The Announced component aims to fill several of the accessibility gaps
that exist in various web application experiences. It provides text for
the screen reader in certain scenarios that are lacking comprehensive
updates, particularly those showing the completion status or progress of
operation(s).

Some real-world applications of the component include copying,
uploading, or moving many files; deleting or renaming a single file;
"lazy loading" of page sections that do not appear all at once; and
appearance of search results.

The Announced component currently has the following documented use
cases:

1.  [Quick
    Actions](https://developer.microsoft.com/en-us/fluentui#/controls/web/announced/quickactions):
    Operations such as editing text or deletion that are short enough
    that they do not require a status during progress.

2.  [Search
    Results](https://developer.microsoft.com/en-us/fluentui#/controls/web/announced/searchresults):
    Appearance of search results such as in contact fields or search
    boxes.

3.  [Lazy
    Loading](https://developer.microsoft.com/en-us/fluentui#/controls/web/announced/lazyloading):
    "Lazy loading" of page sections that do not appear all at once.

4.  [Bulk
    Operations](https://developer.microsoft.com/en-us/fluentui#/controls/web/announced/bulkoperations):
    Operations that require multiple sub operations, such as the moving
    of several files.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Announced).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Announced(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **"aria-live"** `'off' | 'polite' | 'assertive'`  
  Priority with which the screen reader should treat updates to this
  region @default 'polite'

- **as** `React.ElementType`  
  Optionally render the root of this component as another component type
  or primitive. The custom type **must** preserve any children or native
  props passed in. @default 'div'

- **message** `string`  
  The status message provided as screen reader output

- **styles** `IStyleFunctionOrObject<{}, IAnnouncedStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  Announced(message = "Screen reader message")
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
