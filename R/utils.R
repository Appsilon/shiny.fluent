recursiveModify <- function(x, modify = identity, when = function(x) TRUE) {
  purrr::modify_tree(
    x,
    pre = function(el) {
      if (!is.null(el) && when(el)) {
        return(modify(el))
      }
      el
    },
    is_node = is.list
  )
}
