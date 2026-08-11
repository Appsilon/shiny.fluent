# Button

Buttons give people a way to trigger an action. They’re typically found
in forms, dialog panels, and dialogs. Some buttons are specialized
for particular tasks, such as navigation, repeated actions, or
presenting menus.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Button).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ActionButton(...)

CommandBarButton(...)

CommandButton(...)

CompoundButton(...)

DefaultButton(...)

IconButton(...)

PrimaryButton(...)

ActionButton.shinyInput(inputId, ...)

updateActionButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

CommandBarButton.shinyInput(inputId, ...)

updateCommandBarButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

CommandButton.shinyInput(inputId, ...)

updateCommandButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

CompoundButton.shinyInput(inputId, ...)

updateCompoundButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

DefaultButton.shinyInput(inputId, ...)

updateDefaultButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

IconButton.shinyInput(inputId, ...)

updateIconButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)

PrimaryButton.shinyInput(inputId, ...)

updatePrimaryButton.shinyInput(
  session = shiny::getDefaultReactiveDomain(),
  inputId,
  ...
)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

- inputId:

  ID of the component.

- session:

  Object passed as the `session` argument to Shiny server.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.
The update functions return nothing (called for side effects).

## Details

- **baseClassName** `string`  

- **variantClassName** `string`  

- **allowDisabledFocus** `boolean`  
  Whether the button can have focus in disabled mode

- **ariaDescription** `string`  
  Detailed description of the button for the benefit of screen readers.

Besides the compound button, other button types will need more
information provided to screen reader.

- **ariaHidden** `boolean`  
  If provided and is true it adds an 'aria-hidden' attribute instructing
  screen readers to ignore the element.

- **ariaLabel** `string`  
  The aria label of the button for the benefit of screen readers.

- **buttonType** `ButtonType`  
  Deprecated at v1.2.3, to be removed at \\= v2.0.0. Use specific button
  component instead.

- **checked** `boolean`  
  Whether the button is checked

- **className** `string`  
  If provided, additional class name to provide on the root element.

- **componentRef** `IRefObject<IButton>`  
  Optional callback to access the IButton interface. Use this instead of
  ref for accessing the public methods and properties of the component.

- **data** `any`  
  Any custom data the developer wishes to associate with the menu item.

- **defaultRender** `any`  
  yet unknown docs

- **description** `IStyle`  
  Style for the description text if applicable (for compound buttons.)
  Deprecated, use `secondaryText` instead.

- **disabled** `boolean`  
  Whether the button is disabled

- **getClassNames**
  `(theme: ITheme, className: string, variantClassName: string, iconClassName: string | undefined, menuIconClassName: string | undefined, disabled: boolean, checked: boolean, expanded: boolean, hasMenu: boolean, isSplit: boolean | undefined, allowDisabledFocus: boolean) => IButtonClassNames`  
  Method to provide the classnames to style a button. The default value
  for this prop is the getClassnames func defined in
  BaseButton.classnames.

- **getSplitButtonClassNames**
  `(disabled: boolean, expanded: boolean, checked: boolean, allowDisabledFocus: boolean) => ISplitButtonClassNames`  
  Method to provide the classnames to style a button. The default value
  for this prop is the getClassnames func defined in
  BaseButton.classnames.

- **href** `string`  
  If provided, this component will be rendered as an anchor.

- **iconProps** `IIconProps`  
  The props for the icon shown in the button.

- **keytipProps** `IKeytipProps`  
  Optional keytip for this button

- **menuAs** `IComponentAs<IContextualMenuProps>`  
  Render a custom menu in place of the normal one.

- **menuIconProps** `IIconProps`  
  The props for the icon shown when providing a menu dropdown.

- **menuProps** `IContextualMenuProps`  
  Props for button menu. Providing this will default to showing the menu
  icon. See menuIconProps for overriding how the default icon looks.
  Providing this in addition of onClick and setting the split property
  to true will render a SplitButton.

- **menuTriggerKeyCode** `KeyCodes | null`  
  Provides a custom KeyCode that can be used to open the button menu.
  The default KeyCode is the down arrow. A value of null can be provided
  to disable the key codes for opening the button menu.

- **onAfterMenuDismiss** `() => void`  
  Callback that runs after Button's contextualmenu was closed (removed
  from the DOM)

- **onMenuClick**
  `(ev?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>, button?: IButtonProps) => void`  
  Optional callback when menu is clicked.

- **onRenderAriaDescription** `IRenderFunction<IButtonProps>`  
  Custom render function for the aria description element.

