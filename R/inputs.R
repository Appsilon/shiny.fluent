button <- function(name) {
  function(inputId, ...) shiny.react::reactElement(
    module = "@/shiny.fluent", name = name,
    props = shiny.react::asProps(inputId = inputId, ...),
    deps = shinyFluentDependency()
  )
}

#' @rdname Button
#' @export
ActionButton.shinyInput <- button("ActionButton")

#' @rdname Button
#' @export
updateActionButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
CommandBarButton.shinyInput <- button("CommandBarButton")

#' @rdname Button
#' @export
updateCommandBarButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
CommandButton.shinyInput <- button("CommandButton")

#' @rdname Button
#' @export
updateCommandButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
CompoundButton.shinyInput <- button("CompoundButton")

#' @rdname Button
#' @export
updateCompoundButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
DefaultButton.shinyInput <- button("DefaultButton")

#' @rdname Button
#' @export
updateDefaultButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
IconButton.shinyInput <- button("IconButton")

#' @rdname Button
#' @export
updateIconButton.shinyInput <- shiny.react::updateReactInput

#' @rdname Button
#' @export
PrimaryButton.shinyInput <- button("PrimaryButton")

#' @rdname Button
#' @export
updatePrimaryButton.shinyInput <- shiny.react::updateReactInput

input <- function(name, defaultValue) {
  function(inputId, ..., value = defaultValue) shiny.react::reactElement(
    module = "@/shiny.fluent", name = name,
    props = shiny.react::asProps(inputId = inputId, ..., value = value),
    deps = shinyFluentDependency()
  )
}

#' @rdname Calendar
#' @export
Calendar.shinyInput <- input("Calendar", NULL)

#' @rdname Calendar
#' @export
updateCalendar.shinyInput <- shiny.react::updateReactInput

#' @rdname Checkbox
#' @export
Checkbox.shinyInput <- input("Checkbox", FALSE)

#' @rdname Checkbox
#' @export
updateCheckbox.shinyInput <- shiny.react::updateReactInput

#' @rdname ChoiceGroup
#' @export
ChoiceGroup.shinyInput <- input("ChoiceGroup", NULL)

#' @rdname ChoiceGroup
#' @export
updateChoiceGroup.shinyInput <- shiny.react::updateReactInput

#' @rdname ColorPicker
#' @export
ColorPicker.shinyInput <- input("ColorPicker", "#ffffff")

#' @rdname ColorPicker
#' @export
updateColorPicker.shinyInput <- shiny.react::updateReactInput

#' @rdname ComboBox
#' @export
ComboBox.shinyInput <- input("ComboBox", NULL)

#' @rdname ComboBox
#' @export
updateComboBox.shinyInput <- shiny.react::updateReactInput

#' @rdname DatePicker
#' @export
DatePicker.shinyInput <- input("DatePicker", NULL)

#' @rdname DatePicker
#' @export
updateDatePicker.shinyInput <- shiny.react::updateReactInput

#' @rdname Dropdown
#' @export
Dropdown.shinyInput <- input("Dropdown", NULL)

#' @rdname Dropdown
#' @export
updateDropdown.shinyInput <- shiny.react::updateReactInput

#' @rdname PeoplePicker
#' @export
NormalPeoplePicker.shinyInput <- input("NormalPeoplePicker", list())

#' @rdname PeoplePicker
#' @export
updateNormalPeoplePicker.shinyInput <- shiny.react::updateReactInput

#' @rdname Rating
#' @export
Rating.shinyInput <- input("Rating", 1)

#' @rdname Rating
#' @export
updateRating.shinyInput <- shiny.react::updateReactInput

#' @rdname SearchBox
#' @export
SearchBox.shinyInput <- input("SearchBox", "")

#' @rdname SearchBox
#' @export
updateSearchBox.shinyInput <- shiny.react::updateReactInput

#' @rdname Slider
#' @export
Slider.shinyInput <- input("Slider", 0)

#' @rdname Slider
#' @export
updateSlider.shinyInput <- shiny.react::updateReactInput

#' @rdname SpinButton
#' @export
SpinButton.shinyInput <- input("SpinButton", 0)

#' @rdname SpinButton
#' @export
updateSpinButton.shinyInput <- shiny.react::updateReactInput

#' @rdname SwatchColorPicker
#' @export
SwatchColorPicker.shinyInput <- input("SwatchColorPicker", NULL)

#' @rdname SwatchColorPicker
#' @export
updateSwatchColorPicker.shinyInput <- shiny.react::updateReactInput

#' @rdname TextField
#' @export
TextField.shinyInput <- input("TextField", "")

#' @rdname TextField
#' @export
updateTextField.shinyInput <- shiny.react::updateReactInput

#' @rdname Toggle
#' @export
Toggle.shinyInput <- input("Toggle", FALSE)

#' @rdname Toggle
#' @export
updateToggle.shinyInput <- shiny.react::updateReactInput
