library(shiny.fluent)

if (interactive()) {
  items <- list(
    list(key = "1", name = "Mark", surname = "Swanson"),
    list(key = "2", name = "Josh", surname = "Johnson")
  )

  columns <- list(
    list(key = "name", fieldName = "name", name = "Name"),
    list(key = "surname", fieldName = "surname", name = "Surname")
  )

  shinyApp(
    ui = withReact(
      DetailsList(items = items, columns = columns)
    ),
    server = function(input, output) {
    }
  )
}
