resolve <- shiny:::resolve

#' Run example shiny.fluent apps.
#'
#' Based on shiny::runExample, and takes the same arguments.
#'
#' @param example Example to run. `NA` to list the examples.
#' @param launch.browser Whether to open the app in a browser
#' @param host The IPv4 address to listen on.
#' @param display.mode Display mode for the app.
#'
#' @export
runExample <- function(
  example = NA,
  port = getOption("shiny.port"),
  launch.browser = getOption( # nolint
    "shiny.launch.browser",
    interactive()
  ),
  host = getOption("shiny.host", "127.0.0.1"),
  display.mode = c("auto", "normal", "showcase") # nolint
) {
  examplesDir <- system.file("examples", package = "shiny.fluent", mustWork = TRUE)
  appPath <- resolve(examplesDir, example)
  if (is.null(appPath)) {
    examplesListMessage <- paste0(
      'Available examples: "',
      paste(list.files(examplesDir), collapse = '", "'),
      '"'
    )
    if (is.na(example)) {
      message(examplesListMessage)
    } else {
      stop(paste("Example", example, " not found. "), examplesListMessage)
    }
  }
  else {
    shiny::runApp(appPath,
      port = port, host = host, launch.browser = launch.browser,
      display.mode = display.mode
    )
  }
}
