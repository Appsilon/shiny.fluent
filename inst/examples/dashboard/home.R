card1 <- div(class = "card ms-depth-8",
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
                   "shiny.fluent is a package that allows you to build Shiny apps using Microsoft's Fluent UI."
                 ),
                 Text(
                   "Use the menu on the left to explore live demos of all available components."
                 )
               )
             ))

card2 <- div(class = "card ms-depth-8",
             Stack(
               tokens = list(childrenGap = 10),
               span(class = "ms-font-su ms-fontColor-themePrimary", "shiny.react"),
               Stack(
                 tokens = list(childrenGap = 5),
                 Text("shiny.react makes it easy to use React libraries in Shiny apps.")
               ),
               Stack(
                 tokens = list(childrenGap = 10),
                 Text(variant = "large", "Want to know more?", block =
                        TRUE),
                 Text(
                   "To make a React library convenient to use from Shiny, we need to write an R package that wraps it - for example, a shiny.fluent package for Microsoft's Fluent UI, or shiny.blueprint for Palantir's Blueprint.js. We try to make this as fast as possible, by providing a generator and automating whatever we can. Go to generator readme to learn how to generate an R wrapper package."
                 ),
                 Text(
                   "Communication and other issues in integrating Shiny and React are solved and standardized in shiny.react package. Generated packages depend on shiny.react."
                 ),
                 Text(
                   "shiny.react strives to do as much as possible automatically, but there's no free lunch here, so in all cases except trivial ones you'll need to do some amount of manual work. The more work you put into a wrapper package, the less work your users will have to do while using it."
                 )
               )
             ))

homePage <-
  withReact(
    makePage(
      "This is a Fluent UI app built in Shiny",
      "shiny.react + Fluent UI = shiny.fluent",
      div(card1,
          card2)
    )
  )