- **onRenderChildren** `IRenderFunction<IButtonProps>`  
  Custom render function for rendering the button children.

- **onRenderDescription** `IRenderFunction<IButtonProps>`  
  Custom render function for the desciption text.

- **onRenderIcon** `IRenderFunction<IButtonProps>`  
  Custom render function for the icon

- **onRenderMenu** `IRenderFunction<IContextualMenuProps>`  
  Deprecated at v6.3.2, to be removed at \\= v7.0.0. Use `menuAs`
  instead.

- **onRenderMenuIcon** `IRenderFunction<IButtonProps>`  
  Custom render function for button menu icon

- **onRenderText** `IRenderFunction<IButtonProps>`  
  Custom render function for the label text.

- **persistMenu** `boolean`  
  Menu will not be created or destroyed when opened or closed, instead
  it will be hidden. This will improve perf of the menu opening but
  could potentially impact overall perf by having more elements in the
  dom. Should only be used when perf is important. Note: This may
  increase the amount of time it takes for the button itself to mount.

- **primary** `boolean`  
  Changes the visual presentation of the button to be emphasized (if
  defined)

- **primaryActionButtonProps** `IButtonProps`  
  Optional props to be applied only to the primary action button of
  SplitButton and not to the overall SplitButton container

- **primaryDisabled** `boolean`  
  If set to true and if this is a splitButton (split == true) then the
  primary action of a split button is disabled.

- **renderPersistedMenuHiddenOnMount** `boolean`  
  If true, the persisted menu is rendered hidden when the button
  initially mounts. Non-persisted menus will not be in the component
  tree unless they are being shown

Note: This increases the time the button will take to mount, but can
improve perceived menu open perf. when the user opens the menu.

- **rootProps**
  `React.ButtonHTMLAttributes<HTMLButtonElement> | React.AnchorHTMLAttributes<HTMLAnchorElement>`  
  Deprecated at v0.56.2, to be removed at \\= v1.0.0. Just pass in
  button props instead. they will be mixed into the button/anchor
  element rendered by the component.

- **secondaryText** `string`  
  Description of the action this button takes. Only used for compound
  buttons

- **split** `boolean`  
  If set to true, and if menuProps and onClick are provided, the button
  will render as a SplitButton.

- **splitButtonAriaLabel** `string`  
  Accessible label for the dropdown chevron button if this button is
  split.

- **splitButtonMenuProps** `IButtonProps`  
  Experimental prop that get passed into the menuButton that's rendered
  as part of split button. Anything passed in will likely need to have
  accompanying style changes.

- **styles** `IButtonStyles`  
  Custom styling for individual elements within the button DOM.

- **text** `string`  
  Text to render button label. If text is supplied, it will override any
  string in button children. Other children components will be passed
  through after the text.

- **theme** `ITheme`  
  Theme provided by HOC.

- **toggle** `boolean`  
  Whether button is a toggle button with distinct on and off states.
  This should be true for buttons that permanently change state when a
  press event finishes, such as a volume mute button.

- **toggled** `boolean`  
  Any custom data the developer wishes to associate with the menu item.
  Deprecated, use `checked` if setting state.

- **uniqueId** `string | number`  
  Unique id to identify the item. Typically a duplicate of key value.

## Best practices

### Layout

- For dialog boxes and panels, where people are moving through a
  sequence of screens, right-align buttons with the container.

- For single-page forms and focused tasks, left-align buttons with the
  container.

- Always place the primary button on the left, the secondary button just
  to the right of it.

- Show only one primary button that inherits theme color at rest state.
  If there are more than two buttons with equal priority, all buttons
  should have neutral backgrounds.

- Don't use a button to navigate to another place; use a link instead.
  The exception is in a wizard where "Back" and "Next" buttons may be
  used.

- Don't place the default focus on a button that destroys data. Instead,
  place the default focus on the button that performs the "safe act" and
  retains the content (such as "Save") or cancels the action (such as
  "Cancel").

### Content

