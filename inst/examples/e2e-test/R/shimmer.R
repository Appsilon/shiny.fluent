items <- list(
  list(key = "1", name = "Mark", surname = "Swanson"),
  list(key = "2", name = "Josh", surname = "Johnson")
)
items <- append(items, rep(NA, 8))
columns <- list(
  list(key = "name", fieldName = "name", name = "Name"),
  list(key = "surname", fieldName = "surname", name = "Surname")
)

shimmerUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("Shimmer"),
    checkboxInput(ns("toggle"), "Enable shimmer", value = TRUE),
    uiOutput(ns("shimmeredDetailsListOutput"))
  )
}

shimmerServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$shimmeredDetailsListOutput <- renderUI({
      ShimmeredDetailsList(
        items = items,
        columns = columns,
        enableShimmer = input$toggle,
        ariaLabelForShimmer = "Content is being fetched",
        ariaLabelForGrid = "Item details",
        listProps = list(
          renderCount = length(items)
        )
      )
    })
  })
}
