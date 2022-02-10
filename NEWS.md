# shiny.fluent 0.2.1

* Ensure `Calendar.shinyInput` and `DatePicker.shinyInput` with `value = NULL` to behave
  consistently with the official behavior. [#118](https://github.com/Appsilon/shiny.fluent/pull/118)

# shiny.fluent 0.2.0

This is the first public release, with several big interface changes:

* Removed `withReact()`. Components now work without it!
* Added `.shinyInput` suffix to components with interface modified to match vanilla Shiny inputs.
  The corresponding components without the suffix now expose unaltered React interface.
* Changed naming convention to `camelCase`.
* Added `setInput()` and `triggerEvent()` helpers.

# shiny.fluent 0.1.0

Initial release made available to the early access group.
