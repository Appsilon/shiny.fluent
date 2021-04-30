customOutputUI <- function(id) {
  ns <- NS(id)
  tagList(
    h1("DT - a custom output inside React"),
    Pivot(
      PivotItem(
        headerText = "Tab 1",
        Label("Hello 1")
      ),
      PivotItem(
        headerText = "DT inside a Pivot",
        DTOutput(ns("dt")),
        uiOutput(ns("dt_interaction_output"))
      )
    )
  )
}

customOutputServer <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    output$dt <- renderDT(iris, options = list(lengthChange = FALSE))

    output$dt_interaction_output <- renderUI({
      div(
        h3("Communication from DT back to Shiny works as well!"),
        h5(paste("Rows selected:", paste(input$dt_rows_selected, collapse = ", ")))
      )
    })
  })
}
