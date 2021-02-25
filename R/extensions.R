#' Helper function for constructing items for `CommandBar`
#' 
#' CommandBar expects items definition as a nested structure, which gets lengthy and verbose.
#' This function helps makes this definition shorter. Returns a list with all arguments passed through,
#' except for `text`, `icon` (which will inserted as proper `iconProps`) and `subitems` (which will be inserted as
#' proper `subMenuProps`)
#' 
#' @param text text to be displayed on the menu
#' @param icon optional name of an icon
#' @param subitems optional list of CommandBar items
#' @seealso CommandBar
#' @export
CommandBarItem <- function(text, icon = NULL, subitems = NULL, ...) {
  props <- rlang::dots_list(...)
  
  props$text <- text
  if (is.character(icon)) props$iconProps <- list(iconName = icon)
  if (!is.null(subitems)) props$subMenuProps <- list(items = subitems)
  props
}

#' Basic Fluent UI page. Replacement for shiny::*Page family of functions.
#'
#' Creates a Fluent UI page with sensible defaults (included Fabric CSS classes, proper class given to the body tag,
#' suppressed Bootstrap). You can also use shiny.fluent directly, without using this function.
#' `bodyContent` does not get inserted as React to allow for flexibility. Use \code{\link{withReact}} or \code{\link{reactOutput}}
#' to insert React content.
#'
#' @param bodyContent This argument will be inserted into the body tag directly.
#' @param ... Additional tags that will be inserted into the page. Useful particularly for including head tag content like CSS.
#' @export
fluentPage <- function(bodyContent, ...){
  fluidPage(
    shiny::suppressDependencies("bootstrap"),
    ...,
    htmltools::htmlDependency(
      "office-ui-fabric-core",
      "11.0.0",
      list(href="https://static2.sharepointonline.com/files/fabric/office-ui-fabric-core/11.0.0/css/"),
      stylesheet = "fabric.min.css"
    ),
    shiny::tags$body(
      class = "ms-Fabric",
      bodyContent
    )
  )
}