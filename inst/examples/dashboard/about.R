card1 <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    Stack(
      tokens = list(childrenGap = 5),
      Text(
        variant = "large",
        "Welcome to shiny.fluent demo!",
        block = TRUE
      ),
      Text(
        "This is About Section"
      ),
      Text(
        "This is About Section."
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
        variant = "large", "Want to know more?", block =
          TRUE
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
    "This is a Fluent UI app built in Shiny",
    "shiny.react + Fluent UI = shiny.fluent",
    div(
      card1,
      card2
    )
  )
