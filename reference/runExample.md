# Run example shiny.fluent apps.

Based on shiny::runExample, and takes the same arguments.

## Usage

``` r
runExample(
  example = NA,
  port = getOption("shiny.port"),
  launch.browser = getOption("shiny.launch.browser", interactive()),
  host = getOption("shiny.host", "127.0.0.1"),
  display.mode = c("auto", "normal", "showcase")
)
```

## Arguments

- example:

  Example to run. `NA` to list the examples.

- port:

  The TCP port that the application should listen on

- launch.browser:

  Whether to open the app in a browser

- host:

  The IPv4 address to listen on.

- display.mode:

  Display mode for the app.

## Value

This function normally does not return; interrupt R to stop the
application (usually by pressing Ctrl+C or Esc).
