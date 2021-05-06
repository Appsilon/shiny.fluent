# ---- helloworld-dependencies ----
library(shiny)
library(shiny.fluent)

# ---- helloworld ----
ui <- fluentPage(
  Text(variant = "xxLarge", "Hello world!")
)

server <- function(input, output, session) {}

shinyApp(ui, server)
