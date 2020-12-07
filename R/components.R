#' shiny.fluent JS dependency.
#'
#' @export
html_dependency <- function() {
  htmltools::htmlDependency(
    name = "shiny.fluent",
    version = "1.0.0",
    src = "www/shiny.fluent",
    package = "shiny.fluent",
    script = "components.js"
  )
}

make_input <- function(...) {
  shiny.react::make_input(html_dependency(), "shiny.fluent", ...)
}

make_output <- function(...) {
  shiny.react::make_output(html_dependency(), "shiny.fluent", ...)
}


#' @rdname Calendar
#' @export
Calendar <- make_input("Calendar")

#' @rdname Calendar
#' @export
updateCalendar <- shiny.react::update_input

#' @rdname Checkbox
#' @export
Checkbox <- make_input("Checkbox")

#' @rdname Checkbox
#' @export
updateCheckbox <- shiny.react::update_input

#' @rdname ChoiceGroup
#' @export
ChoiceGroup <- make_input("ChoiceGroup")

#' @rdname ChoiceGroup
#' @export
updateChoiceGroup <- shiny.react::update_input

#' @rdname ColorPicker
#' @export
ColorPicker <- make_input("ColorPicker")

#' @rdname ColorPicker
#' @export
updateColorPicker <- shiny.react::update_input

#' @rdname ComboBox
#' @export
ComboBox <- make_input("ComboBox")

#' @rdname ComboBox
#' @export
updateComboBox <- shiny.react::update_input

#' @rdname DatePicker
#' @export
DatePicker <- make_input("DatePicker")

#' @rdname DatePicker
#' @export
updateDatePicker <- shiny.react::update_input

#' @rdname Dropdown
#' @export
Dropdown <- make_input("Dropdown")

#' @rdname Dropdown
#' @export
updateDropdown <- shiny.react::update_input

#' @rdname TextField
#' @export
MaskedTextField <- make_input("MaskedTextField")

#' @rdname TextField
#' @export
updateMaskedTextField <- shiny.react::update_input

#' @rdname Rating
#' @export
Rating <- make_input("Rating")

#' @rdname Rating
#' @export
updateRating <- shiny.react::update_input

#' @rdname SearchBox
#' @export
SearchBox <- make_input("SearchBox")

#' @rdname SearchBox
#' @export
updateSearchBox <- shiny.react::update_input

#' @rdname Slider
#' @export
Slider <- make_input("Slider")

#' @rdname Slider
#' @export
updateSlider <- shiny.react::update_input

#' @rdname SpinButton
#' @export
SpinButton <- make_input("SpinButton")

#' @rdname SpinButton
#' @export
updateSpinButton <- shiny.react::update_input

#' @rdname SwatchColorPicker
#' @export
SwatchColorPicker <- make_input("SwatchColorPicker")

#' @rdname SwatchColorPicker
#' @export
updateSwatchColorPicker <- shiny.react::update_input

#' @rdname TextField
#' @export
TextField <- make_input("TextField")

#' @rdname TextField
#' @export
updateTextField <- shiny.react::update_input

#' @rdname Toggle
#' @export
Toggle <- make_input("Toggle")

#' @rdname Toggle
#' @export
updateToggle <- shiny.react::update_input

#' @rdname ComboBox
#' @export
VirtualizedComboBox <- make_input("VirtualizedComboBox")

#' @rdname ComboBox
#' @export
updateVirtualizedComboBox <- shiny.react::update_input

# We need 0 as the default value to ensure the button does not trigger an event on render.

#' @rdname Button
#' @export
ActionButton <- make_input("ActionButton", default_value = 0)

#' @rdname Button
#' @export
CommandBarButton <- make_input("CommandBarButton", default_value = 0)

#' @rdname Button
#' @export
CommandButton <- make_input("CommandButton", default_value = 0)

#' @rdname Button
#' @export
CompoundButton <- make_input("CompoundButton", default_value = 0)

#' @rdname Button
#' @export
DefaultButton <- make_input("DefaultButton", default_value = 0)

#' @rdname Button
#' @export
IconButton <- make_input("IconButton", default_value = 0)

#' @rdname Button
#' @export
PrimaryButton <- make_input("PrimaryButton", default_value = 0)


#' @rdname ActivityItem
#' @export
ActivityItem <- make_output("ActivityItem")

#' @rdname Announced
#' @export
Announced <- make_output("Announced")

#' @rdname Pickers
#' @export
BasePickerListBelow <- make_output("BasePickerListBelow")

#' @rdname Breadcrumb
#' @export
Breadcrumb <- make_output("Breadcrumb")

#' @rdname Callout
#' @export
Callout <- make_output("Callout")

#' @rdname Coachmark
#' @export
Coachmark <- make_output("Coachmark")

#' @rdname CommandBar
#' @export
CommandBar <- make_output("CommandBar")

#' @rdname PeoplePicker
#' @export
CompactPeoplePicker <- make_output("CompactPeoplePicker")

#' @rdname ContextualMenu
#' @export
ContextualMenu <- make_output("ContextualMenu")

#' @rdname DetailsList
#' @export
DetailsList <- make_output("DetailsList")

