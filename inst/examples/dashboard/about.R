shiny_appsilon_card <- div(
  class = "card ms-depth-8",
  Stack(
    tokens = list(childrenGap = 10),
    a(
      href = "https://appsilon.com/",
      span(class = "ms-font-su ms-fontColor-themePrimary", "Appsilon")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.com/",
        Image(
          src = "appsilon-logo.png",
          width = "120px",
          height = "70px"
        )
      ),
      Stack(
        tokens = list(childrenGap = 5),
        Text(
          variant = "large", "This Project is Developed By Appsilon",
          block = TRUE
        ),
        Text(
          "We create, maintain, and develop Shiny applications for
          enterprise customers all over the world. Appsilon provides
          scalability, security, and modern UI/UX with custom R
          packages that native Shiny apps do not provide. Our team is
          among the world’s foremost experts in R Shiny and has made
          a variety of Shiny innovations over the years. Appsilon is
          a proud RStudio (Posit) Full Service Certified Partner."
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
          width = "120px",
          height = "120px"
        )
      ),
      Stack(
        tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Check the rest of the App to Learn More...",
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
      href = "https://appsilon.github.io/shiny.react/",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.react")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.react/",
        Image(
          src = "img/shiny-react.png",
          width = "120px",
          height = "120px"
        )
      ),
      Stack(
        tokens = list(childrenGap = 5),
        Text(
          variant = "large", "handshake between React and Shiny",
          block = TRUE
        ),
        Text(
          "Most of the shiny apps are build directly in Shiny
          without using any JS library. React being the Most popular one
          becomes one of such candidate.
          This R package enables using React in Shiny apps and is
          used e.g. by the shiny.fluent package. It contains R and JS
          code which is independent from the React library
          (e.g. Fluent UI) that is being wrapped."
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
      href = "https://appsilon.github.io/shiny.router/",
      span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.router")
    ),
    Stack(
      wrap = FALSE,
      horizontal = TRUE,
      horizontalAlign = TRUE,
      verticalFill = TRUE,
      tokens = list(childrenGap = 12),
      a(
        href = "https://appsilon.github.io/shiny.router/",
        Image(
          src = "img/shiny-router.png",
          width = "120px",
          height = "120px"
        )
      ),
      Stack(
        tokens = list(childrenGap = 5),
        Text(
          variant = "large", "Create Shiny like a MultiPage App",
          block = TRUE
        ),
        Text(
          " With Shiny Router we can actually create a shiny App That
          behaves like a multipage App. Where you can direct user from
          one point to another through using hrefs and hyperlinks.
          This is something we never had in shiny and you might have
          found yourself stuck in a project where people want to share
          URL of only one perticular Page. With Shiny Router we try to
          overcome these challenges in a shiny App. Try the package
          and Give us your feedback So that we can grow together..."
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
