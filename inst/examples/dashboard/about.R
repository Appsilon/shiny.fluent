shiny_appsilon_card <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    a(
      href = "https://appsilon.github.io/shiny.fluent/index.html",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.fluent")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.fluent/index.html",
        Image(
          src = "img/shiny-fluent.png",
          width = "100px",
          height = "100px"
        )
      ),
      Stack(
      tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Want to know more?",
          block = TRUE
        ),
        Text(
          "We believe that a great UI plays a huge role in the success of 
          application projects. shiny.fluent gives your apps: - beautiful, 
          professional look - rich set of components easily usable in Shiny - 
          fast speed of development that Shiny is famous for. As Fluent UI is 
          built in React, shiny.fluent is based on another package called 
          shiny.react, which allows for using React libraries in Shiny."
        )
      )
    )
  )
)

shiny_fluent_card <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    a(
      href = "https://appsilon.github.io/shiny.fluent/index.html",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.fluent")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.fluent/index.html",
        Image(
          src = "img/shiny-fluent.png",
          width = "100px",
          height = "100px"
        )
      ),
      Stack(
      tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Want to know more?",
          block = TRUE
        ),
        Text(
          "We believe that a great UI plays a huge role in the success of 
          application projects. shiny.fluent gives your apps: - beautiful, 
          professional look - rich set of components easily usable in Shiny - 
          fast speed of development that Shiny is famous for. As Fluent UI is 
          built in React, shiny.fluent is based on another package called 
          shiny.react, which allows for using React libraries in Shiny."
        )
      )
    )
  )
)

shiny_react_card <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    a(
      href = "https://appsilon.github.io/shiny.fluent/index.html",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.fluent")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.fluent/index.html",
        Image(
          src = "img/shiny-fluent.png",
          width = "100px",
          height = "100px"
        )
      ),
      Stack(
      tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Want to know more?",
          block = TRUE
        ),
        Text(
          "We believe that a great UI plays a huge role in the success of 
          application projects. shiny.fluent gives your apps: - beautiful, 
          professional look - rich set of components easily usable in Shiny - 
          fast speed of development that Shiny is famous for. As Fluent UI is 
          built in React, shiny.fluent is based on another package called 
          shiny.react, which allows for using React libraries in Shiny."
        )
      )
    )
  )
)

shiny_router_card <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    a(
      href = "https://appsilon.github.io/shiny.fluent/index.html",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.fluent")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.fluent/index.html",
        Image(
          src = "img/shiny-fluent.png",
          width = "100px",
          height = "100px"
        )
      ),
      Stack(
      tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Want to know more?",
          block = TRUE
        ),
        Text(
          "We believe that a great UI plays a huge role in the success of 
          application projects. shiny.fluent gives your apps: - beautiful, 
          professional look - rich set of components easily usable in Shiny - 
          fast speed of development that Shiny is famous for. As Fluent UI is 
          built in React, shiny.fluent is based on another package called 
          shiny.react, which allows for using React libraries in Shiny."
        )
      )
    )
  )
)


aboutPage <- makePage(
  "About Shiny.Fluent",
  "Appsilon",
  div(
    shiny_appsilon_card,
    shiny_fluent_card,
    shiny_react_card,
    shiny_router_card
  )
)
