items <- list(
  list(
    key = "newItem",
    text = "New",
    cacheKey = "myCacheKey",
    iconProps = list(iconName = "Add"),
    subMenuProps = list(items = list(
      list(
        key = "emailMessage",
        text = "Email message",
        iconProps = list(iconName = "Mail")
      ),
      list(
        key = "calendarEvent",
        text = "Calendar event",
        iconProps = list(iconName = "Calendar")
      )
    ))
  ),
  list(
    key = "upload",
    text = "Upload",
    iconProps = list(iconName = "Upload")
  ),
  list(
    key = "share",
    text = "Share",
    iconProps = list(iconName = "Share")
  ),
  list(
    key = "download",
    text = "Download",
    iconProps = list(iconName = "Download")
  )
)

farItems <- list(
  list(
    key = "tile",
    text = "Grid view",
    ariaLabel = "Grid view",
    iconOnly = TRUE,
    iconProps = list(iconName = "Tiles")
  ),
  list(
    key = "info",
    id = "aboutInfo",
    href = "#!/about",
    text = "Info",
    ariaLabel = "Info",
    iconOnly = TRUE,
    iconProps = list(iconName = "Info")
  )
)

command_bar <- CommandBar(items = items,
  farItems = farItems,
  style = list(width = "100%"))

logo <- img(src = "appsilon-logo.png", class = "logo")
title <- div(Text(variant = "xLarge", "shiny.fluent"), class = "title")

header <- tagList(logo, title, command_bar)
