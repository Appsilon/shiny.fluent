library(shiny)
library(shiny.fluent)
library(shiny.router) # devtools::install_cran("shiny.router")
library(sass)
library(stringi)
library(purrr)

source("header.R")
source("navigation.R")
source("examples.R")
source("utils.R")
source("example_page.R")
source("home.R")
source("footer.R")

examplePages <- imap(examples, function(example, name) {
  page <- withReact(makeExamplePage(name, example$ui))
  route(name, page)
})
names(examplePages) <- NULL

pages <- c(list(route("/", homePage)), examplePages)
router <- lift(make_router)(pages)

layout <- div(class = "grid-container",
  div(class = "header", header),
  div(class = "sidenav", navigation(examples)),
  div(class = "main", ShinyComponentWrapper(router_ui())),
  div(class = "footer", footer)
)

# shiny.router dependencies do not get picked up because they're added in a non-standard way.
shiny::addResourcePath("shiny.router", system.file("www", package = "shiny.router"))
shiny_router_js <- file.path("shiny.router", "shiny.router.js")

ui <- fluidPage(
  suppressDependencies("bootstrap"),
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    shiny::tags$script(type = "text/javascript", src = shiny_router_js)
  ),
  htmltools::htmlDependency(
    "office-ui-fabric-core",
    "11.0.0",
    list(href="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-core/11.0.0/css/"),
    stylesheet = "fabric.min.css"
  ),
  shiny::tags$body(
    class = "ms-Fabric",
    dir="ltr",
    withReact(layout)
  )
)

sass(
  sass_file("style.scss"),
  output = "www/style.css"
)

server <- function(input, output, session) {
  router(input, output, session)

  purrr::map(examples, function(example) {
    example$server(input, output)
  })
}

shinyApp(ui, server)
