library(shiny)
library(shiny.fluent)
library(leaflet)
library(DT)

ui <- fluidPage(
  fluentInputsUI("fluentInputs"),
  shinyInReactUI("shinyInReact"),
  scenariosUI("scenarios"),
  actionButtonsUI("actionButtons"),
  reactInShinyUI("reactInShiny"),
  customOutputUI("customOutput"),
  deepMixingUI("deepMixing"),
  shimmerUI("shimmer")
)

server <- function(input, output, session) {
  fluentInputsServer("fluentInputs")
  shinyInReactServer("shinyInReact")
  actionButtonsServer("actionButtons")
  reactInShinyServer("reactInShiny")
  customOutputServer("customOutput")
  deepMixingServer("deepMixing")
  shimmerServer("shimmer")
}

shinyApp(ui, server)
