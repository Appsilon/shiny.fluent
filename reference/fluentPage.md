# Basic Fluent UI page

Creates a Fluent UI page with sensible defaults (included Fabric CSS
classes, proper class given to the body tag, suppressed Bootstrap).

## Usage

``` r
fluentPage(..., suppressBootstrap = TRUE)
```

## Arguments

- ...:

  The contents of the document body.

- suppressBootstrap:

  Whether to suppress Bootstrap.

## Value

Object which can be passed as the UI of a Shiny app.

## Details

The Bootstrap library is suppressed by default, as it doesn't work well
with Fluent UI in general.
