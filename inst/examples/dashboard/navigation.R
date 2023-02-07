navigationStyles <- list(
  root = list(
    height = '100%',
    boxSizing = 'border-box',
    border = '1px solid #eee',
    overflowY = 'auto'
  )
)


linkGroups <- function(examples) {
  examplesLinks <- lapply(examples, function(name) {
    list(
      name = name,
      url = paste0('#!/', name),
      key = name
    )
  })

  list(list(links = list(
    list(
      name = 'Home',
      url = '#!/',
      key = 'home',
      isExpanded = FALSE
    ),
    list(
      name = 'Components',
      expandAriaLabel = 'Expand Components section',
      collapseAriaLabel = 'Collapse Components section',
      links = examplesLinks,
      isExpanded = FALSE
    ),
    list(
      name = 'shiny.fluent',
      url = 'http://github.com/Appsilon/shiny.fluent',
      key = 'repo',
      icon = 'GitGraph',
      iconProps = list(iconName = 'GitGraph',
                       styles = list(root = list(
                         fontSize = 20,
                         color = '#106ebe'
                       )))
    ),
    list(
      name = 'shiny.react',
      url = 'http://github.com/Appsilon/shiny.react',
      key = 'shinyreact',
      icon = 'GitGraph',
      iconProps = list(iconName = 'GitGraph',
                       styles = list(root = list(
                         fontSize = 20,
                         color = '#106ebe'
                       )))
    ),
    list(name = 'Appsilon',
         url = 'http://appsilon.com',
         key = 'appsilon')
  )))
}

platform_picker <- div(
  class = "platform_picker",
  DefaultButton(
    "platform_button1",
    text = "Web",
    iconProps = list("iconName" = 'Globe'),
    className = "platform_item"
  ),
  DefaultButton(
    "platform_button2",
    text = "Windows",
    iconProps = list("iconName" = 'WindowsLogo'),
    className = "platform_item"
  ),
  DefaultButton(
    "platform_button3",
    text = "iOS",
    iconProps = list("iconName" = 'ShareiOS'),
    className = "platform_item"
  ),
  DefaultButton(
    "platform_button4",
    text = "Android",
    iconProps = list("iconName" = 'CellPhone'),
    className = "platform_item"
  ),
  DefaultButton(
    "platform_button5",
    text = "macOS",
    iconProps = list("iconName" = 'ShareiOS'),
    className = "platform_item"
  ),
  DefaultButton(
    "platform_button6",
    text = "Cross-platform",
    iconProps = list("iconName" = 'OpenInNewWindow'),
    className = "platform_item"
  )
)

navigation <- function(examples) {
  tagList(div(platform_picker),
          Nav(
            groups = linkGroups(examples),
            initialSelectedKey = 'home',
            styles = navigationStyles
          ))
}
