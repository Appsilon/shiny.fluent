# Documentation template for components with `.shinyInput` wrappers

Documentation template for components with `.shinyInput` wrappers

## Arguments

- inputId:

  ID of the component.

- value:

  Starting value.

- session:

  Object passed as the `session` argument to Shiny server.

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
The update functions return nothing (called for side effects).
