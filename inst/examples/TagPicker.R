library(shiny.fluent)

if (interactive()) {
  shinyApp(
    ui = tagList(
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
                tag => tag.name.toLowerCase().indexOf(filterText.toLowerCase()) === 0 && !listContainsTagList(tag, tagList),
              )
            : [];
        };
      ")),
      textOutput("selectedTags"),
      TagPicker(
        onResolveSuggestions = JS("filterSuggestedTags"),
        onEmptyInputFocus = JS("function(tagList) { return testTags.filter(tag => !listContainsTagList(tag, tagList)); }"),
        getTextFromItem = JS("function(item) { return item.text }"),
        pickerSuggestionsProps = list(suggestionsHeaderText = 'Suggested tags', noResultsFoundText = 'No color tags found'),
        itemLimit = 2,
        onChange = JS("function(selection) { Shiny.setInputValue('selectedTags', JSON.stringify(selection)) }")
      )
    ),
    server = function(input, output) {
      output$selectedTags <- renderText({
        if (is.null(input$selectedTags)) {
          "Select up to 2 colors below:"
        } else {
          paste("You have selected:", paste(jsonlite::fromJSON(input$selectedTags)$name, collapse = ", "))
        }
      })
    }
  )
}
