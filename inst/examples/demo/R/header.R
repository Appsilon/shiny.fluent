header <- function(i18n) {
  tagList(
    img(src = "appsilon-logo.png", class = "logo"),
    div(Text(variant = "xLarge", i18n$t("Sales Reps Analysis")), class = "title"),
    CommandBar(
      items = list(
        CommandBarItem(
          i18n$t("New"),
          i18n$t("Add"),
          subitems = list(
            CommandBarItem(i18n$t("Email message"), "Mail", key = "emailMessage", href = "mailto:me@example.com"),
            CommandBarItem(i18n$t("Calendar event"), "Calendar", key = "calendarEvent")
          )
        ),
        CommandBarItem(i18n$t("Upload sales plan"), "Upload"),
        CommandBarItem(i18n$t("Share analysis"), "Share"),
        CommandBarItem(i18n$t("Download report"), "Download")
      ),
      farItems = list(
        CommandBarItem(i18n$t("Grid view"), "Tiles", iconOnly = TRUE),
        CommandBarItem(i18n$t("Info"), "Info", iconOnly = TRUE)
      ),
      style = list(width = "100%")
    )
  )
}
