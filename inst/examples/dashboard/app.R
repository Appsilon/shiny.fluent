library(dplyr)
library(imola)
library(purrr)
library(sass)
library(shiny.fluent)
library(shiny.router)
library(shiny)
library(stringi)

source("header.R")
source("navigation.R")
source("utils.R")
source("examples.R")
source("home.R")
source("about.R")
source("footer.R")

examples_routes <- lapply(examples, makeExampleRoute)

router_page_elements <- append(
  list(
    route("/", homePage),
    route("about", aboutPage)
  ),
  map(examples_routes, "route")
)

router_page <- do.call(router_ui, router_page_elements)

layout <- div(class = "grid-container",
  div(class = "header", header()),
  div(class = "sidenav", navigation(examples)),
  div(class = "main", router_page),
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
    list(href = "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-core/11.0.0/css/"),
    stylesheet = "fabric.min.css"
  ),
  shiny::tags$body(
    class = "ms-Fabric",
    dir = "ltr",
    layout
  )
)

sass(
  sass_file("style.scss"),
  output = "www/style.css"
)

server <- function(input, output, session) {
  router_server()
  examples_routes %>%
    map("servers") %>%
    flatten() %>%
    iwalk(function(server, id) server(id))
}

shinyApp(ui, server)
