# Calendar

The calendar control lets people select and view a single date or a
range of dates in their calendar. It’s made up of 3 separate views: the
month view, year view, and decade view.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Calendar).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Calendar(...)

Calendar.shinyInput(inputId, ..., value = shiny.react::JS("new Date()"))

updateCalendar.shinyInput(
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
  Allows all dates and buttons to be focused, including disabled ones

- **autoNavigateOnSelection** `boolean`  
  Whether the month view should automatically navigate to the next or
  previous date range depending on the selected date. If this property
  is set to true and the currently displayed month is March 2017, if the
  user clicks on a day outside the month, i.e., April 1st, the picker
  will automatically navigate to the month of April.

- **className** `string`  
  Optional class name to add to the root element.

- **componentRef** `IRefObject<ICalendar>`  
  Optional callback to access the ICalendar interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **dateRangeType** `DateRangeType`  
  The date range type indicating how many days should be selected as the
  user selects days

- **dateTimeFormatter** `ICalendarFormatDateCallbacks`  
  Apply additional formating to dates, for example localized date
  formatting.

- **firstDayOfWeek** `DayOfWeek`  
  The first day of the week for your locale.

- **firstWeekOfYear** `FirstWeekOfYear`  
  Defines when the first week of the year should start,
  FirstWeekOfYear.FirstDay, FirstWeekOfYear.FirstFullWeek or
  FirstWeekOfYear.FirstFourDayWeek are the possible values

- **highlightCurrentMonth** `boolean`  
  Whether the month picker should highlight the current month

- **highlightSelectedMonth** `boolean`  
  Whether the month picker should highlight the selected month

- **isDayPickerVisible** `boolean`  
  Whether the day picker is shown beside the month picker or hidden.

- **isMonthPickerVisible** `boolean`  
  Whether the month picker is shown beside the day picker or hidden.

- **maxDate** `Date`  
  If set the Calendar will not allow navigation to or selection of a
  date later than this value.

- **minDate** `Date`  
  If set the Calendar will not allow navigation to or selection of a
  date earlier than this value.

- **navigationIcons** `ICalendarIconStrings`  
  Customize navigation icons using ICalendarIconStrings

- **onDismiss** `() => void`  
  Callback issued when calendar is closed

- **onSelectDate**
  `(date: Date, selectedDateRangeArray?: Date[]) => void`  
  Callback issued when a date is selected

- **restrictedDates** `Date[]`  
  If set the Calendar will not allow selection of dates in this array.

- **selectDateOnClick** `boolean`  
  When clicking on "Today", select the date and close the calendar.

- **shouldFocusOnMount** `boolean`  
  This property has been removed at 0.80.0 in place of the `focus`
  method, to be removed \\ 1.0.0.

- **showCloseButton** `boolean`  
  Whether the close button should be shown or not

- **showGoToToday** `boolean`  
  Whether the "Go to today" link should be shown or not

- **showMonthPickerAsOverlay** `boolean`  
  Show month picker on top of date picker when visible.

- **showSixWeeksByDefault** `boolean`  
  Whether the calendar should show 6 weeks by default.

- **showWeekNumbers** `boolean`  
  Whether the calendar should show the week number (weeks 1 to 53)
  before each week row

- **strings** `ICalendarStrings | null`  
  Localized strings to use in the Calendar

- **today** `Date`  
  Value of today. If null, current time in client machine will be used.

- **value** `Date`  
  Default value of the Calendar, if any

- **workWeekDays** `DayOfWeek[]`  
  The days that are selectable when dateRangeType is WorkWeek. If
  dateRangeType is not WorkWeek this property does nothing.

- **yearPickerHidden** `boolean`  
  Whether the year picker is enabled

## Best practices

### Layout

- Don’t break the control apart.

- Include an up and down arrow for navigating between time ranges and a
  chevron to make the calendar collapsible.

### Content

- Use the following format for dates: month, day, year, as in July
  31, 2016. When space is limited, use numbers and slashes for dates if
  the code supports that format and automatically displays the
  appropriate date format for different locales. For example, 2/16/19.

- Don't use ordinal numbers (such as 1st, 12th, or 23rd) to indicate a
  date.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    Calendar.shinyInput(ns("calendar"), value = "2020-06-25T22:00:00.000Z"),
    textOutput(ns("calendarValue")),
    h3("If `value` is missing, default to system date"),
    Calendar.shinyInput(ns("calendar2")),
    textOutput(ns("calendarDefault")),
    h3("If `value` is NULL, also default to system date"),
    Calendar.shinyInput(ns("calendar3"), value = NULL),
    textOutput(ns("calendarNull"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$calendarValue <- renderText({
      sprintf("Value: %s", input$calendar)
    })
    output$calendarDefault <- renderText({
      sprintf("Value: %s", input$calendar2)
    })
    output$calendarNull <- renderText({
      sprintf("Value: %s", input$calendar3)
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