#' @rdname Dialog
#' @export
Dialog <- make_output("Dialog")

#' @rdname Dialog
#' @export
DialogFooter <- make_output("DialogFooter")

#' @rdname DocumentCard
#' @export
DocumentCard <- make_output("DocumentCard")

#' @rdname DocumentCard
#' @export
DocumentCardActions <- make_output("DocumentCardActions")

#' @rdname DocumentCard
#' @export
DocumentCardActivity <- make_output("DocumentCardActivity")

#' @rdname DocumentCard
#' @export
DocumentCardDetails <- make_output("DocumentCardDetails")

#' @rdname DocumentCard
#' @export
DocumentCardImage <- make_output("DocumentCardImage")

#' @rdname DocumentCard
#' @export
DocumentCardLocation <- make_output("DocumentCardLocation")

#' @rdname DocumentCard
#' @export
DocumentCardLogo <- make_output("DocumentCardLogo")

#' @rdname DocumentCard
#' @export
DocumentCardPreview <- make_output("DocumentCardPreview")

#' @rdname DocumentCard
#' @export
DocumentCardStatus <- make_output("DocumentCardStatus")

#' @rdname DocumentCard
#' @export
DocumentCardTitle <- make_output("DocumentCardTitle")

#' @rdname Facepile
#' @export
Facepile <- make_output("Facepile")

#' @rdname FocusTrapZone
#' @export
FocusTrapCallout <- make_output("FocusTrapCallout")

#' @rdname FocusTrapZone
#' @export
FocusTrapZone <- make_output("FocusTrapZone")

#' @rdname FocusZone
#' @export
FocusZone <- make_output("FocusZone")

#' @rdname Icon
#' @export
FontIcon <- make_output("FontIcon")

#' @rdname GroupedList
#' @export
GroupHeader <- make_output("GroupHeader")

#' @rdname GroupedList
#' @export
GroupedList <- make_output("GroupedList")

#' @rdname HoverCard
#' @export
HoverCard <- make_output("HoverCard")

#' @rdname Icon
#' @export
Icon <- make_output("Icon")

#' @rdname Image
#' @export
Image <- make_output("Image")

#' @rdname Icon
#' @export
ImageIcon <- make_output("ImageIcon")

#' @rdname Keytips
#' @export
KeytipLayer <- make_output("KeytipLayer")

#' @rdname Label
#' @export
Label <- make_output("Label")

#' @rdname Layer
#' @export
Layer <- make_output("Layer")

#' @rdname Layer
#' @export
LayerHost <- make_output("LayerHost")

#' @rdname Link
#' @export
Link <- make_output("Link")

#' @rdname List
#' @export
List <- make_output("List")

#' @rdname MarqueeSelection
#' @export
MarqueeSelection <- make_output("MarqueeSelection")

#' @rdname MessageBar
#' @export
MessageBar <- make_output("MessageBar")

#' @rdname MessageBar
#' @export
MessageBarButton <- make_output("MessageBarButton")

#' @rdname Modal
#' @export
Modal <- make_output("Modal")

#' @rdname Nav
#' @export
Nav <- make_output("Nav")

#' @rdname PeoplePicker
#' @export
NormalPeoplePicker <- make_output("NormalPeoplePicker")

#' @rdname OverflowSet
#' @export
OverflowSet <- make_output("OverflowSet")

#' @rdname Overlay
#' @export
Overlay <- make_output("Overlay")

#' @rdname Panel
#' @export
Panel <- make_output("Panel")

#' @rdname Persona
#' @export
Persona <- make_output("Persona")

#' @rdname Pivot
#' @export
Pivot <- make_output("Pivot")

#' @rdname Pivot
#' @export
PivotItem <- make_output("PivotItem")

#' @rdname ProgressIndicator
#' @export
ProgressIndicator <- make_output("ProgressIndicator")

#' @rdname ResizeGroup
#' @export
ResizeGroup <- make_output("ResizeGroup")

#' @rdname ScrollablePane
#' @export
ScrollablePane <- make_output("ScrollablePane")

#' @rdname Separator
#' @export
Separator <- make_output("Separator")

#' @rdname Shimmer
#' @export
Shimmer <- make_output("Shimmer")

#' @rdname Shimmer
#' @export
ShimmerElementsGroup <- make_output("ShimmerElementsGroup")

#' @rdname Spinner
#' @export
Spinner <- make_output("Spinner")

#' @rdname Stack
#' @export
Stack <- make_output("Stack")

#' @rdname ScrollablePane
#' @export
Sticky <- make_output("Sticky")

#' @rdname Pickers
#' @export
TagPicker <- make_output("TagPicker")

#' @rdname TeachingBubble
#' @export
TeachingBubble <- make_output("TeachingBubble")

#' @rdname TeachingBubble
#' @export
TeachingBubbleContent <- make_output("TeachingBubbleContent")

#' @rdname Text
#' @export
Text <- make_output("Text")

#' @rdname Tooltip
#' @export
TooltipHost <- make_output("TooltipHost")

#' @rdname Divider
#' @export
VerticalDivider <- make_output("VerticalDivider")
