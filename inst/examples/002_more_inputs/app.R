library(shiny.fluent)

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

toString <- function(x) capture.output(dput(x))

ui <- fluidPage(
  h1("More React inputs"),
  actionButton("updateInputs", "Update"),
  actionButton("toggle", "Toggle visibility"),
  uiOutput("main")
)

server <- function(input, output, session) {
  show <- reactiveVal(TRUE)
  observeEvent(input$toggle, {
    show(!show())
  })

  output$main <- renderUI({
    if (show()) {
      div(
        h4("Checkbox"),
        Checkbox.shinyInput("value1", value = FALSE),
        textOutput("text1"),
        h4("Rating"),
        Rating.shinyInput("value2", value = 2),
        textOutput("text2"),
        h4("Slider"),
        Slider.shinyInput("value3", value = 42, min = -100, max = 100),
        textOutput("text3"),
        h4("TextField"),
        TextField.shinyInput("value4"),
        textOutput("text4"),
        h4("SpinButton"),
        SpinButton.shinyInput("value5", value = 15, min = 0, max = 50, step = 5),
        textOutput("text5"),
        h4("Calendar"),
        Calendar.shinyInput("value6", value = "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
        textOutput("text6"),
        h4("ChoiceGroup"),
        ChoiceGroup.shinyInput("value7", value = "B", options = options),
        textOutput("text7"),
        h4("ColorPicker"),
        ColorPicker.shinyInput("value8", value = "#00FF01"),
        textOutput("text8"),
        h4("ComboBox"),
        ComboBox.shinyInput("value9", value = list(text = "some text"), options = options, allowFreeform = TRUE),
        textOutput("text9"),
        h4("Dropdown"),
        Dropdown.shinyInput("value10", value = "A", options = options),
        textOutput("text10"),
        h4("DatePicker"),
        DatePicker.shinyInput("value11", value = "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
        textOutput("text11"),
        h4("SwatchColorPicker"),
        SwatchColorPicker.shinyInput("value12", value = "orange", colorCells = colorCells, columnCount = length(colorCells)),
        textOutput("text12"),
        h4("Toggle"),
        Toggle.shinyInput("value13", value = TRUE),
        textOutput("text13"),
        h4("SearchBox"),
        SearchBox.shinyInput("value14", placeholder = "Search"),
        textOutput("text14"),
      )
    } else {
      NULL
    }
  })

  lapply(1:14, function(i) {
    inputName <- paste0("value", i)
    outputName <- paste0("text", i)
    output[[outputName]] <- renderText({
      paste("Value:", toString(input[[inputName]]))
    })
  })

  observeEvent(input$updateInputs, {
    updateCheckbox.shinyInput(session, "value1", value = !input$value1)
    updateRating.shinyInput(session, "value2", value = 6 - input$value2)
    updateSlider.shinyInput(session, "value3", value = input$value3 + 12)
    updateTextField.shinyInput(session, "value4", value = paste(input$value4, "new text"))
    updateSpinButton.shinyInput(session, "value5", value = input$value5 + 1)
    updateCalendar.shinyInput(session, "value6", value = "2015-06-25T22:00:00.000Z")
    updateChoiceGroup.shinyInput(session, "value7", value = "C")
    updateColorPicker.shinyInput(session, "value8", value = "#FFFFFF")
    updateComboBox.shinyInput(session, "value9", value = options[[2]])
    updateDropdown.shinyInput(session, "value10", value = "C")
    updateCalendar.shinyInput(session, "value11", value = "2015-06-25T22:00:00.000Z")
    updateSwatchColorPicker.shinyInput(session, "value12", value = "white")
    updateToggle.shinyInput(session, "value13", value = !input$value13)
    updateSearchBox.shinyInput(session, "value14", value = "query")
  })
}

shinyApp(ui, server)
