library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    tags$script(HTML("
      testTags = [
        'black',
        'blue',
        'brown',
        'cyan',
        'green',
        'magenta',
        'mauve',
        'orange',
        'pink',
        'purple',
        'red',
        'rose',
        'violet',
        'white',
        'yellow',
      ].map(item => ({ key: item, name: item }));

      function listContainsTagList(tag, tagList) {
        if (!tagList || !tagList.length || tagList.length === 0) {
          return false;
        }
        return tagList.some(compareTag => compareTag.key === tag.key);
      };

      function filterSuggestedTags(filterText, tagList) {
        return filterText
          ? testTags.filter(
              tag => tag.name.toLowerCase().indexOf(filterText.toLowerCase()) === 0 &&
               !listContainsTagList(tag, tagList),
            )
          : [];
      };
    ")),
    textOutput(ns("selectedTags")),
    TagPicker(
      onResolveSuggestions = JS("filterSuggestedTags"),
      onEmptyInputFocus = JS(
        "function(tagList) { return testTags.filter(tag => !listContainsTagList(tag, tagList)); }"
      ),
      getTextFromItem = JS("function(item) { return item.text }"),
      pickerSuggestionsProps = list(
        suggestionsHeaderText = 'Suggested tags',
        noResultsFoundText = 'No color tags found'
      ),
      itemLimit = 2,
      onChange = JS(
        paste0(
          "function(selection) { ",
          "Shiny.setInputValue('", ns("selectedTags") ,"', JSON.stringify(selection)); ",
          "}" 
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    
    output$selectedTags <- renderText({
      if (is.null(input$selectedTags)) {
        "Select up to 2 colors below:"
      } else {
        paste(
          "You have selected:",
          paste(jsonlite::fromJSON(input$selectedTags)$name, collapse = ", ")
        )
      }
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
