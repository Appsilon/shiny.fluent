library(shiny)
library(shiny.fluent)
library(dplyr)

# ---- details_list_columns ----
details_list_columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
  name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
  key = fieldName)

# ---- deals_table ----
ui <- fluentPage(
  withReact(
    uiOutput("analysis")
  )
)

server <- function(input, output, session) {
  filtered_deals <- reactive({
    filtered_deals <- fluent_sales_deals %>% filter(is_closed > 0)
  })
  
  output$analysis <- renderUI({
    items_list <- if(nrow(filtered_deals()) > 0){
      DetailsList(items = filtered_deals(), columns = details_list_columns)
    } else {
      p("No matching transactions.")
    }
    
    withReact(
      Stack(
        tokens = list(childrenGap = 5),
        Text(variant = "large", "Sales deals details", block = TRUE),
        div(style="max-height: 500px; overflow: auto", items_list)
      )
    )
  })
}

shinyApp(ui, server)