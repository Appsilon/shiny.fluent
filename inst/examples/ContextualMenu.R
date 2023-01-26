library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(
      ns("toggleContextualMenu"),
      id = "target",
      text = "Toggle menu"
    ),
    reactOutput(ns("contextualMenu"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    showContextualMenu <- reactiveVal(FALSE)
    observeEvent(input$toggleContextualMenu, {
      showContextualMenu(!showContextualMenu())
    })

    output$contextualMenu <- renderReact({
      menuItems <- JS("[
        {
          key: 'newItem',
          text: 'New',
          onClick: () => console.log('New clicked'),
        },
        {
          key: 'divider_1',
          itemType: 1,
        },
        {
          key: 'rename',
          text: 'Rename',
          onClick: () => console.log('Rename clicked'),
        },
        {
          key: 'edit',
          text: 'Edit',
          onClick: () => console.log('Edit clicked'),
        },
        {
          key: 'properties',
          text: 'Properties',
          onClick: () => console.log('Properties clicked'),
        },
        {
          key: 'linkNoTarget',
          text: 'Link same window',
          href: 'http://bing.com',
        },
        {
          key: 'linkWithTarget',
          text: 'Link new window',
          href: 'http://bing.com',
          target: '_blank',
        },
        {
          key: 'linkWithOnClick',
          name: 'Link click',
          href: 'http://bing.com',
          onClick: function(){
            alert('Link clicked');
            ev.preventDefault();
          },
          target: '_blank',
        },
        {
          key: 'disabled',
          text: 'Disabled item',
          disabled: true,
          onClick: () => console.error('Disabled item should not be clickable.'),
        },
      ]")

      ContextualMenu(
        items = menuItems,
        hidden = !showContextualMenu(),
        target = "#target",
        onItemClick = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("toggleContextualMenu"), "', Math.random());",
          "}"
        )),
        onDismiss = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("toggleContextualMenu"), "', Math.random());",
          "}"
        ))
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
