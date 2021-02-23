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
CommandBarItem <- function(text, icon = NULL, subitems = NULL, ...) {
  props <- rlang::dots_list(...)
  
  props$text <- text
  if (is.character(icon)) props$iconProps <- list(iconName = icon)
  if (!is.null(subitems)) props$subMenuProps <- list(items = subitems)
  props
}