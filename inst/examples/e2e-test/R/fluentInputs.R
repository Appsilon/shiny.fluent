dayPickerStrings <- jsonlite::fromJSON('{"months":["January","February","March","April","May","June","July","August","September","October","November","December"],"shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"days":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"shortDays":["S","M","T","W","T","F","S"],"goToToday":"Go to today","weekNumberFormatString":"Week number {0}","prevMonthAriaLabel":"Previous month","nextMonthAriaLabel":"Next month","prevYearAriaLabel":"Previous year","nextYearAriaLabel":"Next year","prevYearRangeAriaLabel":"Previous year range","nextYearRangeAriaLabel":"Next year range","closeButtonAriaLabel":"Close"}')

options <- list(
  list(key = "A", text = "Option A"),
  list(key = "B", text = "Option B"),
  list(key = "C", text = "Option C")
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
        Checkbox.shinyInput(ns("checkbox"), value = isolate(isTRUE(input$checkbox))),
        textOutput(ns("checkboxValue")),
        
        h4("Rating"),
        Rating.shinyInput(ns("rating"), value = 2),
        textOutput(ns("ratingValue")),
        
        h4("SpinButton"),
        SpinButton.shinyInput(ns("spinButton"), value = 15, min = 0, max = 50, step = 5),
        textOutput(ns("spinButtonValue")),
        
        h4("Calendar"),
        Calendar.shinyInput(ns("calendar"), value = "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
        textOutput(ns("calendarValue")),
        
        h4("ChoiceGroup"),
        ChoiceGroup.shinyInput(ns("choiceGroup"), value = "B", options = options),
        textOutput(ns("choiceGroupValue")),
        
        h4("ColorPicker"),
        ColorPicker.shinyInput(ns("colorPicker"), value = "#00FF01"),
        textOutput(ns("colorPickerValue")),
        
        h4("ComboBox"),
        ComboBox.shinyInput(ns("comboBox"), value = list(text = "some text"), options = options, allowFreeform = TRUE),
        textOutput(ns("comboBoxValue")),
        
        h4("Dropdown"),
        Dropdown.shinyInput(ns("dropdown"), value = "A", options = options),
        textOutput(ns("dropdownValue")),
        
        h4("DatePicker"),
        DatePicker.shinyInput(ns("datePicker"), value = "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
        textOutput(ns("datePickerValue")),
        
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
      updateSlider.shinyInput(session, ns("sliderInput"), value = input$sliderInput + 100)
      updateTextField.shinyInput(session, ns("textField"), value = paste(input$textField, "new text"))
      updateCheckbox.shinyInput(session, ns("checkbox"), value = !input$checkbox)
      updateRating.shinyInput(session, ns("rating"), value = 6 - input$rating)
      updateSpinButton.shinyInput(session, ns("spinButton"), value = input$spinButton + 1)
      updateCalendar.shinyInput(session, ns("calendar"), value = "2015-06-25T22:00:00.000Z")
      updateChoiceGroup.shinyInput(session, ns("choiceGroup"), value = "C")
      updateColorPicker.shinyInput(session, ns("colorPicker"), value = "#FFFFFF")
      updateComboBox.shinyInput(session, ns("comboBox"), value = options[[2]])
      updateDropdown.shinyInput(session, ns("dropdown"), value = "C")
      updateCalendar.shinyInput(session, ns("datePicker"), value = "2015-06-25T22:00:00.000Z")
      updateSwatchColorPicker.shinyInput(session, ns("swatchColorPicker"), value = "white")
      updateToggle.shinyInput(session, ns("toggle"), value = !input$toggle)
      updateSearchBox.shinyInput(session, ns("searchBox"), value = "query")
    })
    
    ids <- c(
      "sliderInput", "textField", "checkbox", "rating", "spinButton", "calendar", "choiceGroup",
      "colorPicker", "comboBox", "dropdown", "datePicker", "swatchColorPicker", "toggle", "searchBox"
    )
    wireInputToOutput(ids, input, output)
  })
}
