iconStyle <- list(
  width = "50px", height = "50px", fontSize = "50px", margin = "10px", color = "deepskyblue"
)

reactInShinyUI <- function(id) {
  ns <- NS(id)
  div(
    h1("React components in a Shiny layout"),
    h3("Label"),
    Label("I'm a Label", id = ns("label")),
    h3("Icons"),
    Stack(
      horizontal = TRUE,
      FontIcon(iconName = "CompassNW", style = iconStyle, id = ns("compass"))
    ),
    h3("Spinners"),
    Stack(
      tokens = list(childrenGap = 20, maxWidth = 250),
      div(
        Label("Spinner with label positioned below"),
        Spinner(label = "I am definitely loading...", id = ns("spinner"))
      )
    )
  )
}
