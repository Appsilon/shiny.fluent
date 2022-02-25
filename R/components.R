component <- function(name) {
  function(...) shiny.react::reactElement(
    module = "@fluentui/react", name = name,
    props = shiny.react::asProps(...),
    deps = shinyFluentDependency()
  )
}

#' @rdname Button
#' @export
ActionButton <- component("ActionButton")

#' @rdname ActivityItem
#' @export
ActivityItem <- component("ActivityItem")

#' @rdname Announced
#' @export
Announced <- component("Announced")

#' @rdname Pickers
#' @export
BasePickerListBelow <- component("BasePickerListBelow")

#' @rdname Breadcrumb
#' @export
Breadcrumb <- component("Breadcrumb")

#' @rdname Calendar
#' @export
Calendar <- component("Calendar")

#' @rdname Callout
#' @export
Callout <- component("Callout")

#' @rdname Checkbox
#' @export
Checkbox <- component("Checkbox")

#' @rdname Checkbox
#' @export
Checkbox <- component("Checkbox")

#' @rdname ChoiceGroup
#' @export
ChoiceGroup <- component("ChoiceGroup")

#' @rdname Coachmark
#' @export
Coachmark <- component("Coachmark")

#' @rdname ColorPicker
#' @export
ColorPicker <- component("ColorPicker")

#' @rdname ComboBox
#' @export
ComboBox <- component("ComboBox")

#' @rdname CommandBar
#' @export
CommandBar <- component("CommandBar")

#' @rdname Button
#' @export
CommandBarButton <- component("CommandBarButton")

#' @rdname Button
#' @export
CommandButton <- component("CommandButton")

#' @rdname PeoplePicker
#' @export
CompactPeoplePicker <- component("CompactPeoplePicker")

#' @rdname Button
#' @export
CompoundButton <- component("CompoundButton")

#' @rdname ContextualMenu
#' @export
ContextualMenu <- component("ContextualMenu")

#' @rdname DatePicker
#' @export
DatePicker <- component("DatePicker")

#' @rdname Button
#' @export
DefaultButton <- component("DefaultButton")

#' @rdname DetailsList
#' @export
DetailsList <- component("DetailsList")

#' @rdname Dialog
#' @export
Dialog <- component("Dialog")

#' @rdname Dialog
#' @export
DialogFooter <- component("DialogFooter")

#' @rdname DocumentCard
#' @export
DocumentCard <- component("DocumentCard")

#' @rdname DocumentCard
#' @export
DocumentCardActions <- component("DocumentCardActions")

#' @rdname DocumentCard
#' @export
DocumentCardActivity <- component("DocumentCardActivity")

#' @rdname DocumentCard
#' @export
DocumentCardDetails <- component("DocumentCardDetails")

#' @rdname DocumentCard
#' @export
DocumentCardImage <- component("DocumentCardImage")

#' @rdname DocumentCard
#' @export
DocumentCardLocation <- component("DocumentCardLocation")

#' @rdname DocumentCard
#' @export
DocumentCardLogo <- component("DocumentCardLogo")

#' @rdname DocumentCard
#' @export
DocumentCardPreview <- component("DocumentCardPreview")

#' @rdname DocumentCard
#' @export
DocumentCardStatus <- component("DocumentCardStatus")

#' @rdname DocumentCard
#' @export
DocumentCardTitle <- component("DocumentCardTitle")

#' @rdname Dropdown
#' @export
Dropdown <- component("Dropdown")

#' @rdname Facepile
#' @export
Facepile <- component("Facepile")

#' @rdname FocusTrapZone
#' @export
FocusTrapCallout <- component("FocusTrapCallout")

#' @rdname FocusTrapZone
#' @export
FocusTrapZone <- component("FocusTrapZone")

#' @rdname FocusZone
#' @export
FocusZone <- component("FocusZone")

#' @rdname Icon
#' @export
FontIcon <- component("FontIcon")

#' @rdname GroupedList
#' @export
GroupedList <- component("GroupedList")

#' @rdname GroupedList
#' @export
GroupHeader <- component("GroupHeader")

#' @rdname HoverCard
#' @export
HoverCard <- component("HoverCard")

