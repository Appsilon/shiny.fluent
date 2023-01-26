library(shiny)
library(shiny.fluent)

navigation_styles <- list(
  root = list(
    height = "100%",
    boxSizing = "border-box",
    border = "1px solid #eee",
    overflowY = "auto"
  )
)

link_groups <- list(
  list(
    links = list(
      list(
        name = "Home",
        expandAriaLabel = "Expand Home section",
        collapseAriaLabel = "Collapse Home section",
        links = list(
          list(
            name = "Activity",
            url = "http://msn.com",
            key = "key1",
            target = "_blank"
          ),
          list(
            name = "MSN",
            url = "http://msn.com",
            disabled = TRUE,
            key = "key2",
            target = "_blank"
          )
        ),
        isExpanded = TRUE
      ),
      list(
        name = "Documents",
        url = "http://example.com",
        key = "key3",
        isExpanded = TRUE
      ),
      list(
        name = "Pages",
        url = "http://msn.com",
        key = "key4"
      ),
      list(
        name = "Notebook",
        url = "http://msn.com",
        key = "key5",
        disabled = TRUE
      ),
      list(
        name = "Communication and Media",
        url = "http://msn.com",
        key = "key6"
      ),
      list(
        name = "News",
        url = "http://cnn.com",
        icon = "News",
        key = "key7",
        target = "_blank",
        iconProps = list(
          iconName = "News",
          styles = list(
            root = list(
              fontSize = 20,
              color = "#106ebe"
            )
          )
        )
      )
    )
  )
)

ui <- function(id) {
  ns <- NS(id)
  Nav(
    groups = link_groups,
    selectedKey = "key1",
    styles = navigation_styles
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
