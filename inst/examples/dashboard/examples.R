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

makeText <- function(text) {
  strsplit(text, "\\n\\n")[[1]] %>%
    map(Text) %>%
    Stack(tokens = list(childrenGap = 10))
}

makeExamplePage <- function(name, example) {
  help <- getHelpList(name)
  makePage(
    name,
    "Fluent UI component",
    div(
      makeCard("Description", makeText(help$description)),
      makeCard("Usage", pre(help$usage)),
      imap(example, makeLiveExamplePage)
    )
  )
}

makeLiveExamplePage <- function(example, id) {
  tagList(
    makeCard("Live example", div(style = "padding: 20px", example$ui(id))),
    makeCard("Live example code", pre(example$code))
  )
}

makeExampleRoute <- function(name) {
  examples_files <- list.files(
    system.file("examples", package = "shiny.fluent"),
    full.names = TRUE
  )
  # Match on component names with optional digits at the end
  pattern <- paste0("^", name, "([0-9]+)?.R")
  path <- examples_files[grepl(pattern, basename(examples_files))]
  examples_names  <- tools::file_path_sans_ext(basename(path))
  example <- path %>%
    map(readExample) %>%
    set_names(examples_names)

  list(
    server = map(example, "server"),
    router = route(
      path = name,
      ui = makeExamplePage(
        name = name,
        example = example
      )
    )
  )
}
