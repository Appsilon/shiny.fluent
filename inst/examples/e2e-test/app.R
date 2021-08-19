library(shiny)
library(shiny.fluent)
library(leaflet)

ui <- fluidPage(
  fluentInputsUI("fluentInputs"),
  shinyInReactUI("shinyInReact"),
  scenariosUI("scenarios"),
  actionButtonsUI("actionButtons"),
  reactInShinyUI("reactInShiny"),
  deepMixingUI("deepMixing")
)

server <- function(input, output, session) {
  fluentInputsServer("fluentInputs")
  shinyInReactServer("shinyInReact")
  scenariosServer("scenarios")
  actionButtonsServer("actionButtons")
  deepMixingServer("deepMixing")
}

shinyApp(ui, server)
