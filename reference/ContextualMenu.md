# ContextualMenu

ContextualMenus are lists of commands that are based on the context of
selection, mouse hover or keyboard focus. They are one of the most
effective and highly used command surfaces, and can be used in a variety
of places.

There are variants that originate from a command bar, or from cursor or
focus. Those that come from CommandBars use a beak that is horizontally
centered on the button. Ones that come from right click and menu button
do not have a beak, but appear to the right and below the cursor.
ContextualMenus can have submenus from commands, show selection checks,
and icons.

Organize commands in groups divided by rules. This helps users remember
command locations, or find less used commands based on proximity to
others. One should also group sets of mutually exclusive or multiple
selectable options. Use icons sparingly, for high value commands, and
don’t mix icons with selection checks, as it makes parsing commands
difficult. Avoid submenus of submenus as they can be difficult to invoke
or remember.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ContextualMenu).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ContextualMenu(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Additional css class to apply to the ContextualMenuItem

- **classNames** `IMenuItemClassNames`  
  Classnames for different aspects of a menu item

- **componentRef** `IRefObject<IContextualMenuRenderItem>`  
  Optional callback to access the IContextualMenuRenderItem interface.
  Use this instead of ref for accessing the public methods and
  properties of the component.

- **dismissMenu** `(ev?: any, dismissAll?: boolean) => void`  
  This prop will get set by ContextualMenu and can be called to close
  the menu this item belongs to. If dismissAll is true, all menus will
  be closed.

- **dismissSubMenu** `() => void`  
  This prop will get set by ContextualMenu and can be called to close
  this item's subMenu, if present.

- **getSubmenuTarget** `() => HTMLElement | undefined`  
  This prop will get set by the wrapping component and will return the
  element that wraps this ContextualMenuItem. Used for openSubMenu.

- **hasIcons** `boolean | undefined`  
  If this item has icons

- **index** `number`  
  Index of the item

- **item** `IContextualMenuItem`  
  The item to display

- **onCheckmarkClick**
  `(item: IContextualMenuItem, ev: React.MouseEvent<HTMLElement>) => void`  
  Click handler for the checkmark

- **openSubMenu** `(item: any, target: HTMLElement) => void`  
  This prop will get set by ContextualMenu and can be called to open
  this item's subMenu, if present.

- **styles**
  `IStyleFunctionOrObject<IContextualMenuItemStyleProps, IContextualMenuItemStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

- **focusableElementIndex** `number`  

- **hasCheckmarks** `boolean`  

- **hasIcons** `boolean`  

- **index** `number`  

- **totalItemCount** `number`  

- **defaultMenuItemRenderer**
  `(item: IContextualMenuItemRenderProps) => React.ReactNode`  

- **hasCheckmarks** `boolean`  

- **hasIcons** `boolean`  

- **items** `IContextualMenuItem[]`  

- **role** `string`  

- **totalItemCount** `number`  

- **alignTargetEdge** `boolean`  
  If true the positioning logic will prefer to flip edges rather than to
  nudge the rectangle to fit within bounds, thus making sure the element
  aligns perfectly with target's alignment edge

- **ariaLabel** `string`  
  Accessible label for the ContextualMenu's root element (inside the
  callout).

- **beakWidth** `number`  
  The width of the beak.

- **bounds**
  `IRectangle | ((target?: Target, targetWindow?: Window) => IRectangle | undefined)`  
  The bounding rectangle (or callback that returns a rectangle) which
  the contextual menu can appear in.

- **calloutProps** `ICalloutProps`  
  Additional custom props for the Callout.

- **className** `string`  
  Additional CSS class to apply to the ContextualMenu.

- **componentRef** `IRefObject<IContextualMenu>`  
  Optional callback to access the IContextualMenu interface. Use this
  instead of ref for accessing the public methods and properties of the
  component.

- **contextualMenuItemAs**
  `React.ComponentClass<IContextualMenuItemProps> | React.FunctionComponent<IContextualMenuItemProps>`  
  Custom component to use for rendering individual menu items.

- **coverTarget** `boolean`  
  If true, the menu will be positioned to cover the target. If false, it
  will be positioned next to the target.

- **delayUpdateFocusOnHover** `boolean`  
  If true, the contextual menu will not be updated until focus enters
  the menu via other means. This will only result in different behavior
  when `shouldFocusOnMount = false`.

- **directionalHint** `DirectionalHint`  
  How the menu should be positioned

- **directionalHintFixed** `boolean`  
  If true the position will not change sides in an attempt to fit the
  ContextualMenu within bounds. It will still attempt to align it to
  whatever bounds are given.

- **directionalHintForRTL** `DirectionalHint`  
  How the menu should be positioned in RTL layouts. If not specified, a
  mirror of `directionalHint` will be used.

- **doNotLayer** `boolean`  
  If true do not render on a new layer. If false render on a new layer.

- **focusZoneProps** `IFocusZoneProps`  
  Props to pass down to the FocusZone. NOTE: the default
  FocusZoneDirection will be used unless a direction is specified in the
  focusZoneProps (even if other focusZoneProps are defined)

- **gapSpace** `number`  
  The gap between the ContextualMenu and the target

- **getMenuClassNames**
  `(theme: ITheme, className?: string) => IContextualMenuClassNames`  
  Method to provide the classnames to style the contextual menu.

- **hidden** `boolean`  
  If true, renders the ContextualMenu in a hidden state. Use this flag,
  rather than rendering a ContextualMenu conditionally based on
  visibility, to improve rendering performance when it becomes visible.
  Note: When ContextualMenu is hidden its content will not be rendered.
  It will only render once the ContextualMenu is visible.

- **id** `string`  
  ID for the ContextualMenu's root element (inside the callout). Should
  be used for `aria-owns` and other such uses, rather than direct
  reference for programmatic purposes.

- **isBeakVisible** `boolean`  
  If true then the beak is visible. If false it will not be shown.

- **isSubMenu** `boolean`  
  Whether this menu is a submenu of another menu.

- **items** `IContextualMenuItem[]`  
  Menu items to display.

- **labelElementId** `string`  
  Used as `aria-labelledby` for the menu element inside the callout.

- **onDismiss**
  `(ev?: React.MouseEvent | React.KeyboardEvent, dismissAll?: boolean) => void`  
  Callback when the ContextualMenu tries to close. If `dismissAll` is
  true then all submenus will be dismissed.

- **onItemClick**
  `(ev?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>, item?: IContextualMenuItem) => boolean | void`  
  Click handler which is invoked if `onClick` is not passed for
  individual contextual menu item. Returning true will dismiss the menu
  even if `ev.preventDefault()` was called.

- **onMenuDismissed**
  `(contextualMenu?: IContextualMenuProps) => void`  
  Callback for when the menu is being closed (removing from the DOM).

- **onMenuOpened** `(contextualMenu?: IContextualMenuProps) => void`  
  Callback for when the menu has been opened.

- **onRenderMenuList** `IRenderFunction<IContextualMenuListProps>`  
  Method to override the render of the list of menu items.

- **onRenderSubMenu** `IRenderFunction<IContextualMenuProps>`  
  Custom render function for a submenu.

- **onRestoreFocus**
  `(options: { originalElement?: HTMLElement | Window; containsFocus: boolean; }) => void`  
  Called when the component is unmounting, and focus needs to be
  restored. Argument passed down contains two variables, the element
  that the underlying popup believes focus should go to and whether or
  not the popup currently contains focus. If this prop is provided,
  focus will not be restored automatically, you'll need to call
  originalElement.focus()

- **shouldFocusOnContainer** `boolean`  
  Whether to focus on the contextual menu container (as opposed to the
  first menu item).

- **shouldFocusOnMount** `boolean`  
  Whether to focus on the menu when mounted.

- **shouldUpdateWhenHidden** `boolean`  
  If true, the menu will be updated even when `hidden=true`. Note that
  this will consume resources to update even when nothing is being shown
  to the user. This might be helpful if your updates are small and you
  want the menu to display quickly when `hidden` is set to false.

- **styles**
  `IStyleFunctionOrObject<IContextualMenuStyleProps, IContextualMenuStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules.

- **subMenuHoverDelay** `number`  
  Delay (in milliseconds) to wait before expanding / dismissing a
  submenu on mouseEnter or mouseLeave

- **target** `Target`  
  The target that the ContextualMenu should try to position itself based
  on. It can be either an element, a query selector string resolving to
  a valid element, or a MouseEvent. If a MouseEvent is given, the origin
  point of the event will be used.

- **theme** `ITheme`  
  Theme provided by higher-order component.

- **title** `string`  
  Title to be displayed at the top of the menu, above the items.

- **useTargetAsMinWidth** `boolean`  
  If true the context menu will have a minimum width equal to the width
  of the target element

- **useTargetWidth** `boolean`  
  If true the context menu will render as the same width as the target
  element

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(
      ns("toggleContextualMenu"),
      id = "target",
      text = "Toggle menu"
    ),
    reactOutput(ns("contextualMenu"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns

    showContextualMenu <- reactiveVal(FALSE)
    observeEvent(input$toggleContextualMenu, {
      showContextualMenu(!showContextualMenu())
    })

    output$contextualMenu <- renderReact({
      menuItems <- JS("[
        {
          key: 'newItem',
          text: 'New',
          onClick: () => console.log('New clicked'),
        },
        {
          key: 'divider_1',
          itemType: 1,
        },
        {
          key: 'rename',
          text: 'Rename',
          onClick: () => console.log('Rename clicked'),
        },
        {
          key: 'edit',
          text: 'Edit',
          onClick: () => console.log('Edit clicked'),
        },
        {
          key: 'properties',
          text: 'Properties',
          onClick: () => console.log('Properties clicked'),
        },
        {
          key: 'linkNoTarget',
          text: 'Link same window',
          href: 'http://bing.com',
        },
        {
          key: 'linkWithTarget',
          text: 'Link new window',
          href: 'http://bing.com',
          target: '_blank',
        },
        {
          key: 'linkWithOnClick',
          name: 'Link click',
          href: 'http://bing.com',
          onClick: function(){
            alert('Link clicked');
            ev.preventDefault();
          },
          target: '_blank',
        },
        {
          key: 'disabled',
          text: 'Disabled item',
          disabled: true,
          onClick: () => console.error('Disabled item should not be clickable.'),
        },
      ]")

      ContextualMenu(
        items = menuItems,
        hidden = !showContextualMenu(),
        target = "#target",
        onItemClick = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("toggleContextualMenu"), "', Math.random());",
          "}"
        )),
        onDismiss = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("toggleContextualMenu"), "', Math.random());",
          "}"
        ))
      )
    })
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
