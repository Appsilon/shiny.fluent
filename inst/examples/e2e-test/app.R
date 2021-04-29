library(shiny)
library(shiny.fluent)

source("utils.R")
source("toggle_visibility.R")
source("scenarios.R")

ui <- fluidPage(
  toggleVisibilityUI("toggleVisibility"),
  scenariosUI("scenarios")
)

server <- function(input, output, session) {
  
  toggleVisibilityServer("toggleVisibility")
  scenariosServer("scenarios")
  
}

shinyApp(ui, server)
