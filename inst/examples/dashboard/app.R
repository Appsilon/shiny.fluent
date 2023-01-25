library(shiny.router)
library(shiny)

section <- function(name, ...) list(name = name, items = list(...))
item <- function(name, id) list(type = "item", name = name, id = id)

sections <- list(
  section(
    "COMPONENTS",
    item("ActivityItem", "ActivityItem"),
    item("Announced", "Announced"),
    item("Breadcrumb", "Breadcrumb"),
    item("Button", "Button"),
    item("CommandBar", "CommandBar"),
    
    item("DetailsList", "DetailsList"),
    item("DocumentCard", "DocumentCard"),
    item("Facepile", "Facepile"),
    item("FocusTrapZone", "FocusTrapZone"),
    item("FocusZone", "FocusZone"),
    item("GroupedList", "GroupedList"),
    
    item("Icon", "Icon"),
    item("Image", "Image"),
    item("Keytips", "Keytips"),
    item("LayerHost", "LayerHost"),
    
    item("Link", "Link"),
    item("List", "List"),
    item("MessageBar", "MessageBar"),
    item("Nav", "Nav"),
    item("OverflowSet", "OverflowSet"),
    item("Persona", "Persona"),
    item("Pivot", "Pivot"),
    item("ProgressIndicator", "ProgressIndicator"),
    item("ResizeGroup", "ResizeGroup"),
    item("ScrollablePane", "ScrollablePane"),
    item("Separator", "Separator"),
    item("Shimmer", "Shimmer"),
    item("Spinner", "Spinner"),
    item("Stack", "Stack"),
    item("Text", "Text")
  ),
  section(
    "FORM",
    item("Calendar", "Calendar"),
    item("Checkbox", "Checkbox"),
    item("ChoiceGroup", "ChoiceGroup"),
    item("ColorPicker", "ColorPicker"),
    item("ComboBox", "ComboBox"),
    item("DatePicker", "DatePicker"),
    item("Dropdown", "Dropdown"),
    item("Label", "Label"),
    item("MarqueeSelection", "MarqueeSelection"),
    item("PeoplePicker", "PeoplePicker"),
    item("Rating", "Rating"),
    item("Slider", "Slider"),
    item("SearchBox", "SearchBox"),
    item("SpinButton", "SpinButton"),
    item("SwatchColorPicker", "SwatchColorPicker"),
    item("TagPicker", "TagPicker"),
    item("TextField", "TextField"),
    item("Toggle", "Toggle")
  ),
  section(
    "OVERLAYS",
    item("Dialog", "Dialog"),
    item("Modal", "Modal"),
    item("Overlay", "Overlay"),
    item("Panel", "Panel")
  ),
  section(
    "POPUPS",
    item("Callout", "Callout"),
    item("Coachmark", "Coachmark"),
    item("ContextualMenu", "ContextualMenu"),
    item("HoverCard", "HoverCard"),
    item("Layer", "Layer"),
    item("TeachingBubble", "TeachingBubble"),
    item("Tooltip", "Tooltip")
  ),
  section(
    "THEMES"
    # TODO
    # item("Theme", "Theme"),
    # item("ThemeAlternative", "ThemeAlternative")
  )
)
items <- do.call(c, lapply(sections, `[[`, "items"))

makeNav <- function(sections) {
  lapply(sections, function(section) {
    tagList(
      tags$h6(section$name),
      tags$ul(lapply(section$items, function(item) {
        tags$li(
          tags$a(item$name, href = route_link(item$id))
        )
      }))
    )
  })
}

readExample <- function(id) {
  path <- file.path("..", paste0(id, ".R"))
  code <- readChar(path, file.info(path)$size)
  module <- new.env()
  source(path, local = module)
  print(module$server)
  list(code = code, ui = module$ui, server = module$server)
}

makePage <- function(id, name, ui, code) {
  tagList(
    tags$h1(name),
    tags$h3("Example"),
    # The ID is used to locate the example in Cypress tests.
    tags$div(`data-example-id` = id, ui),
    tags$br(),
    tags$h3("Code"),
    tags$pre(code)
  )
}

makeRouter <- function(items) {
  routes <- lapply(items, function(item) {
    example <- readExample(item$id)
    route(
      path = item$id,
      ui = makePage(
        id = item$id,
        name = item$name,
        ui = example$ui(item$id),
        code = example$code
      ),
      server = function() example$server(item$id)
    )
  })
  do.call(shiny.router::make_router, routes)
}

router <- makeRouter(items)

style <- tags$head(tags$style(HTML("
  .grid {
    display: grid;
    grid-template-columns: 200px minmax(0, 1fr);
    gap: 1em;
  }
")))

shinyApp(
  ui = tagList(
    style,
    tags$div(
      class = "grid",
      tags$nav(makeNav(sections)),
      tags$main(router$ui)
    )
  ),
  server = function(input, output) {
    router$server()
  }
)
