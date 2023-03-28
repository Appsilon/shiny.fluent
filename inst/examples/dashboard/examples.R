examples <- c(
  "ActivityItem",
  "Announced",
  "Breadcrumb",
  "Button",
  "Calendar",
  "Callout",
  "Checkbox",
  "ChoiceGroup",
  "Coachmark",
  "ColorPicker",
  "ComboBox",
  "CommandBar",
  "ContextualMenu",
  "DatePicker",
  "DetailsList",
  "Dialog",
  "DocumentCard",
  "Dropdown",
  "Facepile",
  "FocusTrapZone",
  "FocusZone",
  "GroupedList",
  "HoverCard",
  "Icon",
  "Image",
  "Keytips",
  "Label",
  "Layer",
  "LayerHost",
  "Link",
  "List",
  "MarqueeSelection",
  "MessageBar",
  "Modal",
  "Nav",
  "OverflowSet",
  "Overlay",
  "Panel",
  "PeoplePicker",
  "Persona",
  "Pivot",
  "ProgressIndicator",
  "Rating",
  "ResizeGroup",
  "ScrollablePane",
  "SearchBox",
  "Separator",
  "Shimmer",
  "Slider",
  "SpinButton",
  "Spinner",
  "Stack",
  "SwatchColorPicker",
  "TagPicker",
  "TeachingBubble",
  "Text",
  "TextField",
  "ThemeProvider",
  "Toggle",
  "Tooltip"
)

# R help via https://stackoverflow.com/a/8983386
Rd2list <- function(Rd) {
  names(Rd) <- substring(sapply(Rd, attr, "Rd_tag"), 2)
  temp_args <- Rd$arguments

  Rd$arguments <- NULL
  myrd <- lapply(Rd, unlist)
  myrd <- lapply(myrd, paste, collapse = "")

  temp_args <-
    temp_args[sapply(temp_args , attr, "Rd_tag") == "\\item"]
  temp_args <- lapply(temp_args, lapply, paste, collapse = "")
  temp_args <- lapply(temp_args, "names<-", c("arg", "description"))
  myrd$arguments <- temp_args

  myrd
}

getHelpList <- function(...) {
  thefile <- help(...)
  myrd <- utils:::.getHelpFile(thefile)
  Rd2list(myrd)
}

readExample <- function(path) {
  code <- readChar(path, file.info(path)$size)
  module <- new.env()
  source(path, local = module)
  list(code = code, ui = module$ui, server = module$server)
}

makeExamplePage <- function(name, ui, code) {
  help <- getHelpList(name)
  makePage(
    name,
    "Fluent UI component",
    div(
      makeCard("Description", Text(nowrap = FALSE, help$description)),
      makeCard("Usage", pre(help$usage)),
      makeCard("Live example", div(style = "padding: 20px", ui)),
      makeCard("Live example code", pre(code))
    )
  )
}

makeExampleRoute <- function(name) {
  path <- system.file(file.path("examples", paste0(name, ".R")), package = "shiny.fluent")
  example <- readExample(path)
  example_server <- list()
  example_server[[name]] <- example$server
  return(
    list(
      server = example_server,
      router = route(
        path = name,
        ui = makeExamplePage(
          name = name,
          ui = example$ui(name),
          code = example$code
        )
      )
    )
  )
}
