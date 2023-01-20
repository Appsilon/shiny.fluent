#' Documentation template for components with `.shinyInput` wrappers
#'
#' @param inputId ID of the component.
#' @param value Starting value.
#' @param session Object passed as the `session` argument to Shiny server.
#' @param ... Props to pass to the component.
#' The allowed props are listed below in the \bold{Details} section.
#'
#' @return
#' Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
#' The update functions return nothing (called for side effects).
#'
#' @keywords internal
#' @name shinyInput
NULL

#' Documentation template for remaining components
#'
#' @param ... Props to pass to the component.
#' The allowed props are listed below in the \bold{Details} section.
#'
#' @return
#' Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
#'
#' @keywords internal
#' @name component
NULL

component <- function(name) {
  function(...) shiny.react::reactElement(
    module = "@fluentui/react", name = name,
    props = shiny.react::asProps(...),
    deps = shinyFluentDependency()
  )
}

#' @rdname Button
#' @inherit shinyInput params return
#' @export
ActionButton <- component("ActionButton")

#' @rdname ActivityItem
#' @inherit component params return
#' @export
ActivityItem <- component("ActivityItem")

#' @rdname Announced
#' @inherit component params return
#' @export
Announced <- component("Announced")

#' @rdname Pickers
#' @inherit component params return
#' @export
BasePickerListBelow <- component("BasePickerListBelow")

#' @rdname Breadcrumb
#' @inherit component params return
#' @export
Breadcrumb <- component("Breadcrumb")

#' @rdname Calendar
#' @inherit shinyInput params return
#' @export
Calendar <- component("Calendar")

#' @rdname Callout
#' @inherit component params return
#' @export
Callout <- component("Callout")

#' @rdname Checkbox
#' @inherit shinyInput params return
#' @export
Checkbox <- component("Checkbox")

#' @rdname ChoiceGroup
#' @inherit shinyInput params return
#' @export
ChoiceGroup <- component("ChoiceGroup")

#' @rdname Coachmark
#' @inherit component params return
#' @export
Coachmark <- component("Coachmark")

#' @rdname ColorPicker
#' @inherit shinyInput params return
#' @export
ColorPicker <- component("ColorPicker")

#' @rdname ComboBox
#' @inherit shinyInput params return
#' @export
ComboBox <- component("ComboBox")

#' @rdname CommandBar
#' @inherit component params return
#' @export
CommandBar <- component("CommandBar")

#' @rdname Button
#' @inherit component params return
#' @export
CommandBarButton <- component("CommandBarButton")

#' @rdname Button
#' @inherit component params return
#' @export
CommandButton <- component("CommandButton")

#' @rdname PeoplePicker
#' @inherit shinyInput params return
#' @export
CompactPeoplePicker <- component("CompactPeoplePicker")

#' @rdname Button
#' @inherit component params return
#' @export
CompoundButton <- component("CompoundButton")

#' @rdname ContextualMenu
#' @inherit component params return
#' @export
ContextualMenu <- component("ContextualMenu")

#' @rdname DatePicker
#' @inherit shinyInput params return
#' @export
DatePicker <- component("DatePicker")

#' @rdname Button
#' @inherit component params return
#' @export
DefaultButton <- component("DefaultButton")

#' @rdname DetailsList
#' @inherit component params return
#' @export
DetailsList <- component("DetailsList")

#' @rdname Dialog
#' @inherit component params return
#' @export
Dialog <- component("Dialog")

#' @rdname Dialog
#' @inherit component params return
#' @export
DialogFooter <- component("DialogFooter")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCard <- component("DocumentCard")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardActions <- component("DocumentCardActions")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardActivity <- component("DocumentCardActivity")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardDetails <- component("DocumentCardDetails")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardImage <- component("DocumentCardImage")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardLocation <- component("DocumentCardLocation")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardLogo <- component("DocumentCardLogo")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardPreview <- component("DocumentCardPreview")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardStatus <- component("DocumentCardStatus")

#' @rdname DocumentCard
#' @inherit component params return
#' @export
DocumentCardTitle <- component("DocumentCardTitle")

#' @rdname Dropdown
#' @inherit shinyInput params return
#' @export
Dropdown <- component("Dropdown")

#' @rdname Facepile
#' @inherit component params return
#' @export
Facepile <- component("Facepile")

#' @rdname FocusTrapZone
#' @inherit component params return
#' @export
FocusTrapCallout <- component("FocusTrapCallout")

#' @rdname FocusTrapZone
#' @inherit component params return
#' @export
FocusTrapZone <- component("FocusTrapZone")

#' @rdname FocusZone
#' @inherit component params return
#' @export
FocusZone <- component("FocusZone")

#' @rdname Icon
#' @inherit component params return
#' @export
FontIcon <- component("FontIcon")

#' @rdname GroupedList
#' @inherit component params return
#' @export
GroupedList <- component("GroupedList")

#' @rdname GroupedList
#' @inherit component params return
#' @export
GroupHeader <- component("GroupHeader")

#' @rdname HoverCard
#' @inherit component params return
#' @export
HoverCard <- component("HoverCard")

#' @rdname Icon
#' @inherit component params return
#' @export
Icon <- component("Icon")

#' @rdname Button
#' @inherit component params return
#' @export
IconButton <- component("IconButton")

