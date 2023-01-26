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
