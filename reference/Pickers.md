# Pickers

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Pickers).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

Pickers are used to select one or more items, such as tags or files,
from a large list.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/pickers).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
BasePickerListBelow(...)

TagPicker(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  ClassName for the picker.

- **componentRef** `IRefObject<IBasePicker<T>>`  
  Optional callback to access the IBasePicker interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **createGenericItem**
  `(input: string, ValidationState: ValidationState) => ISuggestionModel<T> | T`  
  Function that specifies how arbitrary text entered into the well is
  handled.

- **defaultSelectedItems** `T[]`  
  Initial items that have already been selected and should appear in the
  people picker.

- **disabled** `boolean`  
  Flag for disabling the picker.

- **enableSelectedSuggestionAlert** `boolean`  
  Adds an additional alert for the currently selected suggestion. This
  prop should be set to true for IE11 and below, as it enables proper
  screen reader behavior for each suggestion (since
  aria-activedescendant does not work with IE11). It should not be set
  for modern browsers (Edge, Chrome).

- **getTextFromItem** `(item: T, currentValue?: string) => string`  
  A callback to get text from an item. Used to autofill text in the
  pickers.

- **inputProps** `IInputProps`  
  AutoFill input native props

- **itemLimit** `number`  
  Restrict the amount of selectable items.

- **onBlur** `React.FocusEventHandler<HTMLInputElement | Autofill>`  
  A callback for when the user moves the focus away from the picker

- **onChange** `(items?: T[]) => void`  
  A callback for when the selected list of items changes.

- **onDismiss** `(ev?: any, selectedItem?: T) => boolean | void`  
  A callback to override the default behavior of adding the selected
  suggestion on dismiss. If it returns true or nothing, the selected
  item will be added on dismiss. If false, the selected item will not be
  added on dismiss.

- **onEmptyInputFocus**
  `(selectedItems?: T[]) => T[] | PromiseLike<T[]>`  
  A callback for what should happen when a user clicks within the input
  area.

- **onEmptyResolveSuggestions**
  `(selectedItems?: T[]) => T[] | PromiseLike<T[]>`  
  A callback for what should happen when suggestions are shown without
  input provided. Returns the already selected items so the resolver can
  filter them out. If used in conjunction with resolveDelay this will
  only kick off after the delay throttle.

- **onFocus** `React.FocusEventHandler<HTMLInputElement | Autofill>`  
  A callback for when the user put focus on the picker

- **onGetMoreResults**
  `(filter: string, selectedItems?: T[]) => T[] | PromiseLike<T[]>`  
  A callback that gets the rest of the results when a user clicks get
  more results.

- **onInputChange** `(input: string) => string`  
  A callback used to modify the input string.

- **onItemSelected** `(selectedItem?: T) => T | PromiseLike<T> | null`  
  A callback to process a selection after the user selects something
  from the picker. If the callback returns null, the item will not be
  added to the picker.

- **onRemoveSuggestion** `(item: T) => void`  
  A callback for when an item is removed from the suggestion list

- **onRenderItem** `(props: IPickerItemProps<T>) => JSX.Element`  
  Function that specifies how the selected item will appear.

- **onRenderSuggestionsItem**
  `(props: T, itemProps: ISuggestionItemProps<T>) => JSX.Element`  
  Function that specifies how an individual suggestion item will appear.

- **onResolveSuggestions**
  `(filter: string, selectedItems?: T[]) => T[] | PromiseLike<T[]>`  
  A callback for what should happen when a person types text into the
  input. Returns the already selected items so the resolver can filter
  them out. If used in conjunction with resolveDelay this will only kick
  off after the delay throttle.

- **onValidateInput** `(input: string) => ValidationState`  
  A function used to validate if raw text entered into the well can be
  added into the selected items list

- **pickerCalloutProps** `ICalloutProps`  
  The properties that will get passed to the Callout component.

- **pickerSuggestionsProps** `IBasePickerSuggestionsProps`  
  The properties that will get passed to the Suggestions component.

- **removeButtonAriaLabel** `string`  
  Aria label for the "X" button in the selected item component.

- **resolveDelay** `number`  
  The delay time in ms before resolving suggestions, which is kicked off
  when input has been changed. e.g. If a second input change happens
  within the resolveDelay time, the timer will start over. Only until
  after the timer completes will onResolveSuggestions be called.

- **searchingText** `((props: { input: string; }) => string) | string`  
  The text to display while searching for more results in a limited
  suggestions list

- **selectedItems** `T[]`  
  The items that the base picker should currently display as selected.
  If this is provided then the picker will act as a controlled
  component.

- **styles**
  `IStyleFunctionOrObject<IBasePickerStyleProps, IBasePickerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by styled() function.

- **"aria-label"** `string`  
  Screen reader label to apply to an input element.

- **defaultVisibleValue** `string`  
  The default value to be visible when the autofill first created. This
  is different than placeholder text because the placeholder text will
  disappear and re-appear. This text persists until deleted or changed.

- **componentRef** `IRefObject<IPickerItem>`  
  Optional callback to access the IPickerItem interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **index** `number`  
  Index number of the item in the array of picked items.

- **item** `T`  
  The item of Type T (Persona, Tag, or any other custom item provided).

- **key** `string | number`  
  Unique key for each picked item.

- **onItemChange** `(item: T, index: number) => void`  
  Internal Use only, gives a callback to the renderer to call when an
  item has changed. This allows the base picker to keep track of changes
  in the items.

- **onRemoveItem** `() => void`  
  Callback issued when the item is removed from the array of picked
  items.

- **removeButtonAriaLabel** `string`  
  Aria-label for the picked item remove button.

- **selected** `boolean`  
  Whether the picked item is selected or not.

- **className** `string`  
  Optional className for the root element of the suggestion item.

- **componentRef** `IRefObject<ISuggestionsItem>`  
  Optional callback to access the ISuggestionItem interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **id** `string`  
  Unique id of the suggested item.

- **isSelectedOverride** `boolean`  
  An override for the 'selected' property of the SuggestionModel.

- **onClick** `(ev: React.MouseEvent<HTMLButtonElement>) => void`  
  Callback for when the user clicks on the suggestion.

- **onRemoveItem** `(ev: React.MouseEvent<HTMLButtonElement>) => void`  
  Callback for when the item is removed from the array of suggested
  items.

- **removeButtonAriaLabel** `string`  
  The ARIA label for the button to remove the suggestion from the list.

- **RenderSuggestion**
  `(item: T, suggestionItemProps: ISuggestionItemProps<T>) => JSX.Element`  
  Optional renderer to override the default one for each type of picker.

- **showRemoveButton** `boolean`  
  Whether the remove button should be rendered or not.

- **styles**
  `IStyleFunctionOrObject<ISuggestionsItemStyleProps, ISuggestionsItemStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **suggestionModel** `ISuggestionModel<T>`  
  Individual suggestion object containing its properties.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **className** `string`  
  The CSS className of the suggestions root.

- **componentRef** `IRefObject<ISuggestions<T>>`  
  Optional callback to access the ISuggestions interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **createGenericItem** `() => void`  
  The callback that should be called when the user attempts to use the
  input text as as item

- **forceResolveText** `string`  
  The text that appears indicating to the use to force resolve the input

- **isLoading** `boolean`  
  Used to indicate whether or not the suggestions are loading.

- **isMostRecentlyUsedVisible** `boolean`  
  Indicates if a short list of recent suggestions should be shown.

- **isResultsFooterVisible** `boolean`  
  Indicates if the text in resultsFooter or resultsFooterFull should be
  shown at the end of the suggestion list.

- **isSearching** `boolean`  
  Used to indicate whether or not the component is searching for more
  results.

- **loadingText** `string`  
  The text to display while the results are loading.

- **moreSuggestionsAvailable** `boolean`  
  Used to indicate whether or not the user can request more suggestions.
  Dictates whether or not the searchForMore button is displayed.

- **mostRecentlyUsedHeaderText** `string`  
  The text that should appear at the top of the most recently used box.

- **noResultsFoundText** `string`  
  The text that should appear if no results are found when searching.

- **onGetMoreResults** `() => void`  
  The callback that should be called when the user attempts to get more
  results

- **onRenderNoResultFound** `IRenderFunction<void>`  
  How the "no result found" should look in the suggestion list.

- **onRenderSuggestion**
  `(props: T, suggestionItemProps: ISuggestionItemProps<T>) => JSX.Element`  
  How the suggestion should look in the suggestion list.

- **onSuggestionClick**
  `(ev?: React.MouseEvent<HTMLElement>, item?: any, index?: number) => void`  
  What should occur when a suggestion is clicked

- **onSuggestionRemove**
  `(ev?: React.MouseEvent<HTMLElement>, item?: T | IPersonaProps, index?: number) => void`  
  Function to fire when one of the optional remove buttons on a
  suggestion is clicked.

TODO (adjective-object) remove IPersonaprops before the next major
version bump

- **refocusSuggestions** `(keyCode: KeyCodes) => void`  
  A function that resets focus to the expected item in the suggestion
  list

- **removeSuggestionAriaLabel** `string`  
  An ARIA label to use for the buttons to remove individual suggestions.

- **resultsFooter** `(props: ISuggestionsProps<T>) => JSX.Element`  
  A renderer that adds an element at the end of the suggestions list it
  has fewer items than resultsMaximumNumber.

- **resultsFooterFull** `(props: ISuggestionsProps<T>) => JSX.Element`  
  A renderer that adds an element at the end of the suggestions list it
  has more items than resultsMaximumNumber.

- **resultsMaximumNumber** `number`  
  Maximum number of suggestions to show in the full suggestion list.

- **searchErrorText** `string`  
  The text that should appear if there is a search error.

- **searchForMoreText** `string`  
  The text that appears indicating to the user that they can search for
  more results.

- **searchingText** `string`  
  The text to display while searching for more results in a limited
  suggestions list.

- **showForceResolve** `() => boolean`  
  The callback that should be called to see if the force resolve command
  should be shown

- **showRemoveButtons** `boolean`  
  Indicates whether to show a button with each suggestion to remove that
  suggestion.

- **styles** `IStyleFunctionOrObject<any, any>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **suggestions** `ISuggestionModel<T>[]`  
  The list of Suggestions that will be displayed

- **suggestionsAvailableAlertText** `string`  
  Screen reader message to read when there are suggestions available.

- **suggestionsClassName** `string`  
  The CSS className of the suggestions list

- **suggestionsContainerAriaLabel** `string`  
  An ARIA label for the container that is the parent of the suggestions.

- **suggestionsHeaderText** `string`  
  The text that appears at the top of the suggestions list.

- **suggestionsItemClassName** `string`  
  The className of the suggestion item.

- **suggestionsListId** `string`  
  The string that will be used as the suggestionsListId. Will be used by
  the BasePicker to keep track of the list for aria.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

## Best practices

### Layout

- Use a picker to quickly search for a few tags or files.

- Use a picker to manage a group of tags or files.

## Examples

``` r
library(shiny)
library(shiny.fluent)

makeScript <- function(js) {
  htmltools::htmlDependency(
    name = "TagPickerExample",
    version = "0", # Not used.
    src = c(href = ""), # Not used.
    head = paste0("<script>", js, "</script>")
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    makeScript("
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
    "),
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
      onChange = JS(paste0(
        "function(selection) {",
        "  Shiny.setInputValue('", ns("selectedTags") ,"', JSON.stringify(selection));",
        "}"
      ))
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
```
