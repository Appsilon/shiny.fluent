library(shiny)
library(shiny.fluent)

items <- list(
  list(key = "item1", icon = "Add", name = "Link 1"),
  list(key = "item2", icon = "Upload", name = "Link 2"),
  list(key = "item3", icon = "Share", name = "Link 3")
)
overflowItems <- list(
  list(key = "item4", icon = "Mail", name = "Overflow Link 1"),
  list(key = "item5", icon = "Calendar", name = "Overflow Link 2")
)
onRenderItem <- JS("item =>
  jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
    role: 'menuitem',
    iconProps: { iconName: item.icon },
    styles: {
      root: { padding: '10px' }
    }
  })
")
onRenderOverflowButton <- JS("overflowItems =>
  jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
    role: 'menuitem',
    title: 'More items',
    styles: {
      root: { padding: '10px' }
    },
    menuIconProps: { iconName: 'More' },
    menuProps: { items: overflowItems }
  })
")


ui <- function(id) {
  ns <- NS(id)
  OverflowSet(
    vertical = TRUE,
    items = items,
    overflowItems = overflowItems,
    onRenderItem = onRenderItem,
    onRenderOverflowButton = onRenderOverflowButton
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
