library(shiny)
library(shiny.fluent)

ui <- fluidPage(
  fluentInputsUI("fluentInputs"),
  shinyInReactUI("shinyInReact"),
  scenariosUI("scenarios"),
  actionButtonsUI("actionButtons"),
  reactInShinyUI("reactInShiny")
)

server <- function(input, output, session) {
  fluentInputsServer("fluentInputs")
  shinyInReactServer("shinyInReact")
  scenariosServer("scenarios")
  actionButtonsServer("actionButtons")
}

shinyApp(ui, server)
