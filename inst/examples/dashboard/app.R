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
    item("Calendar", "Calendar"),
    item("Callout", "Callout"),
    item("Checkbox", "Checkbox"),
    item("ChoiceGroup", "ChoiceGroup"),
    item("Coachmark", "Coachmark"),
    item("ColorPicker", "ColorPicker"),
    item("ComboBox", "ComboBox"),
    item("CommandBar", "CommandBar"),
    item("ContextualMenu", "ContextualMenu"),
    item("DatePicker", "DatePicker"),
    item("DetailsList", "DetailsList"),
    item("Dialog", "Dialog"),
    item("DocumentCard", "DocumentCard"),
    item("Dropdown", "Dropdown"),
    item("Facepile", "Facepile"),
    item("FocusTrapZone", "FocusTrapZone"),
    item("FocusZone", "FocusZone"),
    item("GroupedList", "GroupedList"),
    item("HoverCard", "HoverCard"),
    item("Icon", "Icon"),
    item("Image", "Image"),
    item("Keytips", "Keytips"),
    item("Label", "Label"),
    item("LayerHost", "LayerHost"),
    item("Layer", "Layer"),
    item("Link", "Link"),
    item("List", "List"),
    item("MarqueeSelection", "MarqueeSelection"),
    item("MessageBar", "MessageBar"),
    item("Modal", "Modal"),
    item("Nav", "Nav"),
    item("OverflowSet", "OverflowSet"),
    item("Overlay", "Overlay"),
    item("Panel", "Panel"),
    item("PeoplePicker", "PeoplePicker"),
    item("Persona", "Persona"),
    item("Pivot", "Pivot"),
    item("ProgressIndicator", "ProgressIndicator"),
    item("Rating", "Rating"),
    item("ResizeGroup", "ResizeGroup"),
    item("ScrollablePane", "ScrollablePane"),
    item("SearchBox", "SearchBox"),
    item("Separator", "Separator"),
    item("Shimmer", "Shimmer"),
    item("Slider", "Slider"),
    item("SpinButton", "SpinButton"),
    item("Spinner", "Spinner"),
    item("Stack", "Stack"),
    item("SwatchColorPicker", "SwatchColorPicker"),
    item("TagPicker", "TagPicker"),
    item("TeachingBubble", "TeachingBubble"),
    item("TextField", "TextField"),
    item("Text", "Text"),
    #item("ThemeAlternative", "ThemeAlternative"),
    #item("Theme", "Theme"),
    item("Toggle", "Toggle"),
    item("Tooltip", "Tooltip")
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
    # item("", ""),
  ),
  section(
    "FORM CONTROLS"
  ),
  section(
    "FORM INPUTS"
  ),
  section(
    "OVERLAYS"
  ),
  section(
    "CONTEXT"
    # TODO: HotkeysProvider
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
