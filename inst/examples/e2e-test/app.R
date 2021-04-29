library(shiny)
library(shiny.fluent)

source("utils.R")
source("toggle_visibility.R")
source("scenarios.R")

ui <- fluidPage(
  toggleVisibilityUI("toggleVisibility"),
  shinyInReactUI("shinyInReact"),
  scenariosUI("scenarios")
)

server <- function(input, output, session) {
  
  toggleVisibilityServer("toggleVisibility")
  shinyInReactServer("shinyInReact")
  scenariosServer("scenarios")
  
}

shinyApp(ui, server)
