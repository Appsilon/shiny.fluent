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
  )
)

command_bar <- CommandBar(
  items = items,
  farItems = farItems,
  style = list(width = "100%")
)


# The grid layout (including the responsive breakpoint) lives in `style.scss`
# under `.app_header`; the classes below name the grid areas.
header <- function() {
  div(
    id = "app_header",
    class = "app_header mobile-collapsed",
    img(src = "appsilon-logo.png", class = "logo"),
    div(class = "app_header_vertical_separator mobile-toggled separator"),
    div(
      "shiny.fluent",
      class = "app_header_title mobile-toggled title"
    ),
    command_bar,
    tagAppendAttributes(
      IconButton.shinyInput(
        "cta_info",
        class = "cta-icon",
        iconProps = list(iconName = "Info"),
        href = "#!/about"
      ),
      class = "info"
    ),
    tagAppendAttributes(
      PrimaryButton.shinyInput(
        inputId = "cta_talk",
        text = "Let's Talk",
        class = "btn-primary btn-cta mobile-toggled",
        href = "https://appsilon.com/",
        target = "_blank"
      ),
      class = "cta"
    ),
    div(
      class = "mobile_controls",
      tags$script("
        let header_expand = function() {
          document.getElementById('app_header').classList
            .remove('mobile-collapsed');
          document.getElementById('app_header').classList
            .add('mobile-expanded');
        }

        let header_collapse = function() {
          document.getElementById('app_header').classList.
            add('mobile-collapsed');
          document.getElementById('app_header').classList.
            remove('mobile-expanded');
        }
      "),
      icon(
        "bars",
        class = "header_control header_expand cta-icon",
        onclick = "header_expand();"
      ),
      icon(
        "xmark",
        class = "header_control header_collapse cta-icon",
        onclick = "header_collapse();"
      )
    )
  )
}
