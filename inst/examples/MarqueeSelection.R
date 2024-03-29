library(shiny)
library(shiny.fluent)

# This is an advanced demo showing how you can use virtually all features of Fluent UI
# by creating custom components in JS and rendering them with shiny.react.
# This example is a translation of the example in
# https://developer.microsoft.com/en-us/fluentui#/controls/web/marqueeselection.

# Script showing how to:
# 1. Use mergeStyles and themes from Fluent
# 2. Define custom components
# 3. Send results back to Shiny.

customComponent <- function(name, js) {
  dependency <- htmltools::htmlDependency(
    name = name,
    version = "0", # Not used.
    src = c(href = ""), # Not used.
    head = paste0("
      <script>
        (jsmodule.CustomComponents ??= {}).", name, " = (() => {", js, "})();
      </script>
    ")
  )
  function(...) shiny.react::reactElement(
    module = "CustomComponents",
    name = name,
    props = shiny.react::asProps(...),
    deps = dependency
  )
}

MarqueeSelectionExample <- customComponent("MarqueeSelectionExample", "
  const React = jsmodule['react'];
  const Fluent = jsmodule['@fluentui/react'];

  const theme = Fluent.getTheme();
  const styles = Fluent.mergeStyleSets({
    photoList: {
      display: 'inline-block',
      border: '1px solid ' + theme.palette.neutralTertiary,
      margin: 0,
      padding: 10,
      overflow: 'hidden',
      userSelect: 'none',
    },

    photoCell: {
      position: 'relative',
      display: 'inline-block',
      margin: 2,
      boxSizing: 'border-box',
      background: theme.palette.neutralLighter,
      lineHeight: 100,
      verticalAlign: 'middle',
      textAlign: 'center',
      selectors: {
        '&.is-selected': {
          background: theme.palette.themeLighter,
          border: '1px solid ' + theme.palette.themePrimary,
        },
      },
    },
    checkbox: {
      margin: '10px 0',
    },
  });

  const useForceUpdate = () => {
    const [, setIt] = React.useState(false);
    return () => setIt(it => !it);
  };

  return function(params) {
    const forceUpdate = useForceUpdate();
    const inputId = params['inputId'];
    const photos = params['photos'];

    if (window.selection === undefined) {
      window.selection = new Fluent.Selection({
        items: photos,
        onSelectionChanged: function() {
          Shiny.setInputValue(inputId, window.selection.getSelectedIndices());
          forceUpdate();
        }
      });
    }

    const items = photos.map((photo, index) => {
      return React.createElement(
        'div',
        {
          key: index,
          'data-is-focusable': true,
          className: Fluent.css(
            styles.photoCell,
            window.selection.isIndexSelected(index) && 'is-selected'
          ),
          'data-selection-index': index,
          style: { width: photo.width, height: photo.height }
        },
        index
      );
    });

    return React.createElement(
      Fluent.MarqueeSelection,
      { selection: window.selection, isEnabled: true },
      React.createElement('ul', { className: styles.photoList }, items)
    );
  };
")

ui <- function(id) {
  ns <- NS(id)
  tagList(
    textOutput(ns("marqueeResult")),
    Label("Drag a rectangle around the items below to select them"),
    reactOutput(ns("marqueeSelection"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    photos <- lapply(1:50, function(index) {
      randomWidth <- 50 + sample.int(150, 1)
      list(
        key = index,
        url = paste0('http://placehold.it/', randomWidth, 'x100'),
        width = randomWidth,
        height = 100
      )
    })

    output$marqueeResult <- renderText({
      paste("You have selected: ", paste(input$selectedIndices, collapse = ", "))
    })

    output$marqueeSelection <- renderReact({
      MarqueeSelectionExample(
        inputId = ns("selectedIndices"),
        photos = photos
      )
    })
  }
)
}
if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