#' @rdname Icon
#' @export
Icon <- component("Icon")

#' @rdname Button
#' @export
IconButton <- component("IconButton")

#' @rdname Image
#' @export
Image <- component("Image")

#' @rdname Icon
#' @export
ImageIcon <- component("ImageIcon")

#' @rdname Keytips
#' @export
KeytipLayer <- component("KeytipLayer")

#' @rdname Label
#' @export
Label <- component("Label")

#' @rdname Layer
#' @export
Layer <- component("Layer")

#' @rdname Layer
#' @export
LayerHost <- component("LayerHost")

#' @rdname Link
#' @export
Link <- component("Link")

#' @rdname List
#' @export
List <- component("List")

#' @rdname MarqueeSelection
#' @export
MarqueeSelection <- component("MarqueeSelection")

#' @rdname TextField
#' @export
MaskedTextField <- component("MaskedTextField")

#' @rdname MessageBar
#' @export
MessageBar <- component("MessageBar")

#' @rdname MessageBar
#' @export
MessageBarButton <- component("MessageBarButton")

#' @rdname Modal
#' @export
Modal <- component("Modal")

#' @rdname Nav
#' @export
Nav <- component("Nav")

#' @rdname PeoplePicker
#' @export
NormalPeoplePicker <- component("NormalPeoplePicker")

#' @rdname OverflowSet
#' @export
OverflowSet <- component("OverflowSet")

#' @rdname Overlay
#' @export
Overlay <- component("Overlay")

#' @rdname Panel
#' @export
Panel <- component("Panel")

#' @rdname Persona
#' @export
Persona <- component("Persona")

#' @rdname Pivot
#' @export
Pivot <- component("Pivot")

#' @rdname Pivot
#' @export
PivotItem <- component("PivotItem")

#' @rdname Button
#' @export
PrimaryButton <- component("PrimaryButton")

#' @rdname ProgressIndicator
#' @export
ProgressIndicator <- component("ProgressIndicator")

#' @rdname Rating
#' @export
Rating <- component("Rating")

#' @rdname ResizeGroup
#' @export
ResizeGroup <- component("ResizeGroup")

#' @rdname ScrollablePane
#' @export
ScrollablePane <- component("ScrollablePane")

#' @rdname SearchBox
#' @export
SearchBox <- component("SearchBox")

#' @rdname Separator
#' @export
Separator <- component("Separator")

#' @rdname Shimmer
#' @export
Shimmer <- component("Shimmer")

#' @rdname Shimmer
#' @export
ShimmerElementsGroup <- component("ShimmerElementsGroup")

#' @rdname Shimmer
#' @export
ShimmeredDetailsList <- component("ShimmeredDetailsList")

#' @rdname Slider
#' @export
Slider <- component("Slider")

#' @rdname SpinButton
#' @export
SpinButton <- component("SpinButton")

#' @rdname Spinner
#' @export
Spinner <- component("Spinner")

#' @rdname Stack
#' @export
Stack <- component("Stack")

#' @rdname Stack
#' @export
Stack <- component("Stack")

#' @rdname ScrollablePane
#' @export
Sticky <- component("Sticky")

#' @rdname SwatchColorPicker
#' @export
SwatchColorPicker <- component("SwatchColorPicker")

#' @rdname Pickers
#' @export
TagPicker <- component("TagPicker")

#' @rdname TeachingBubble
#' @export
TeachingBubble <- component("TeachingBubble")

#' @rdname TeachingBubble
#' @export
TeachingBubbleContent <- component("TeachingBubbleContent")

#' @rdname Text
#' @export
Text <- component("Text")

#' @rdname TextField
#' @export
TextField <- component("TextField")

#' @rdname TextField
#' @export
TextField <- component("TextField")

#' @rdname Theme
#' @export
ThemeProvider <- component("ThemeProvider")

#' @rdname Toggle
#' @export
Toggle <- component("Toggle")

#' @rdname Tooltip
#' @export
TooltipHost <- component("TooltipHost")

#' @rdname Divider
#' @export
VerticalDivider <- component("VerticalDivider")

#' @rdname ComboBox
#' @export
VirtualizedComboBox <- component("VirtualizedComboBox")
