makePage <- function(title, subtitle, contents) {
  tagList(
    div(
      class = "page-title",
      span(
        title,
        class = "ms-fontSize-32 ms-fontWeight-semibold",
        style = "color: #323130"
      ),
      span(
        subtitle,
        class = "ms-fontSize-14 ms-fontWeight-regular",
        style = "color: #605E5C; margin: 14px;"
      )
    ),
    contents
  )
}

makeCard <- function(title, content, size = 12, style = "") {
  div(
    class = glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
    style = style,
    Stack(
      tokens = list(childrenGap = 5),
      Text(variant = "large", title, block = TRUE),
      content
    )
  )
}

HorizontalStack <- function(...) {
  Stack(
    horizontal = TRUE,
    tokens = list(childrenGap = 10),
    ...
  )
}
