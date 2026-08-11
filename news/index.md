# Changelog

## shiny.fluent 0.4.1

1.  Fixed an invalid link in the `Icon` documentation that failed CRAN’s
    HTML validation.
2.  Links to the Fluent UI docs and the Microsoft Writing Style Guide
    now point at their current locations.
3.  Removed the `imola` dependency from the dashboard example, which now
    uses plain CSS grid.

## shiny.fluent 0.4.0

CRAN release: 2024-05-21

1.  Upgraded `@fluentui/react` to 8.118.2.
2.  Upgraded `shiny.react` dependency to 0.4.0 that uses React 18.3.1.

## shiny.fluent 0.3.0

CRAN release: 2023-01-24

1.  Added `ThemeProvider` component
    ([\#47](https://github.com/Appsilon/shiny.fluent/issues/47)).
2.  Added `ShimmeredDetailsList` component
    ([\#34](https://github.com/Appsilon/shiny.fluent/issues/34)).
3.  All `.shinyInput` wrappers now have a sensible debounce consistent
    with vanilla Shiny
    ([\#130](https://github.com/Appsilon/shiny.fluent/issues/130)).
4.  Added update functions for all buttons
    ([\#12](https://github.com/Appsilon/shiny.react/issues/12)).
5.  `Dropdown.shinyInput` now supports multiselection
    ([\#42](https://github.com/Appsilon/shiny.fluent/issues/42)).

## shiny.fluent 0.2.2

1.  Make the behavior of `DatePicker.shinyInput` with `value = NULL`
    consistent with vanilla Shiny
    ([\#118](https://github.com/Appsilon/shiny.fluent/pull/118)).

## shiny.fluent 0.2.0

This is the first public release, with several big interface changes:

1.  Removed `withReact()`. Components now work without it!
2.  Added `.shinyInput` suffix to components with interface modified to
    match vanilla Shiny inputs. The corresponding components without the
    suffix now expose unaltered React interface.
3.  Changed naming convention to `camelCase`.
4.  Added
    [`setInput()`](https://appsilon.github.io/shiny.react/reference/setInput.html)
    and
    [`triggerEvent()`](https://appsilon.github.io/shiny.react/reference/triggerEvent.html)
    helpers.

## shiny.fluent 0.1.0

Initial release made available to the early access group.
