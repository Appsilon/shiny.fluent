# Divider

A Divider is a line that is used to visually differentiate different
parts of a UI. They are commonly used in headers and command bars. This
divider automatically center algins itself within the parent container
and can be customized to be shown in different heights and colors.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Divider).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
VerticalDivider(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Best practices

Use a divider component to show a sectional or continuity change in the
content between two blocks of information. The spacing around the
divider is generally determined by the content surrounding it.

There are two recommended divider color combinations:

1.  \#C8C8C8/neutralTertiaryAlt divider when used within an
    \#F4F4F4/neutralLighter layout

2.  \#EAEAEA/neutralLight divider when used within an \#FFFFFF/white
    layout
