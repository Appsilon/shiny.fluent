# Facepile

A face pile (`Facepile`) displays a list of personas. Each circle
represents a person and contains their image or initials. Often this
control is used when sharing who has access to a specific view or file,
or when assigning someone a task within a workflow.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Facepile).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Facepile(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **addButtonProps** `IButtonProps`  
  Button properties for the add face button

- **ariaDescription** `string`  
  ARIA label for persona list

- **ariaLabel** `string`  
  Defines the aria label that the screen readers use when focus goes on
  a list of personas.

- **chevronButtonProps** `IButtonProps`  
  Deprecated at v0.70, use `overflowButtonProps` instead.

- **className** `string`  
  Additional css class to apply to the Facepile

- **componentRef** `IRefObject<IFacepile>`  
  Optional callback to access the IFacepile interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **getPersonaProps**
  `(persona: IFacepilePersona) => IPersonaSharedProps`  
  Method to access properties on the underlying Persona control

- **maxDisplayablePersonas** `number`  
  Maximum number of personas to show

- **onRenderPersona** `IRenderFunction<IFacepilePersona>`  
  Optional custom renderer for the persona, gets called when there is
  one persona in personas array

- **onRenderPersonaCoin** `IRenderFunction<IFacepilePersona>`  
  Optional custom renderer for the persona coins, gets called when there
  are multiple persona in personas array

- **overflowButtonProps** `IButtonProps`  
  Properties for the overflow icon

- **overflowButtonType** `OverflowButtonType`  
  Type of overflow icon to use

- **overflowPersonas** `IFacepilePersona[]`  
  Personas to place in the overflow

- **personas** `IFacepilePersona[]`  
  Array of IPersonaProps that define each Persona.

- **personaSize** `PersonaSize`  
  Size to display the personas

- **showAddButton** `boolean`  
  Show add person button

- **styles**
  `IStyleFunctionOrObject<IFacepileStyleProps, IFacepileStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

## Best practices

### Layout

- The face pile empty state should only include an "Add" button. Another
  variant is to use an input field with placeholder text instructing
  people to add a person. See the people picker component for the menu
  used to add people to the face pile list.

- When there is only one person in the face pile, consider using their
  name next to the face or initials.

- When there is a need to show the face pile expanded into a vertical
  list, include a downward chevron button. Selecting the chevron opens a
  standard list view of people.

- When the face pile exceeds a max number of 5 people, show a button at
  the end of the list indicating how many are not being shown. Clicking
  or tapping on the overflow would open a standard list view of people.

- The component can include an "Add" button which can be used for
  quickly adding a person to the list.

- When hovering over a person in the face pile, include a tooltip or
  people card that offers more information about that person.

## Examples

``` r
library(shiny)
library(shiny.fluent)

personas <- list(
  list(personaName = "Adams Baker"),
  list(personaName = "Clark Davis"),
  list(personaName = "Evans Frank")
)

ui <- function(id) {
  ns <- NS(id)
  Facepile(personas = personas)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
