# PeoplePicker

The people picker (`PeoplePicker`) is used to select one or more
entities, such as people or groups, from a list. It makes composing an
email to someone, or adding them to a group, easy if you don’t know
their full name or email address.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/PeoplePicker).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
CompactPeoplePicker(...)

NormalPeoplePicker(...)

NormalPeoplePicker.shinyInput(inputId, ..., value = defaultValue)

updateNormalPeoplePicker.shinyInput(
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

- **styles**
  `IStyleFunctionOrObject<IPeoplePickerItemSelectedStyleProps, IPeoplePickerItemSelectedStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **ValidationState** `ValidationState`  

- **className** `string`  
  Additional CSS class(es) to apply to the PeoplePickerItem root
  element.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **compact** `boolean`  
  Flag that controls whether each suggested PeoplePicker item (Persona)
  is rendered with or without secondary text for compact look.

- **personaProps** `IPersonaProps`  
  Persona props for each suggested for picking PeoplePicker item.

- **styles**
  `IStyleFunctionOrObject<IPeoplePickerItemSuggestionStyleProps, IPeoplePickerItemSuggestionStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **suggestionsProps** `IBasePickerSuggestionsProps`  
  General common props for all PeoplePicker items suggestions.

## Best practices

### Layout

- Use the people picker to add someone to the To line of an email, or to
  add someone to a list.

- Use the `MemberList PeoplePicker` to display selections below the
  input field.

## Examples

``` r
library(shiny)
library(shiny.fluent)

assetsUrl <- "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/"
malePersonaUrl <- paste0(assetsUrl, "persona-male.png")
femalePersonaUrl <- paste0(assetsUrl, "persona-female.png")

people <- tibble::tibble(
  key = c(1, 2, 3, 4, 5, 6, 7),
  imageUrl = c(
    femalePersonaUrl,
    malePersonaUrl,
    malePersonaUrl,
    malePersonaUrl,
    malePersonaUrl,
    femalePersonaUrl,
    malePersonaUrl
  ),
  imageInitials = c("PV", "AR", "AL", "RK", "CB", "VL", "MS"),
  text = c(
    "Annie Lindqvist",
    "Aaron Reid",
    "Alex Lundberg",
    "Roko Kolar",
    "Christian Bergqvist",
    "Valentina Lovric",
    "Maor Sharett"
  ),
  secondaryText = c(
    "Designer",
    "Designer",
    "Software Developer",
    "Financial Analyst",
    "Sr. Designer",
    "Design Developer",
    "UX Designer"
  ),
  tertiaryText = c(
    "In a meeting",
    "In a meeting",
    "In a meeting",
    "In a meeting",
    "In a meeting",
    "In a meeting",
    "In a meeting"
  ),
  optionalText = c(
    "Available at 4:00pm",
    "Available at 4:00pm",
    "Available at 4:00pm",
    "Available at 4:00pm",
    "Available at 4:00pm",
    "Available at 4:00pm",
    "Available at 4:00pm"
  ),
  isValid = c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE, TRUE),
  presence = c(2, 6, 4, 1, 2, 2, 3),
  canExpand = c(NA, NA, NA, NA, NA, NA, NA)
)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    textOutput(ns("selectedPeople")),
    NormalPeoplePicker.shinyInput(
      ns("selectedPeople"),
      options = people,
      pickerSuggestionsProps = list(
        suggestionsHeaderText = 'Matching people',
        mostRecentlyUsedHeaderText = 'Sales reps',
        noResultsFoundText = 'No results found',
        showRemoveButtons = TRUE
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$selectedPeople <- renderText({
      if (length(input$selectedPeople) == 0) {
        "Select recipients below:"
      } else {
        selectedPeople <- dplyr::filter(people, key %in% input$selectedPeople)
        paste("You have selected:", paste(selectedPeople$text, collapse=", "))
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
