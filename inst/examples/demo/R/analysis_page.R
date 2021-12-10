filters <- function(i18n) {
  Stack(
    tokens = list(childrenGap = 10),
    HorizontalStack(
      DatePicker.shinyInput("fromDate", value = as.Date("2020/01/01"), label = i18n$t("From date")),
      DatePicker.shinyInput("toDate", value = as.Date("2020/12/31"), label = i18n$t("To date"))
    ),
    Label(i18n$t("Filter by sales reps"), className = "my_class"),
    NormalPeoplePicker.shinyInput(
      "selectedPeople",
      options = fluentPeople,
      pickerSuggestionsProps = list(
        suggestionsHeaderText = "Matching people",
        mostRecentlyUsedHeaderText = "Sales reps",
        noResultsFoundText = "No results found",
        showRemoveButtons = TRUE
      )
    ),
    Slider.shinyInput(
      "slider",
      value = 0,
      min = 0,
      max = 1000000,
      step = 100000,
      label = i18n$t("Minimum amount"),
      valueFormat = JS("function(x) { return '$' + x}"),
      snapToStep = TRUE
    ),
    Toggle.shinyInput("closedOnly", value = TRUE, label = i18n$t("Include closed deals only?"))
  )
}

analysisPage <- function(i18n) {
  tagList(
    shiny.i18n::usei18n(i18n),
    makePage(
      i18n$t("Sales representatives"),
      i18n$t("Best performing reps"),
      div(
        HorizontalStack(
          makeCard(i18n$t("Filters"), filters(i18n), size = 4, style = "max-height: 320px"),
          makeCard(i18n$t("Deals count"), plotlyOutput("plot"), size = 8, style = "max-height: 320px")
        ),
        uiOutput("filteredSalesReps")
      )
    )
  )
}
