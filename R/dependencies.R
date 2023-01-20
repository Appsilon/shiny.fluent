#' Shiny Fluent JS dependency
#'
#' @return HTML dependency object.
#'
#' @export
shinyFluentDependency <- function() {
  htmltools::htmlDependency(
    name = "shiny.fluent",
    version = "0.1.0",
    package = "shiny.fluent",
    src = "www/shiny.fluent",
    script = "shiny-fluent.js"
  )
}
