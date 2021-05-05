wireInputToOutput <- function(ids, input, output) {
  lapply(ids, function(id) {
    output[[paste0(id, "Value")]] <- renderText({
      v <- input[[id]]
      sprintf("Value: %s", if (is.list(v)) v[[1]] else v)
    })
  })
}