- Use sentence-style capitalization—only capitalize the first word. For
  more info, see
  [Capitalization](https://learn.microsoft.com/style-guide/capitalization)
  in the Microsoft Writing Style Guide.

- Make sure it's clear what will happen when people interact with the
  button. Be concise; usually a single verb is best. Include a noun if
  there is any room for interpretation about what the verb means. For
  example, "Delete folder" or "Create account".

## Examples

``` r
# Example 1
library(shiny)
library(shiny.fluent)

tokens <- list(childrenGap = 20)

ui <- function(id) {
  ns <- NS(id)
  tags$div(
    Stack(
      DefaultButton.shinyInput(
        ns("button1"),
        text = "Default Button",
        styles = list("background: green")
      ),
      PrimaryButton.shinyInput(
        ns("button2"),
        text = "Primary Button"
      ),
      CompoundButton.shinyInput(
        ns("button3"),
        secondaryText = "Compound Button has additional text",
        text = "Compound Button"
      ),
      ActionButton.shinyInput(
        ns("button4"),
        iconProps = list("iconName" = "AddFriend"),
        text = "Action Button"
      ),
      horizontal = TRUE,
      tokens = tokens
    ),
    textOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    clicks <- reactiveVal(0)
    addClick <- function() { clicks(isolate(clicks() + 1)) }
    observeEvent(input$button0, addClick())
    observeEvent(input$button1, addClick())
    observeEvent(input$button2, addClick())
    observeEvent(input$button3, addClick())
    observeEvent(input$button4, addClick())
    output$text <- renderText({
      paste0("Clicks:", clicks())
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 2
library(shiny)
library(shiny.fluent)

# Split button with menu
menuProps <- list(
  items = list(
    list(
      key = "emailMessage",
      text = "Email message",
      onClick = JS("() => alert('Email message clicked')"),
      iconProps = list(
        iconName = "Mail"
      )
    ),
    list(
      key = "calendarEvent",
      text = "Calendar event",
      onClick = JS("() => alert('Calendar event clicked')"),
      iconProps = list(
        iconName = "Calendar"
      )
    )
  )
)

ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    Stack(
      horizontal = TRUE,
      wrap = TRUE,
      tokens = list(
        childrenGap = 40
      ),
      DefaultButton.shinyInput(
        inputId = ns("button_1"),
        text = "Standard",
        primary = FALSE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        disabled = FALSE,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = ns("button_2"),
        text = "Primary",
        primary = TRUE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        disabled = FALSE,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = ns("button_3"),
        text = "Main action disabled",
        primaryDisabled = NA,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        checked = FALSE
      ),
      DefaultButton.shinyInput(
        inputId = ns("button_4"),
        text = "Disabled",
        disabled = TRUE,
        split = TRUE,
        splitButtonAriaLabel = "See 2 options",
        `aria-roledescription` = "split button",
        menuProps = menuProps,
        checked = FALSE
      )
    ),
    uiOutput(ns("text"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    output$text <- renderUI({
      lapply(seq_len(4), function(i) {
        paste0("button_", i, ": ", input[[paste0("button_", i)]])
      })
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 3
library(shiny)
library(shiny.fluent)
library(shinyjs)
#> 
#> Attaching package: ‘shinyjs’
#> The following object is masked from ‘package:shiny’:
#> 
#>     runExample
#> The following object is masked from ‘package:shiny.fluent’:
#> 
#>     runExample
#> The following objects are masked from ‘package:methods’:
#> 
#>     removeClass, show

# This example app shows how to use a Fluent UI Button to trigger a file upload.
# File upload is not natively supported by shiny.fluent so shinyjs is used
# to trigger the file upload input.
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    useShinyjs(),
    Stack(
      tokens = list(
        childrenGap = 10L
      ),
      horizontal = TRUE,
      DefaultButton.shinyInput(
        inputId = ns("uploadFileButton"),
        text = "Upload File",
        iconProps = list(iconName = "Upload")
      ),
      div(
        style = "
          visibility: hidden;
          height: 0;
          width: 0;
        ",
        fileInput(
          inputId = ns("uploadFile"),
          label = NULL
        )
      )
    ),
    textOutput(ns("file_path"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$uploadFileButton, {
      click("uploadFile")
    })

    output$file_path <- renderText({
      input$uploadFile$name
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}

# Example 4
library(shiny)
library(shiny.fluent)
library(shinyjs)

# This example app shows how to use a Fluent UI Button to trigger a file download.
# File download is not natively supported by shiny.fluent so shinyjs is used
# to trigger the file download.
ui <- function(id) {
  ns <- NS(id)
  fluentPage(
    useShinyjs(),
    DefaultButton.shinyInput(
      inputId = ns("downloadButton"),
      text = "Download",
      iconProps = list(iconName = "Download")
    ),
    div(
      style = "visibility: hidden;",
      downloadButton(ns("download"), label = "")
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    observeEvent(input$downloadButton, {
      click("download")
    })

    output$download <- downloadHandler(
      filename = function() {
        paste("data-", Sys.Date(), ".csv", sep="")
      },
      content = function(file) {
        write.csv(iris, file)
      }
    )
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
