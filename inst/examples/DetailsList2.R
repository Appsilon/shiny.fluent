
# Example 2
library(shiny)
library(shiny.fluent)

# Custom columns text alignment and formatting
items <- list(
  list(
    key = "1",
    name = "Mark",
    number = "2"
  ),
  list(
    key = "2",
    name = "Josh",
    number = "1"
  )
)

columns <- list(
  list(
    key = "name",
    fieldName = "name",
    name = "Name"
  ),
  list(
    key = "number",
    fieldName = "number",
    name = "Number"
  )
)

ui <- function(id) {
  DetailsList(
    items = items,
    columns = columns,
    onRenderItemColumn = JS("(item, index, column) => {
      const fieldContent = item[column.fieldName]
      switch (column.key) {
        case 'name':
          return React.createElement(
            'span',
            {
              style: { textAlign: 'right', width: '100%', display: 'block' }
            },
            fieldContent
          );
        case 'number':
          return React.createElement(
            'span',
            {
              style: { textAlign: 'left', width: '100%', display: 'block' }
            },
            `%${fieldContent}`
          );
        default:
          return React.createElement('span', null, fieldContent);
      }
    }")
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
