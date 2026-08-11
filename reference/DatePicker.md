# DatePicker

Picking a date can be tough without context. A date picker
(`DatePicker`) offers a drop-down control that’s optimized for picking a
single date from a calendar view where contextual information like the
day of the week or fullness of the calendar is important. You can modify
the calendar to provide additional context or to limit available dates.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/DatePicker).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
DatePicker(...)

DatePicker.shinyInput(inputId, ..., value = defaultValue)

updateDatePicker.shinyInput(
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

- **allFocusable** `boolean`  
  Allows all elements to be focused, including disabled ones

- **allowTextInput** `boolean`  
  Whether the DatePicker allows input a date string directly or not

- **ariaLabel** `string`  
  Aria Label for TextField of the DatePicker for screen reader users.

- **borderless** `boolean`  
  Determines if DatePicker has a border.

- **calendarAs** `IComponentAs<ICalendarProps>`  
  Custom Calendar to be used for date picking

- **calendarProps** `ICalendarProps`  
  Pass calendar props to calendar component

- **calloutProps** `ICalloutProps`  
  Pass callout props to callout component

- **className** `string`  
  Optional Classname for datepicker root element .

- **componentRef** `IRefObject<IDatePicker>`  
  Optional callback to access the IDatePicker interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **dateTimeFormatter** `ICalendarFormatDateCallbacks`  
  Apply additional formating to dates, for example localized date
  formatting.

- **disableAutoFocus** `boolean`  
  Whether the DatePicker should open automatically when the control is
  focused

- **disabled** `boolean`  
  Disabled state of the DatePicker.

- **firstDayOfWeek** `DayOfWeek`  
  The first day of the week for your locale.

- **firstWeekOfYear** `FirstWeekOfYear`  
  Defines when the first week of the year should start,
  FirstWeekOfYear.FirstDay, FirstWeekOfYear.FirstFullWeek or
  FirstWeekOfYear.FirstFourDayWeek are the possible values

- **formatDate** `(date?: Date) => string`  
  Optional method to format the chosen date to a string to display in
  the DatePicker

- **highlightCurrentMonth** `boolean`  
  Whether the month picker should highlight the current month

- **highlightSelectedMonth** `boolean`  
  Whether the month picker should highlight the selected month

- **initialPickerDate** `Date`  
  The initially highlighted date in the calendar picker

- **isMonthPickerVisible** `boolean`  
  Whether the month picker is shown beside the day picker or hidden.

- **isRequired** `boolean`  
  Whether the DatePicker is a required field or not

- **label** `string`  
  Label for the DatePicker

- **maxDate** `Date`  
  The maximum allowable date.

- **minDate** `Date`  
  The minimum allowable date.

- **onAfterMenuDismiss** `() => void`  
  Callback that runs after DatePicker's menu (Calendar) is closed

- **onSelectDate** `(date: Date | null | undefined) => void`  
  Callback issued when a date is selected

- **parseDateFromString** `(dateStr: string) => Date | null`  
  Optional method to parse the text input value to date, it is only
  useful when allowTextInput is set to true

- **pickerAriaLabel** `string`  
  Aria label for date picker popup for screen reader users.

- **placeholder** `string`  
  Placeholder text for the DatePicker

- **showCloseButton** `boolean`  
  Whether the CalendarDay close button should be shown or not.

- **showGoToToday** `boolean`  
  Whether the "Go to today" link should be shown or not

- **showMonthPickerAsOverlay** `boolean`  
  Show month picker on top of date picker when visible.

- **showWeekNumbers** `boolean`  
  Whether the calendar should show the week number (weeks 1 to 53)
  before each week row

- **strings** `IDatePickerStrings`  
  Localized strings to use in the DatePicker

- **styles**
  `IStyleFunctionOrObject<IDatePickerStyleProps, IDatePickerStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **tabIndex** `number`  
  The tabIndex of the TextField

- **textField** `ITextFieldProps`  
  Pass textField props to textField component. Prop name is "textField"
  for compatiblity with upcoming slots work.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **today** `Date`  
  Value of today. If null, current time in client machine will be used.

- **underlined** `boolean`  
  Whether or not the Textfield of the DatePicker is underlined.

- **value** `Date`  
  Default value of the DatePicker, if any

## Best practices

### Layout

- Use the control the way it’s designed and built. Don’t break it apart.

### Content

- The control provides the date in a specific format. If the date can be
  entered in an input field, provide helper text in the appropriate
  format.

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DatePicker.shinyInput(ns("date"), value = "2020-06-25T22:00:00.000Z"),
    textOutput(ns("dateValue")),
    h3("If `value` is missing, default to system date"),
    DatePicker.shinyInput(ns("date2")),
    textOutput(ns("dateDefault")),
    h3("If `value` is NULL, return NULL"),
    DatePicker.shinyInput(ns("date3"), value = NULL, placeholder = "I am placeholder!"),
    textOutput(ns("dateNull"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$dateValue <- renderText({
      sprintf("Value: %s", input$date)
    })
    output$dateDefault <- renderText({
      sprintf("Value: %s", input$date2)
    })
    output$dateNull <- renderText({
      sprintf("Value: %s", deparse(input$date3))
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

# Supplying custom strings for DatePicker
ui <- function(id) {
  fluentPage(
    DatePicker.shinyInput(
      "date",
      value = Sys.Date(),
      strings = list(
        months = list(
          "January", "February", "March", "April",
          "May", "June", "July", "August",
          "September", "October", "November", "December"
        ),
        shortMonths = list(
          "Jan", "Feb", "Mar", "Apr", "May", "Jun",
          "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
        ),
        days = list(
          "Sunday", "Monday", "Tuesday", "Wednesday",
          "Thursday", "Friday", "Saturday"
        ),
        shortDays = list("S", "M", "T", "W", "T", "F", "S"),
        goToToday = "Go to today",
        prevMonthAriaLabel = "Go to previous month",
        nextMonthAriaLabel = "Go to next month",
        prevYearAriaLabel = "Go to previous year",
        nextYearAriaLabel = "Go to next year"
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
