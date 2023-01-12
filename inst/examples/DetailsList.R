library(shiny)
library(shiny.fluent)

items <- list(
  list(key = "1", name = "Mark", surname = "Swanson"),
  list(key = "2", name = "Josh", surname = "Johnson")
)

columns <- list(
  list(key = "name", fieldName = "name", name = "Name"),
  list(key = "surname", fieldName = "surname", name = "Surname")
)


ui <- function(id) {
  ns <- NS(id)
  DetailsList(items = items, columns = columns)
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

if (interactive()) {
  # Embedding icons in DetailsList
  style <- list(fontSize = 50, margin = 10)
  items <- list(
    list(key = "1", name = "Mark", surname = "Swanson", icon = FontIcon(iconName = "CompassNW", style = style)),
    list(key = "2", name = "Josh", surname = "Johnson", icon = Icon(iconName = "CompassNW", style = style))
  )

  columns <- list(
    list(key = "name", fieldName = "name", name = "Name"),
    list(key = "surname", fieldName = "surname", name = "Surname"),
    list(key = "icon", fieldName = "icon", name = "Icon")
  )

  shinyApp(
    ui = DetailsList(items = items, columns = columns),
    server = function(input, output) {}
  )
}

if (interactive()) {
  # Selecting rows in DetailsList
  CustomComponents <- tags$script(HTML("(function() {
    const React = jsmodule['react'];
    const Fluent = jsmodule['@fluentui/react'];
    const Shiny = jsmodule['@/shiny'];
    const CustomComponents = jsmodule['CustomComponents'] = {};

    function useSelection(inputId) {
      const selection = React.useRef(new Fluent.Selection({
        onSelectionChanged() {
          const value = this.getSelectedIndices().map(i => i + 1); // R uses 1-based indexing.
          Shiny.setInputValue(inputId, value);
        }
      }));
      return selection.current;
    }

    CustomComponents.DetailsList = function DetailsList({ inputId, ...rest }) {
      const selection = useSelection(inputId);
      return React.createElement(Fluent.DetailsList, { selection, ...rest });
    }
  })()"))

  DetailsList.shinyInput <- function(inputId, ...) {
    shiny.react::reactElement(
      module = "CustomComponents",
      name = "DetailsList",
      props = shiny.react::asProps(inputId = inputId, ...),
      deps = shinyFluentDependency()
    )
  }

  items <- list(
    list(name = "Apple"),
    list(name = "Banana"),
    list(name = "Cherry")
  )

  shinyApp(
    ui = tagList(
      CustomComponents,
      DetailsList.shinyInput("selection", items = items),
      textOutput("selection")
    ),
    server = function(input, output) {
      output$selection <- renderText(paste(input$selection, collapse = ", "))
    }
  )
}

if (interactive()) {
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

  shinyApp(
    ui = DetailsList(
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
    ),
    server = function(input, output) {}
  )
}
