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


header <- function() {
  appsilon_breakpoints <- breakpointSystem(
    "appsilon-breakpoints",
    breakpoint("xs", min = 320),
    breakpoint("s", min = 428),
    breakpoint("m", min = 728),
    breakpoint("l", min = 1024),
    breakpoint("xl", min = 1200)
  )

  gridPanel(
    id = "app_header",
    class = "mobile-collapsed",
    breakpoint_system = appsilon_breakpoints,
    areas = list(
      default = c(
        "logo . info mobile_controls",
        "separator separator separator separator",
        "title title title title",
        "menu menu menu menu",
        "cta cta cta cta"
      ),
      l = "logo separator title mobile_controls . menu info cta"
    ),
    columns = list(
      default = "auto 1fr auto auto",
      l = "auto 1px auto auto 1fr auto auto auto"
    ),
    rows = list(
      default = "auto auto auto auto auto",
      l = "40px"
    ),
    gap = list(
      default = "0px",
      l = "16px"
    ),
    logo = img(src = "appsilon-logo.png", class = "logo"),
    separator = div(class = "app_header_vertical_separator mobile-toggled"),
    title = div(
      "shiny.fluent",
      class = "app_header_title mobile-toggled"
    ),
    command_bar,
    info = IconButton.shinyInput(
      "cta_info",
      class = "cta-icon",
      iconProps = list(iconName = "Info"),
      href = "#!/about"
    ),
    cta = PrimaryButton.shinyInput(
      inputId = "cta_talk",
      text = "Let's Talk",
      class = "btn-primary btn-cta mobile-toggled",
      href = "https://appsilon.com/",
      target = "_blank"
    ),
    mobile_controls = div(
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
