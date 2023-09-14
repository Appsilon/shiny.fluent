dayPickerStrings <- jsonlite::fromJSON('{"months":["January","February","March","April","May","June","July","August","September","October","November","December"],"shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"days":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"shortDays":["S","M","T","W","T","F","S"],"goToToday":"Go to today","weekNumberFormatString":"Week number {0}","prevMonthAriaLabel":"Previous month","nextMonthAriaLabel":"Next month","prevYearAriaLabel":"Previous year","nextYearAriaLabel":"Next year","prevYearRangeAriaLabel":"Previous year range","nextYearRangeAriaLabel":"Next year range","closeButtonAriaLabel":"Close"}')

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
)

updatedOptions <- list(
  list(key = "X", text = "Option X"),
  list(key = "Y", text = "Option Y"),
  list(key = "Z", text = "Option Z")
)

colorCells <- list(
  list(id = "orange", color = "#ca5010"),
  list(id = "cyan", color = "#038387"),
  list(id = "blueMagenta", color = "#8764b8"),
  list(id = "magenta", color = "#881798"),
  list(id = "white", color = "#ffffff")
)

fluentInputsUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Inputs tests"),
    Separator(strong("Toggle visibility")),
    h1("Fluent inputs tests"),
    actionButton(ns("updateInputs"), "Update inputs"),
    actionButton(ns("toggleInputs"), "Toggle visibility"),
    wellPanel(
      uiOutput(ns("panelFluent"))
    )
  )
}

fluentInputsServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    show <- reactiveVal(TRUE)
    observeEvent(input$toggleInputs, {
      show(!show())
    })

    output$panelFluent <- renderUI({
      if (!show()) return(strong("Items are hidden"))
      div(
        h4("Slider"),
        Slider.shinyInput(ns("sliderInput"), value = 0, min = -100, max = 234),
        textOutput(ns("sliderInputValue")),

        h4("TextField"),
        TextField.shinyInput(ns("textField")),
        textOutput(ns("textFieldValue")),

        h4("Checkbox"),
        Checkbox.shinyInput(ns("checkbox"), value = FALSE),
        textOutput(ns("checkboxValue")),

        h4("Rating"),
        Rating.shinyInput(ns("rating"), value = 2),
        textOutput(ns("ratingValue")),

        h4("SpinButton"),
        SpinButton.shinyInput(ns("spinButton"), value = 15, min = 0, max = 50, step = 5),
        textOutput(ns("spinButtonValue")),

        h4("Calendar"),
        Calendar.shinyInput(ns("calendar"), className = "calendar", value = "2020-06-25T12:00:00.000Z", strings = dayPickerStrings),
        textOutput(ns("calendarValue")),

        h4("Calendar - Default value"),
        Calendar.shinyInput(ns("calendarDefault"), className = "calendarDefault", strings = dayPickerStrings),
        textOutput(ns("calendarDefaultValue")),

        h4("Calendar - NULL value"),
        Calendar.shinyInput(ns("calendarNull"), className = "calendarNull", value = NULL, strings = dayPickerStrings),
        textOutput(ns("calendarNullValue")),

        h4("ChoiceGroup"),
        ChoiceGroup.shinyInput(ns("choiceGroup"), value = "B", options = options),
        textOutput(ns("choiceGroupValue")),

        h4("ColorPicker"),
        ColorPicker.shinyInput(ns("colorPicker"), value = "#00FF01"),
        textOutput(ns("colorPickerValue")),

        h4("ComboBox"),
        ComboBox.shinyInput(ns("comboBox"), value = "some text", options = options, allowFreeform = TRUE),
        textOutput(ns("comboBoxValue")),

        h4("Dropdown"),
        Dropdown.shinyInput(ns("dropdown"), value = "A", options = options),
        textOutput(ns("dropdownValue")),

        h4("Dropdown - Multiselect"),
        Dropdown.shinyInput(ns("dropdownMultiselect"), value = c("A", "C"), options = options, multiSelect = TRUE),
        textOutput(ns("dropdownMultiselectValue")),

        h4("DatePicker"),
        DatePicker.shinyInput(ns("datePicker"), value = "2020-06-25T12:00:00.000Z", strings = dayPickerStrings),
        textOutput(ns("datePickerValue")),

        h4("DatePicker - Default value"),
        DatePicker.shinyInput(ns("datePickerDefault"), strings = dayPickerStrings),
        textOutput(ns("datePickerDefaultValue")),

        h4("DatePicker - NULL value"),
        DatePicker.shinyInput(ns("datePickerNull"), value = NULL, strings = dayPickerStrings, placeholder = "I am placeholder!"),
        textOutput(ns("datePickerNullValue")),

        h4("SwatchColorPicker"),
        SwatchColorPicker.shinyInput(ns("swatchColorPicker"), value = "orange", colorCells = colorCells, columnCount = length(colorCells)),
        textOutput(ns("swatchColorPickerValue")),

        h4("Toggle"),
        Toggle.shinyInput(ns("toggle"), value = TRUE),
        textOutput(ns("toggleValue")),

        h4("SearchBox"),
        SearchBox.shinyInput(ns("searchBox"), placeholder = "Search"),
        textOutput(ns("searchBoxValue"))
      )
    })

    observeEvent(input$updateInputs, {
      updateSlider.shinyInput(session, "sliderInput", value = input$sliderInput + 100)
      updateTextField.shinyInput(session, "textField", value = paste0(input$textField, "new text"))
      updateCheckbox.shinyInput(session, "checkbox", value = TRUE)
      updateRating.shinyInput(session, "rating", value = 5)
      updateSpinButton.shinyInput(session, "spinButton", value = 40)
      updateCalendar.shinyInput(session, "calendar", value = "2015-06-25T12:00:00.000Z")
      updateChoiceGroup.shinyInput(session, "choiceGroup", value = "C")
      updateColorPicker.shinyInput(session, "colorPicker", value = "#FFFFFF")
      updateComboBox.shinyInput(session, "comboBox", value = "C")
      updateDropdown.shinyInput(session, "dropdown", value = "C")
      updateDropdown.shinyInput(session, "dropdownMultiselect", options = updatedOptions, value = c("X", "Z"))
      updateCalendar.shinyInput(session, "datePicker", value = "2015-06-25T12:00:00.000Z")
      updateSwatchColorPicker.shinyInput(session, "swatchColorPicker", value = "white")
      updateToggle.shinyInput(session, "toggle", value = FALSE)
      updateSearchBox.shinyInput(session, "searchBox", value = "query")
    })

    ids <- c(
      "sliderInput", "textField", "checkbox", "rating", "spinButton", "calendar", "calendarDefault", "calendarNull", "choiceGroup",
      "colorPicker", "comboBox", "dropdown", "dropdownMultiselect", "datePicker", "datePickerDefault", "datePickerNull", "swatchColorPicker", "toggle", "searchBox"
    )
    wireInputToOutput(ids, input, output)
  })
}
