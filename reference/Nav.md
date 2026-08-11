# Nav

Navs (also called "left nav" or "navigation pane") provide links to the
main areas of an app or a site. In larger configurations, the Nav is
always on-screen, usually on the left of the view. In smaller
configurations, the Nav may collapse into a skinnier version or be
completely hidden until the user taps an icon.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Nav).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Nav(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **link** `INavLink`  
  (Optional) Link to be rendered.

- **ariaLabel** `string`  
  (Optional) The nav container aria label.

- **className** `string`  
  Additional css class to apply to the Nav

- **componentRef** `IRefObject<INav>`  
  Optional callback to access the INav interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **expandButtonAriaLabel** `string`  
  (Optional) The nav container aria label. The link name is prepended to
  this label. If not provided, the aria label will default to the link
  name.

- **groups** `INavLinkGroup[] | null`  
  A collection of link groups to display in the navigation bar

- **initialSelectedKey** `string`  
  (Optional) The key of the nav item initially selected.

- **isOnTop** `boolean`  
  Indicates whether the navigation component renders on top of other
  content in the UI

- **linkAs** `IComponentAs<INavButtonProps>`  
  Render a custom link in place of the normal one. This replaces the
  entire button rather than simply button content

- **onLinkClick**
  `(ev?: React.MouseEvent<HTMLElement>, item?: INavLink) => void`  
  Function callback invoked when a link in the navigation is clicked

- **onLinkExpandClick**
  `(ev?: React.MouseEvent<HTMLElement>, item?: INavLink) => void`  
  Function callback invoked when the chevron on a link is clicked

- **onRenderGroupHeader** `IRenderFunction<IRenderGroupHeaderProps>`  
  Used to customize how content inside the group header is rendered

- **onRenderLink** `IRenderFunction<INavLink>`  
  Used to customize how content inside the link tag is rendered

- **selectedAriaLabel** `string`  
  (Deprecated) Use ariaCurrent on links instead

- **selectedKey** `string`  
  (Optional) The key of the nav item selected by caller.

- **styles** `IStyleFunctionOrObject<INavStyleProps, INavStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **theme** `ITheme`  
  Theme provided by HOC.

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

navigation_styles <- list(
  root = list(
    height = "100%",
    boxSizing = "border-box",
    border = "1px solid #eee",
    overflowY = "auto"
  )
)

link_groups <- list(
  list(
    links = list(
      list(
        name = "Home",
        expandAriaLabel = "Expand Home section",
        collapseAriaLabel = "Collapse Home section",
        links = list(
          list(
            name = "Activity",
            url = "http://msn.com",
            key = "key1",
            target = "_blank"
          ),
          list(
            name = "MSN",
            url = "http://msn.com",
            disabled = TRUE,
            key = "key2",
            target = "_blank"
          )
        ),
        isExpanded = TRUE
      ),
      list(
        name = "Documents",
        url = "http://example.com",
        key = "key3",
        isExpanded = TRUE
      ),
      list(
        name = "Pages",
        url = "http://msn.com",
        key = "key4"
      ),
      list(
        name = "Notebook",
        url = "http://msn.com",
        key = "key5",
        disabled = TRUE
      ),
      list(
        name = "Communication and Media",
        url = "http://msn.com",
        key = "key6"
      ),
      list(
        name = "News",
        url = "http://cnn.com",
        icon = "News",
        key = "key7",
        target = "_blank",
        iconProps = list(
          iconName = "News",
          styles = list(
            root = list(
              fontSize = 20,
              color = "#106ebe"
            )
          )
        )
      )
    )
  )
)

ui <- function(id) {
  ns <- NS(id)
  Nav(
    groups = link_groups,
    selectedKey = "key1",
    styles = navigation_styles
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

# Custom rendering of group headers
navigation_styles <- list(
  root = list(
    height = "100%",
    width = "30%",
    boxSizing = "border-box",
    border = "1px solid #eee",
    overflowY = "auto"
  )
)

link_groups <- list(
  list(
    name = "Pages",
    links = list(
      list(name = "Activity"),
      list(name = "News")
    )
  ),
  list(
    name = "More Pages",
    links = list(
      list(name = "Settings"),
      list(name = "Notes")
    )
  )
)

ui <- function(id) {
  fluidPage(
    Nav(
      groups = link_groups,
      selectedKey = "key1",
      styles = navigation_styles,
      onRenderGroupHeader = JS("group => React.createElement('h3', null, group.name)")
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
