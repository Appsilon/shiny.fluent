navigation <- function(i18n) {
  Nav(
    groups = list(
      list(
        links = list(
          list(
            name = i18n$t("Home"),
            url = "#!/",
            key = "home",
            icon = "Home"
          ),
          list(
            name = i18n$t("Analysis"),
            url = "#!/other",
            key = "analysis",
            icon = "AnalyticsReport"
          ),
          list(
            name = "shiny.fluent",
            url = "http://github.com/Appsilon/shiny.fluent",
            key = "repo",
            icon = "GitGraph"
          ),
          list(
            name = "shiny.react",
            url = "http://github.com/Appsilon/shiny.react",
            key = "shinyreact",
            icon = "GitGraph"
          ),
          list(
            name = "Appsilon",
            url = "http://appsilon.com",
            key = "appsilon",
            icon = "WebAppBuilderFragment"
          )
        )
      )
    ),
    initialSelectedKey = "home",
    styles = list(
      root = list(
        height = "100%",
        boxSizing = "border-box",
        border = "1px solid #eee",
        overflowY = "auto"
      )
    )
  )
}