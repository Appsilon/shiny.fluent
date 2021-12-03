homePage <- function(i18n) {
  tagList(
    shiny.i18n::usei18n(i18n),
    makePage(
      i18n$t("This is a Fluent UI app built in Shiny"),
      "shiny.react + Fluent UI = shiny.fluent",
      div(
        makeCard(
          i18n$t("Welcome to shiny.fluent demo!"),
          Stack(
            Text(i18n$t("shiny.fluent is a package that allows you to build Shiny apps using Microsoft's Fluent UI.")),
            Text(i18n$t("Use the menu on the left to explore live demos of all available components."))
          )
        )
      )
    )
  )
}
