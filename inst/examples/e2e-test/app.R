library(shiny)
library(shiny.fluent)

ui <- fluidPage(
  fluentInputsUI("fluentInputs"),
  shinyInReactUI("shinyInReact"),
  scenariosUI("scenarios")
)

server <- function(input, output, session) {
  
  fluentInputsServer("fluentInputs")
  shinyInReactServer("shinyInReact")
  scenariosServer("scenarios")
  
}

shinyApp(ui, server)
