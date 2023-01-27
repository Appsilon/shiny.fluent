#
# Read all the examples on the parent directory and create a list
# where each element is a shiny dashboard with a 'ui´ and ´sever´ elements
  buildExamples <- function(exampleFiles = NULL, excludePatterns = "Theme") {
  if (is.null(exampleFiles)) {
    exampleFiles <- base::system.file(
      file.path('inst', 'examples'), 
      package = "shiny.fluent"
    ) 
    exampleFiles <- file.path("..") %>%
      list.files(pattern = "[.][rR]$", full.names = TRUE)
  }
  
    exampleFiles <- exampleFiles |> 
    purrr::discard(function(x) {
      stringr::str_detect(tolower(x), tolower(excludePatterns))
    })
    
  examples <- lapply(exampleFiles, function(path) {
    code <- readChar(path, file.info(path)$size)
    module <- new.env()
    source(path, local = module)
    list(
      code = code, 
      ui = module$ui("app"), 
      server = function(input, output) module$server("app")
    )
  })
  
  names(examples) <- basename(exampleFiles) %>%
    tools::file_path_sans_ext()
  
  examples
}

##
## Uses examples on package

# examples <- buildExamples()

## 
## Uses explicit list of examples

examples <- c(
  "ActivityItem.R", "Announced.R", "Breadcrumb.R", "Button.R", "Calendar.R",
  "Callout.R", "Checkbox.R", "ChoiceGroup.R", "Coachmark.R", "ColorPicker.R",
  "ComboBox.R", "CommandBar.R", "ContextualMenu.R", "DatePicker.R",
  "DetailsList.R", "Dialog.R", "DocumentCard.R", "Dropdown.R", "Facepile.R",
  "FocusTrapZone.R", "FocusZone.R", "GroupedList.R", "HoverCard.R", "Icon.R",
  "Image.R", "Keytips.R", "Label.R", "LayerHost.R", "Layer.R", "Link.R",
  "List.R", "MarqueeSelection.R", "MessageBar.R", "Modal.R", "Nav.R",
  "OverflowSet.R", "Overlay.R", "Panel.R", "PeoplePicker.R", "Persona.R",
  "Pivot.R", "ProgressIndicator.R", "Rating.R", "ResizeGroup.R",
  "ScrollablePane.R", "SearchBox.R", "Separator.R", "Shimmer.R", "Slider.R",
  "SpinButton.R", "Spinner.R", "Stack.R", "SwatchColorPicker.R", "TagPicker.R",
  "TeachingBubble.R", "TextField.R", "Text.R",
  #"Theme1.R", "Theme2.R",
  "Toggle.R","Tooltip.R"
) %>%
  file.path("..", .)  %>%
  buildExamples()
