library(shiny.fluent)

iconStyle <- list(
  width = "50px", height = "50px", fontSize = "50px", margin = "10px", color = "deepskyblue"
)

ui <- fluidPage(
  titlePanel("React components in a Shiny layout"),
  div(
    h3("Label"),
    Label("I'm a Label"),
    Stack(horizontal=TRUE, tokens=list(childrenGap=20),
      PrimaryButton(text = "Button 1"),
      PrimaryButton(text = "Button 2"),
      PrimaryButton(text = "Button 3")
    ),
    h3("Icons"),
    Stack(horizontal=TRUE,
      FontIcon(iconName = "CompassNW", style = iconStyle),
      FontIcon(iconName = "Dictionary", style = iconStyle),
      FontIcon(iconName = "TrainSolid", style = iconStyle)
    ),
    h3("Spinners"),
    Stack(tokens = list(childrenGap = 20, maxWidth = 250),
      div(
        Label("Spinner with label positioned below"),
        Spinner(label = "I am definitely loading...")
      ),
      div(
        Label("Spinner with label positioned above"),
        Spinner(label = "Seriously, still loading...", labelPosition = "top")
      ),
      div(
        Label("Spinner with label positioned to right"),
        Spinner(label = "Wait, wait...", labelPosition = "right")
      ),
      div(
        Label("Spinner with label positioned to left"),
        Spinner(label = "Nope, still loading...", labelPosition = "left")
      )
    ),
    h3("Pivot"),
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"))
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)
