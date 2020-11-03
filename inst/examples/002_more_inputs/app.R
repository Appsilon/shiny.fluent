library(shiny)
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
);

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
      withReact(
        div(
          h4("Checkbox"),
          Checkbox("input1", FALSE),
          textOutput("textOutput1"),
          h4("Rating"),
          Rating("input2", 2),
          textOutput("textOutput2"),
          h4("Slider"),
          Slider("input3", 42, min = -100, max = 100),
          textOutput("textOutput3"),
          h4("TextField"),
          TextField("input4"),
          textOutput("textOutput4"),
          h4("SpinButton"),
          SpinButton("input5", 15, min = 0, max = 50, step = 5),
          textOutput("textOutput5"),
          h4("Calendar"),
          Calendar("input6", "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
          textOutput("textOutput6"),
          h4("ChoiceGroup"),
          ChoiceGroup("input7", "B", options = options),
          textOutput("textOutput7"),
          h4("ColorPicker"),
          ColorPicker("input8", "#00FF01"),
          textOutput("textOutput8"),
          h4("ComboBox"),
          ComboBox("input9", "some text", options = options, allowFreeform = TRUE),
          textOutput("textOutput9"),
          h4("Dropdown"),
          Dropdown("input10", "A", options = options),
          textOutput("textOutput10"),
          h4("DatePicker"),
          DatePicker("input11", "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
          textOutput("textOutput11"),
          h4("SwatchColorPicker"),
          SwatchColorPicker("input12", "orange", colorCells = colorCells, columnCount = length(colorCells)),
          textOutput("textOutput12"),
          h4("Toggle"),
          Toggle("input13", TRUE),
          textOutput("textOutput13"),
          h4("SearchBox"),
          SearchBox("input14", placeholder = "Search"),
          textOutput("textOutput14"),
        )
      )
    } else {
      NULL
    }
  })

  lapply(c(1:8, 10:14), function(i) {
    inputName <- paste0("input", i)
    outputName <- paste0("textOutput", i)
    output[[outputName]] <- renderText({
      sprintf("Value: %s", input[[inputName]])
    })
  })
  output$textOutput9 <- renderText({
    v <- input$input9
    sprintf("Value: %s", if (is.character(v)) v else v$key)
  })

  observeEvent(input$updateInputs, {
    shiny.fluent::updateCheckbox(session, "input1", value = !input$input1)
    shiny.fluent::updateRating(session, "input2", value = 6 - input$input2)
    shiny.fluent::updateSlider(session, "input3", value = input$input3 + 12)
    updateTextField(session, "input4", value = paste(input$input4, "new text"))
    updateSpinButton(session, "input5", value = input$input5 + 1)
    updateCalendar(session, "input6", value = "2015-06-25T22:00:00.000Z")
    updateChoiceGroup(session, "input7", value = "C")
    updateColorPicker(session, "input8", value = "#FFFFFF")
    updateComboBox(session, "input9", value = options[[2]])
    updateDropdown(session, "input10", value = "C")
    updateCalendar(session, "input11", value = "2015-06-25T22:00:00.000Z")
    updateSwatchColorPicker(session, "input12", value = "white")
    updateToggle(session, "input13", value = !input$input13)
    updateSearchBox(session, "input14", value = "query")
  })
}

shinyApp(ui, server)
