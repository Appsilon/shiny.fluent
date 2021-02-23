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
run_example <- function(example = NA,
                        port = getOption("shiny.port"),
                        launch.browser = getOption( #nolint
                          "shiny.launch.browser",
                          interactive()
                        ),
                        host = getOption("shiny.host", "127.0.0.1"),
                        display.mode = c("auto", "normal", "showcase")) { #nolint
  examples_dir <- system.file("examples", package = "shiny.fluent", mustWork = TRUE)
  app_path <- shiny:::resolve(examples_dir, example) # TODO: avoid :::
  if (is.null(app_path)) {
    examples_list_message <- paste0(
      'Available examples: "',
      paste(list.files(examples_dir), collapse = '", "'),
      '"'
    )
    if (is.na(example)) {
      message(examples_list_message)
    } else {
      stop(paste("Example", example, " not found. "), examples_list_message)
    }
  }
  else {
    shiny::runApp(app_path,
      port = port, host = host, launch.browser = launch.browser,
      display.mode = display.mode
    )
  }
}
