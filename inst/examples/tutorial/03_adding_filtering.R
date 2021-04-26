library(shiny)
library(shiny.fluent)
library(dplyr)

# ---- 03_filters_ui
filters <- tagList(
  DatePicker.shinyInput("fromDate", value = as.Date('2020/01/01'), label = "From date"),
  DatePicker.shinyInput("toDate", value = as.Date('2020/12/31'), label = "To date")
)
# ----

details_list_columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
  name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
  key = fieldName)

# ---- 03_ui
ui <- fluentPage(
  filters,
  uiOutput("analysis")
)
# ----

# ---- 03_filters_server
server <- function(input, output, session) {
  filtered_deals <- reactive({
    req(input$fromDate)
    filtered_deals <- fluentSalesDeals %>% filter(
      date >= input$fromDate,
      date <= input$toDate,
      is_closed > 0
    )
  })
# ----
  output$analysis <- renderUI({
    items_list <- if(nrow(filtered_deals()) > 0){
      DetailsList(items = filtered_deals(), columns = details_list_columns)
    } else {
      p("No matching transactions.")
    }

    Stack(
      tokens = list(childrenGap = 5),
      Text(variant = "large", "Sales deals details", block = TRUE),
      div(style="max-height: 500px; overflow: auto", items_list)
    )
  })
}

shinyApp(ui, server)
