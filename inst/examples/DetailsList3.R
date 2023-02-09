# Example 3
library(shiny)
library(shiny.fluent)

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

ui <- function(id) {
  ns <- NS(id)
  tagList(
    CustomComponents,
    DetailsList.shinyInput(ns("selection"), items = items),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text <- renderText(paste(input$selection, collapse = ", "))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
