card1 <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.fluent"),
    Stack(
      tokens = list(childrenGap = 5),
      Text("This is About Section..")
    ),
    Stack(
      tokens = list(childrenGap = 10),
      Stack(
        tokens = list(childrenGap = 4),
        Image(
          src = "img/shiny-fluent.png",
          width = "100px",
          height = "100px"
        ),
        Text(
          variant = "large", "Want to know more?",
          block = TRUE
        )
      ),
      Text(
        "This is About Section..."
      )
    )
  )
)

card2 <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.react"),
    Stack(
      tokens = list(childrenGap = 5),
      Text("This is About Section..")
    ),
    Stack(
      tokens = list(childrenGap = 10),
      Text(
        variant = "large", "Want to know more?",
        block = TRUE
      ),
      Text(
        "This is About Section..."
      ),
      Text(
        "This is About Section..."
      ),
      Text(
        "This is About Section..."
      )
    )
  )
)

aboutPage <-
  makePage(
    "About Shiny.Fluent",
    "Appsilon",
    div(
      card1,
      card2
    )
  )
