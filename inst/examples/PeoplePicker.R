library(shiny.fluent)

people <- tibble::tribble(
  ~key, ~imageUrl, ~imageInitials, ~text, ~secondaryText, ~tertiaryText, ~optionalText, ~isValid, ~presence, ~canExpand,
  1, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "PV", "Annie Lindqvist", "Designer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  2, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AR", "Aaron Reid", "Designer", "In a meeting", "Available at 4:00pm", TRUE, 6, NA,
  3, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AL", "Alex Lundberg", "Software Developer", "In a meeting", "Available at 4:00pm", TRUE, 4, NA,
  4, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "RK", "Roko Kolar", "Financial Analyst", "In a meeting", "Available at 4:00pm", TRUE, 1, NA,
  5, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "CB", "Christian Bergqvist", "Sr. Designer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  6, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "VL", "Valentina Lovric", "Design Developer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
  7, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "MS", "Maor Sharett", "UX Designer", "In a meeting", "Available at 4:00pm", TRUE, 3, NA
)

if (interactive()) {
  suggestionProps <- list(
    suggestionsHeaderText='Suggested People',
    mostRecentlyUsedHeaderText='Suggested Contacts',
    noResultsFoundText='No results found',
    loadingText='Loading',
    showRemoveButtons=TRUE,
    suggestionsAvailableAlertText='People Picker Suggestions available',
    suggestionsContainerAriaLabel='Suggested contacts'
  );
  
  shinyApp(
    ui = tagList(
      tags$script(HTML(paste("people = ", jsonlite::toJSON(people)))),
      textOutput("selectedPeople"),
      withReact(
        NormalPeoplePicker(
          onResolveSuggestions=JS("function(filterText) { return people.filter(item => item.text.toLowerCase().indexOf(filterText.toLowerCase()) === 0) }"),
          onEmptyInputFocus=JS("function() { return people }"),
          getTextFromItem=JS("function(item) { return item.text }"),
          pickerSuggestionsProps=suggestionProps,
          className="ms-PeoplePicker",
          onChange=JS("function(selection) { Shiny.setInputValue('selectedPeople', JSON.stringify(selection)) }")
        )
      )
    ),
    server = function(input, output) {
      output$selectedPeople <- renderText({
        if (is.null(input$selectedPeople)) {
          "Select recipients below:"
        } else {
          paste("You have selected:", paste(jsonlite::fromJSON(input$selectedPeople)$text, collapse=", "))
        }
      })
    }
  )
}