#' @rdname Image
#' @inherit component params return
#' @export
Image <- component("Image")

#' @rdname Icon
#' @inherit component params return
#' @export
ImageIcon <- component("ImageIcon")

#' @rdname Keytips
#' @inherit component params return
#' @export
KeytipLayer <- component("KeytipLayer")

#' @rdname Label
#' @inherit component params return
#' @export
Label <- component("Label")

#' @rdname Layer
#' @inherit component params return
#' @export
Layer <- component("Layer")

#' @rdname Layer
#' @inherit component params return
#' @export
LayerHost <- component("LayerHost")

#' @rdname Link
#' @inherit component params return
#' @export
Link <- component("Link")

#' @rdname List
#' @inherit component params return
#' @export
List <- component("List")

#' @rdname MarqueeSelection
#' @inherit component params return
#' @export
MarqueeSelection <- component("MarqueeSelection")

#' @rdname TextField
#' @inherit shinyInput params return
#' @export
MaskedTextField <- component("MaskedTextField")

#' @rdname MessageBar
#' @inherit component params return
#' @export
MessageBar <- component("MessageBar")

#' @rdname MessageBar
#' @inherit component params return
#' @export
MessageBarButton <- component("MessageBarButton")

#' @rdname Modal
#' @inherit component params return
#' @export
Modal <- component("Modal")

#' @rdname Nav
#' @inherit component params return
#' @export
Nav <- component("Nav")

#' @rdname PeoplePicker
#' @inherit component params return
#' @export
NormalPeoplePicker <- component("NormalPeoplePicker")

#' @rdname OverflowSet
#' @inherit component params return
#' @export
OverflowSet <- component("OverflowSet")

#' @rdname Overlay
#' @inherit component params return
#' @export
Overlay <- component("Overlay")

#' @rdname Panel
#' @inherit component params return
#' @export
Panel <- component("Panel")

#' @rdname Persona
#' @inherit component params return
#' @export
Persona <- component("Persona")

#' @rdname Pivot
#' @inherit component params return
#' @export
Pivot <- component("Pivot")

#' @rdname Pivot
#' @inherit component params return
#' @export
PivotItem <- component("PivotItem")

#' @rdname Button
#' @inherit component params return
#' @export
PrimaryButton <- component("PrimaryButton")

#' @rdname ProgressIndicator
#' @inherit component params return
#' @export
ProgressIndicator <- component("ProgressIndicator")

#' @rdname Rating
#' @inherit shinyInput params return
#' @export
Rating <- component("Rating")

#' @rdname ResizeGroup
#' @inherit component params return
#' @export
ResizeGroup <- component("ResizeGroup")

#' @rdname ScrollablePane
#' @inherit component params return
#' @export
ScrollablePane <- component("ScrollablePane")

#' @rdname SearchBox
#' @inherit shinyInput params return
#' @export
SearchBox <- component("SearchBox")

#' @rdname Separator
#' @inherit component params return
#' @export
Separator <- component("Separator")

#' @rdname Shimmer
#' @inherit component params return
#' @export
Shimmer <- component("Shimmer")

#' @rdname Shimmer
#' @inherit component params return
#' @export
ShimmerElementsGroup <- component("ShimmerElementsGroup")

#' @rdname Shimmer
#' @inherit component params return
#' @export
ShimmeredDetailsList <- component("ShimmeredDetailsList")

#' @rdname Slider
#' @inherit shinyInput params return
#' @export
Slider <- component("Slider")

#' @rdname SpinButton
#' @inherit shinyInput params return
#' @export
SpinButton <- component("SpinButton")

#' @rdname Spinner
#' @inherit component params return
#' @export
Spinner <- component("Spinner")

#' @rdname Stack
#' @inherit component params return
#' @export
Stack <- component("Stack")

#' @rdname Stack
#' @inherit component params return
#' @export
Stack <- component("Stack")

#' @rdname ScrollablePane
#' @inherit component params return
#' @export
Sticky <- component("Sticky")

#' @rdname SwatchColorPicker
#' @inherit shinyInput params return
#' @export
SwatchColorPicker <- component("SwatchColorPicker")

#' @rdname Pickers
#' @inherit component params return
#' @export
TagPicker <- component("TagPicker")

#' @rdname TeachingBubble
#' @inherit component params return
#' @export
TeachingBubble <- component("TeachingBubble")

#' @rdname TeachingBubble
#' @inherit component params return
#' @export
TeachingBubbleContent <- component("TeachingBubbleContent")

#' @rdname Text
#' @inherit component params return
#' @export
Text <- component("Text")

#' @rdname TextField
#' @inherit component params return
#' @export
TextField <- component("TextField")

#' @rdname TextField
#' @inherit component params return
#' @export
TextField <- component("TextField")

#' @rdname Theme
#' @inherit component params return
#' @export
ThemeProvider <- component("ThemeProvider")

#' @rdname Toggle
#' @inherit shinyInput params return
#' @export
Toggle <- component("Toggle")

#' @rdname Tooltip
#' @inherit component params return
#' @export
TooltipHost <- component("TooltipHost")

#' @rdname Divider
#' @inherit component params return
#' @export
VerticalDivider <- component("VerticalDivider")

#' @rdname ComboBox
#' @inherit component params return
#' @export
VirtualizedComboBox <- component("VirtualizedComboBox")
