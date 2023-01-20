#' ActivityItem
#'
#' @description
#' An activity item (`ActivityItem`) represents a person's actions, such as making a comment, mentioning someone with an @mention, editing a document, or moving a file.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ActivityItem).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ## Layout
#'
#' - Use a list of multiple activity items to indicate a history of events relating to a single file, folder, person, or other entity. Alternatively, use a single activity item to indicate the most recent event on an entity.
#' - Group multiple similar events occurring near the same time into a single activity item.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ activityDescription }} {`React.ReactNode[] | React.ReactNode` \cr An element describing the activity that took place. If no activityDescription, activityDescriptionText, or onRenderActivityDescription are included, no description of the activity is shown.}
#' \item {\bold{ activityDescriptionText }} {`string` \cr Text describing the activity that occurred and naming the people involved in it. Deprecated, use `activityDescription` instead.}
#' \item {\bold{ activityIcon }} {`React.ReactNode` \cr An element containing an icon shown next to the activity item.}
#' \item {\bold{ activityPersonas }} {`Array<IPersonaSharedProps>` \cr If activityIcon is not set, then the persona props in this array will be used as the icon for this activity item.}
#' \item {\bold{ animateBeaconSignal }} {`boolean` \cr Enables/Disables the beacon that radiates from the center of the center of the activity icon. Signals an activity has started.}
#' \item {\bold{ beaconColorOne }} {`string` \cr Beacon color one}
#' \item {\bold{ beaconColorTwo }} {`string` \cr Beacon color two}
#' \item {\bold{ comments }} {`React.ReactNode[] | React.ReactNode` \cr An element containing the text of comments or \@mention messages. If no comments, commentText, or onRenderComments are included, no comments are shown.}
#' \item {\bold{ commentText }} {`string` \cr Text of comments or \@mention messages. Deprecated, use `comments` instead.}
#' \item {\bold{ isCompact }} {`boolean` \cr Indicated if the compact styling should be used.}
#' \item {\bold{ onRenderActivityDescription }} {`IRenderFunction<IActivityItemProps>` \cr A renderer for the description of the current activity.}
#' \item {\bold{ onRenderComments }} {`IRenderFunction<IActivityItemProps>` \cr A renderer that adds the text of a comment below the activity description.}
#' \item {\bold{ onRenderIcon }} {`IRenderFunction<IActivityItemProps>` \cr A renderer to create the icon next to the activity item.}
#' \item {\bold{ onRenderTimeStamp }} {`IRenderFunction<IActivityItemProps>` \cr A renderer adds a time stamp. If not included, timeStamp is shown as plain text below the activity.}
#' \item {\bold{ styles }} {`IActivityItemStyles` \cr Optional styling for the elements within the Activity Item.}
#' \item {\bold{ timeStamp }} {`string | React.ReactNode[] | React.ReactNode` \cr Element shown as a timestamp on this activity. If not included, no timestamp is shown.}
#' }
#'
#' @md
#' @name ActivityItem
NULL

#' Announced
#'
#' @description
#' The Announced component aims to fill several of the accessibility gaps that exist in various web application experiences.
#' It provides text for the screen reader in certain scenarios that are lacking comprehensive updates, particularly those showing
#' the completion status or progress of operation(s).
#'
#' Some real-world applications of the component include copying, uploading, or moving many files; deleting or renaming a single file;
#' "lazy loading" of page sections that do not appear all at once; and appearance of search results.
#'
#' The Announced component currently has the following documented use cases:
#'
#' 1. [Quick Actions](#/controls/web/announced/quickactions): Operations such as editing text or deletion that are short enough that they do not require a status during progress.
#' 2. [Search Results](#/controls/web/announced/searchresults): Appearance of search results such as in contact fields or search boxes.
#' 3. [Lazy Loading](#/controls/web/announced/lazyloading): "Lazy loading" of page sections that do not appear all at once.
#' 4. [Bulk Operations](#/controls/web/announced/bulkoperations): Operations that require multiple sub operations, such as the moving of several files.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Announced).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ "aria-live" }} {`'off' | 'polite' | 'assertive'` \cr Priority with which the screen reader should treat updates to this region  @default 'polite'}
#' \item {\bold{ as }} {`React.ElementType` \cr Optionally render the root of this component as another component type or primitive. The custom type **must** preserve any children or native props passed in.  @default 'div'}
#' \item {\bold{ message }} {`string` \cr The status message provided as screen reader output}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<{}, IAnnouncedStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' }
#'
#' @md
#' @name Announced
NULL

#' Breadcrumb
#'
#' @description
#' Breadcrumbs should be used as a navigational aid in your app or site. They indicate the current page’s location within a hierarchy and help the user understand where they are in relation to the rest of that hierarchy. They also afford one-click access to higher levels of that hierarchy.
#'
#' Breadcrumbs are typically placed, in horizontal form, under the masthead or navigation of an experience, above the primary content area.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Breadcrumb).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr Aria label for the root element of the breadcrumb (which is a navigation landmark).}
#' \item {\bold{ className }} {`string` \cr Optional class for the root breadcrumb element.}
#' \item {\bold{ componentRef }} {`IRefObject<IBreadcrumb>` \cr Optional callback to access the IBreadcrumb interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dividerAs }} {`IComponentAs<IDividerAsProps>` \cr Render a custom divider in place of the default chevron `>`}
#' \item {\bold{ focusZoneProps }} {`IFocusZoneProps` \cr Extra props for the root FocusZone.}
#' \item {\bold{ items }} {`IBreadcrumbItem[]` \cr Collection of breadcrumbs to render}
#' \item {\bold{ maxDisplayedItems }} {`number` \cr The maximum number of breadcrumbs to display before coalescing. If not specified, all breadcrumbs will be rendered.}
#' \item {\bold{ onGrowData }} {`(data: IBreadcrumbData) => IBreadcrumbData | undefined` \cr Method that determines how to group the length of the breadcrumb. Return undefined to never increase breadcrumb length.}
#' \item {\bold{ onReduceData }} {`(data: IBreadcrumbData) => IBreadcrumbData | undefined` \cr Method that determines how to reduce the length of the breadcrumb. Return undefined to never reduce breadcrumb length.}
#' \item {\bold{ onRenderItem }} {`IRenderFunction<IBreadcrumbItem>` \cr Custom render function for each breadcrumb item.}
#' \item {\bold{ onRenderOverflowIcon }} {`IRenderFunction<IButtonProps>` \cr Render a custom overflow icon in place of the default icon `...`}
#' \item {\bold{ overflowAriaLabel }} {`string` \cr Aria label for the overflow button.}
#' \item {\bold{ overflowIndex }} {`number` \cr Optional index where overflow items will be collapsed. Defaults to 0.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IBreadcrumbStyleProps, IBreadcrumbStyles>` \cr }
#' \item {\bold{ theme }} {`ITheme` \cr }
#' \item {\bold{ tooltipHostProps }} {`ITooltipHostProps` \cr Extra props for the TooltipHost which wraps each breadcrumb item.}
#' \item {\bold{ item }} {`IBreadcrumbItem` \cr Breadcrumb item to left of the divider to be passed for custom rendering. For overflowed items, it will be last item in the list.}
#' }
#'
#' @md
#' @name Breadcrumb
NULL

#' Button
#'
#' @description
#' Buttons give people a way to trigger an action. They’re typically found in forms, dialog panels, and dialogs. Some buttons are specialized for particular tasks, such as navigation, repeated actions, or presenting menus.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Button).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - For dialog boxes and panels, where people are moving through a sequence of screens, right-align buttons with the container.
#' - For single-page forms and focused tasks, left-align buttons with the container.
#' - Always place the primary button on the left, the secondary button just to the right of it.
#' - Show only one primary button that inherits theme color at rest state. If there are more than two buttons with equal priority, all buttons should have neutral backgrounds.
#' - Don't use a button to navigate to another place; use a link instead. The exception is in a wizard where "Back" and "Next" buttons may be used.
#' - Don't place the default focus on a button that destroys data. Instead, place the default focus on the button that performs the "safe act" and retains the content (such as "Save") or cancels the action (such as "Cancel").
#'
#' ### Content
#'
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#' - Make sure it's clear what will happen when people interact with the button. Be concise; usually a single verb is best. Include a noun if there is any room for interpretation about what the verb means. For example, "Delete folder" or "Create account".
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ baseClassName }} {`string` \cr }
#' \item {\bold{ variantClassName }} {`string` \cr }
#' \item {\bold{ allowDisabledFocus }} {`boolean` \cr Whether the button can have focus in disabled mode}
#' \item {\bold{ ariaDescription }} {`string` \cr Detailed description of the button for the benefit of screen readers.
#'
#' Besides the compound button, other button types will need more information provided to screen reader.}
#' \item {\bold{ ariaHidden }} {`boolean` \cr If provided and is true it adds an 'aria-hidden' attribute instructing screen readers to ignore the element.}
#' \item {\bold{ ariaLabel }} {`string` \cr The aria label of the button for the benefit of screen readers.}
#' \item {\bold{ buttonType }} {`ButtonType` \cr Deprecated at v1.2.3, to be removed at \>= v2.0.0. Use specific button component instead.}
#' \item {\bold{ checked }} {`boolean` \cr Whether the button is checked}
#' \item {\bold{ className }} {`string` \cr If provided, additional class name to provide on the root element.}
#' \item {\bold{ componentRef }} {`IRefObject<IButton>` \cr Optional callback to access the IButton interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ data }} {`any` \cr Any custom data the developer wishes to associate with the menu item.}
#' \item {\bold{ defaultRender }} {`any` \cr yet unknown docs}
#' \item {\bold{ description }} {`IStyle` \cr Style for the description text if applicable (for compound buttons.) Deprecated, use `secondaryText` instead.}
#' \item {\bold{ disabled }} {`boolean` \cr Whether the button is disabled}
#' \item {\bold{ getClassNames }} {`(theme: ITheme, className: string, variantClassName: string, iconClassName: string | undefined, menuIconClassName: string | undefined, disabled: boolean, checked: boolean, expanded: boolean, hasMenu: boolean, isSplit: boolean | undefined, allowDisabledFocus: boolean) => IButtonClassNames` \cr Method to provide the classnames to style a button. The default value for this prop is the getClassnames func defined in BaseButton.classnames.}
#' \item {\bold{ getSplitButtonClassNames }} {`(disabled: boolean, expanded: boolean, checked: boolean, allowDisabledFocus: boolean) => ISplitButtonClassNames` \cr Method to provide the classnames to style a button. The default value for this prop is the getClassnames func defined in BaseButton.classnames.}
#' \item {\bold{ href }} {`string` \cr If provided, this component will be rendered as an anchor.}
#' \item {\bold{ iconProps }} {`IIconProps` \cr The props for the icon shown in the button.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this button}
#' \item {\bold{ menuAs }} {`IComponentAs<IContextualMenuProps>` \cr Render a custom menu in place of the normal one.}
#' \item {\bold{ menuIconProps }} {`IIconProps` \cr The props for the icon shown when providing a menu dropdown.}
#' \item {\bold{ menuProps }} {`IContextualMenuProps` \cr Props for button menu. Providing this will default to showing the menu icon. See menuIconProps for overriding how the default icon looks. Providing this in addition of onClick and setting the split property to true will render a SplitButton.}
#' \item {\bold{ menuTriggerKeyCode }} {`KeyCodes | null` \cr Provides a custom KeyCode that can be used to open the button menu. The default KeyCode is the down arrow. A value of null can be provided to disable the key codes for opening the button menu.}
#' \item {\bold{ onAfterMenuDismiss }} {`() => void` \cr Callback that runs after Button's contextualmenu was closed (removed from the DOM)}
#' \item {\bold{ onMenuClick }} {`(ev?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>, button?: IButtonProps) => void` \cr Optional callback when menu is clicked.}
#' \item {\bold{ onRenderAriaDescription }} {`IRenderFunction<IButtonProps>` \cr Custom render function for the aria description element.}
#' \item {\bold{ onRenderChildren }} {`IRenderFunction<IButtonProps>` \cr Custom render function for rendering the button children.}
#' \item {\bold{ onRenderDescription }} {`IRenderFunction<IButtonProps>` \cr Custom render function for the desciption text.}
#' \item {\bold{ onRenderIcon }} {`IRenderFunction<IButtonProps>` \cr Custom render function for the icon}
#' \item {\bold{ onRenderMenu }} {`IRenderFunction<IContextualMenuProps>` \cr Deprecated at v6.3.2, to be removed at \>= v7.0.0. Use `menuAs` instead.}
#' \item {\bold{ onRenderMenuIcon }} {`IRenderFunction<IButtonProps>` \cr Custom render function for button menu icon}
#' \item {\bold{ onRenderText }} {`IRenderFunction<IButtonProps>` \cr Custom render function for the label text.}
#' \item {\bold{ persistMenu }} {`boolean` \cr Menu will not be created or destroyed when opened or closed, instead it will be hidden. This will improve perf of the menu opening but could potentially impact overall perf by having more elements in the dom. Should only be used when perf is important. Note: This may increase the amount of time it takes for the button itself to mount.}
#' \item {\bold{ primary }} {`boolean` \cr Changes the visual presentation of the button to be emphasized (if defined)}
#' \item {\bold{ primaryActionButtonProps }} {`IButtonProps` \cr Optional props to be applied only to the primary action button of SplitButton and not to the overall SplitButton container}
#' \item {\bold{ primaryDisabled }} {`boolean` \cr If set to true and if this is a splitButton (split == true) then the primary action of a split button is disabled.}
#' \item {\bold{ renderPersistedMenuHiddenOnMount }} {`boolean` \cr If true, the persisted menu is rendered hidden when the button initially mounts. Non-persisted menus will not be in the component tree unless they are being shown
#'
#' Note: This increases the time the button will take to mount, but can improve perceived menu open perf. when the user opens the menu.}
#' \item {\bold{ rootProps }} {`React.ButtonHTMLAttributes<HTMLButtonElement> | React.AnchorHTMLAttributes<HTMLAnchorElement>` \cr Deprecated at v0.56.2, to be removed at \>= v1.0.0. Just pass in button props instead. they will be mixed into the button/anchor element rendered by the component.}
#' \item {\bold{ secondaryText }} {`string` \cr Description of the action this button takes. Only used for compound buttons}
#' \item {\bold{ split }} {`boolean` \cr If set to true, and if menuProps and onClick are provided, the button will render as a SplitButton.}
#' \item {\bold{ splitButtonAriaLabel }} {`string` \cr Accessible label for the dropdown chevron button if this button is split.}
#' \item {\bold{ splitButtonMenuProps }} {`IButtonProps` \cr Experimental prop that get passed into the menuButton that's rendered as part of split button. Anything passed in will likely need to have accompanying style changes.}
#' \item {\bold{ styles }} {`IButtonStyles` \cr Custom styling for individual elements within the button DOM.}
#' \item {\bold{ text }} {`string` \cr Text to render button label. If text is supplied, it will override any string in button children. Other children components will be passed through after the text.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ toggle }} {`boolean` \cr Whether button is a toggle button with distinct on and off states. This should be true for buttons that permanently change state when a press event finishes, such as a volume mute button.}
#' \item {\bold{ toggled }} {`boolean` \cr Any custom data the developer wishes to associate with the menu item. Deprecated, use `checked` if setting state.}
#' \item {\bold{ uniqueId }} {`string | number` \cr Unique id to identify the item. Typically a duplicate of key value.}
#' }
#'
#' @md
#' @name Button
NULL

#' Calendar
#'
#' @description
#' The calendar control lets people select and view a single date or a range of dates in their calendar. It’s made up of 3 separate views: the month view, year view, and decade view.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Calendar).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Don’t break the control apart.
#' - Include an up and down arrow for navigating between time ranges and a chevron to make the calendar collapsible.
#'
#' ### Content
#'
#' - Use the following format for dates: month, day, year, as in July 31, 2016. When space is limited, use numbers and slashes for dates if the code supports that format and automatically displays the appropriate date format for different locales. For example, 2/16/19.
#' - Don't use ordinal numbers (such as 1st, 12th, or 23rd) to indicate a date.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allFocusable }} {`boolean` \cr Allows all dates and buttons to be focused, including disabled ones}
#' \item {\bold{ autoNavigateOnSelection }} {`boolean` \cr Whether the month view should automatically navigate to the next or previous date range depending on the selected date. If this property is set to true and the currently displayed month is March 2017, if the user clicks on a day outside the month, i.e., April 1st, the picker will automatically navigate to the month of April.}
#' \item {\bold{ className }} {`string` \cr Optional class name to add to the root element.}
#' \item {\bold{ componentRef }} {`IRefObject<ICalendar>` \cr Optional callback to access the ICalendar interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dateRangeType }} {`DateRangeType` \cr The date range type indicating how many days should be selected as the user selects days}
#' \item {\bold{ dateTimeFormatter }} {`ICalendarFormatDateCallbacks` \cr Apply additional formating to dates, for example localized date formatting.}
#' \item {\bold{ firstDayOfWeek }} {`DayOfWeek` \cr The first day of the week for your locale.}
#' \item {\bold{ firstWeekOfYear }} {`FirstWeekOfYear` \cr Defines when the first week of the year should start, FirstWeekOfYear.FirstDay, FirstWeekOfYear.FirstFullWeek or FirstWeekOfYear.FirstFourDayWeek are the possible values}
#' \item {\bold{ highlightCurrentMonth }} {`boolean` \cr Whether the month picker should highlight the current month}
#' \item {\bold{ highlightSelectedMonth }} {`boolean` \cr Whether the month picker should highlight the selected month}
#' \item {\bold{ isDayPickerVisible }} {`boolean` \cr Whether the day picker is shown beside the month picker or hidden.}
#' \item {\bold{ isMonthPickerVisible }} {`boolean` \cr Whether the month picker is shown beside the day picker or hidden.}
#' \item {\bold{ maxDate }} {`Date` \cr If set the Calendar will not allow navigation to or selection of a date later than this value.}
#' \item {\bold{ minDate }} {`Date` \cr If set the Calendar will not allow navigation to or selection of a date earlier than this value.}
#' \item {\bold{ navigationIcons }} {`ICalendarIconStrings` \cr Customize navigation icons using ICalendarIconStrings}
#' \item {\bold{ onDismiss }} {`() => void` \cr Callback issued when calendar is closed}
#' \item {\bold{ onSelectDate }} {`(date: Date, selectedDateRangeArray?: Date[]) => void` \cr Callback issued when a date is selected}
#' \item {\bold{ restrictedDates }} {`Date[]` \cr If set the Calendar will not allow selection of dates in this array.}
#' \item {\bold{ selectDateOnClick }} {`boolean` \cr When clicking on "Today", select the date and close the calendar.}
#' \item {\bold{ shouldFocusOnMount }} {`boolean` \cr This property has been removed at 0.80.0 in place of the `focus` method, to be removed \@ 1.0.0.}
#' \item {\bold{ showCloseButton }} {`boolean` \cr Whether the close button should be shown or not}
#' \item {\bold{ showGoToToday }} {`boolean` \cr Whether the "Go to today" link should be shown or not}
#' \item {\bold{ showMonthPickerAsOverlay }} {`boolean` \cr Show month picker on top of date picker when visible.}
#' \item {\bold{ showSixWeeksByDefault }} {`boolean` \cr Whether the calendar should show 6 weeks by default.}
#' \item {\bold{ showWeekNumbers }} {`boolean` \cr Whether the calendar should show the week number (weeks 1 to 53) before each week row}
#' \item {\bold{ strings }} {`ICalendarStrings | null` \cr Localized strings to use in the Calendar}
#' \item {\bold{ today }} {`Date` \cr Value of today. If null, current time in client machine will be used.}
#' \item {\bold{ value }} {`Date` \cr Default value of the Calendar, if any}
#' \item {\bold{ workWeekDays }} {`DayOfWeek[]` \cr The days that are selectable when dateRangeType is WorkWeek. If dateRangeType is not WorkWeek this property does nothing.}
#' \item {\bold{ yearPickerHidden }} {`boolean` \cr Whether the year picker is enabled}
#' }
#'
#' @md
#' @name Calendar
NULL

#' Callout
#'
#' @description
#' A callout is an anchored tip that can be used to teach people or guide them through the app without blocking them.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Callout).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Don’t use a callout to ask for action confirmation; use a dialog instead.
#' - Place a callout near the object being described. At the pointer’s tail or head, if possible.
#' - Don't use large, unformatted blocks of text in your callout. They're difficult to read and overwhelming.
#' - Don’t block important UI with the placement of your callout. It's a poor user experience that will lead to frustration.
#' - Don’t open a callout from within another callout.
#' - Don’t show callouts on hidden elements.
#' - Don’t overuse callouts. Too many callouts opening automatically can be perceived as interrupting someone's workflow.
#' - For a particularly complex concept that needs explanation, place an info icon (`iconClassNames.info`) next to the concept to indicate there's more helpful information available. When someone hovers over or selects the icon, the callout should appear.
#'
#' ### Content
#'
#' - Because the content inside of a callout isn't always visible, don't put required information in a callout.
#' - Short sentences or sentence fragments are best.
#' - Don't use obvious tip text or text that simply repeats what is already on the screen. Limit the information inside of a callout to supplemental information.
#' - When additional context or a more advanced description is necessary, consider placing a link to "Learn more" at the bottom of the callout. When clicked, open the additional content in a new window or panel.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ alignTargetEdge }} {`boolean` \cr If true the positioning logic will prefer to flip edges rather than to nudge the rectangle to fit within bounds, thus making sure the element aligns perfectly with target's alignment edge}
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Defines the element id referencing the element containing the description for the callout.}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessible label text for callout.}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Defines the element id referencing the element containing label text for callout.}
#' \item {\bold{ backgroundColor }} {`string` \cr The background color of the Callout in hex format ie. #ffffff.}
#' \item {\bold{ beakWidth }} {`number` \cr The width of the beak.}
#' \item {\bold{ bounds }} {`IRectangle | ((target?: Target, targetWindow?: Window) => IRectangle | undefined)` \cr The bounding rectangle (or callback that returns a rectangle) for which the contextual menu can appear in.}
#' \item {\bold{ calloutMaxHeight }} {`number` \cr Set max height of callout When not set the callout will expand with contents up to the bottom of the screen}
#' \item {\bold{ calloutMaxWidth }} {`number` \cr Custom width for callout including borders. If value is 0, no width is applied.}
#' \item {\bold{ calloutWidth }} {`number` \cr Custom width for callout including borders. If value is 0, no width is applied.}
#' \item {\bold{ className }} {`string` \cr CSS class to apply to the callout.}
#' \item {\bold{ coverTarget }} {`boolean` \cr If true the position returned will have the menu element cover the target. If false then it will position next to the target;}
#' \item {\bold{ directionalHint }} {`DirectionalHint` \cr How the element should be positioned}
#' \item {\bold{ directionalHintFixed }} {`boolean` \cr If true the position will not change sides in an attempt to fit the callout within bounds. It will still attempt to align it to whatever bounds are given.}
#' \item {\bold{ directionalHintForRTL }} {`DirectionalHint` \cr How the element should be positioned in RTL layouts. If not specified, a mirror of the `directionalHint` alignment edge will be used instead. This means that `DirectionalHint.BottomLeft` will change to `DirectionalHint.BottomRight` but `DirectionalHint.LeftAuto` will not change.}
#' \item {\bold{ doNotLayer }} {`boolean` \cr If true do not render on a new layer. If false render on a new layer.}
#' \item {\bold{ finalHeight }} {`number` \cr Specify the final height of the content. To be used when expanding the content dynamically so that callout can adjust its position.}
#' \item {\bold{ gapSpace }} {`number` \cr The gap between the Callout and the target}
#' \item {\bold{ hidden }} {`boolean` \cr If specified, renders the Callout in a hidden state. Use this flag, rather than rendering a callout conditionally based on visibility, to improve rendering performance when it becomes visible. Note: When callout is hidden its content will not be rendered. It will only render once the callout is visible.}
#' \item {\bold{ hideOverflow }} {`boolean` \cr Manually set OverflowYHidden style prop to true on calloutMain element A variety of callout load animations will need this to hide the scollbar that can appear}
#' \item {\bold{ isBeakVisible }} {`boolean` \cr If true then the beak is visible. If false it will not be shown.}
#' \item {\bold{ layerProps }} {`ILayerProps` \cr Optional props to pass to the Layer component hosting the panel.}
#' \item {\bold{ minPagePadding }} {`number` \cr The minimum distance the callout will be away from the edge of the screen.}
#' \item {\bold{ onDismiss }} {`(ev?: any) => void` \cr Callback when the Callout tries to close.}
#' \item {\bold{ onLayerMounted }} {`() => void` \cr Optional callback when the layer content has mounted.}
#' \item {\bold{ onPositioned }} {`(positions?: ICalloutPositionedInfo) => void` \cr Optional callback that is called once the callout has been correctly positioned.}
#' \item {\bold{ onRestoreFocus }} {`(options: { originalElement?: HTMLElement | Window; containsFocus: boolean; }) => void` \cr Called when the component is unmounting, and focus needs to be restored. Argument passed down contains two variables, the element that the underlying popup believes focus should go to * and whether or not the popup currently contains focus. If this is provided, focus will not be restored automatically, you'll need to call originalElement.focus()}
#' \item {\bold{ onScroll }} {`() => void` \cr Callback when the Callout body is scrolled.}
#' \item {\bold{ preventDismissOnLostFocus }} {`boolean` \cr If true then the callout will not dismiss when it loses focus}
#' \item {\bold{ preventDismissOnResize }} {`boolean` \cr If true then the callout will not dismiss on resize}
#' \item {\bold{ preventDismissOnScroll }} {`boolean` \cr If true then the callout will not dismiss on scroll}
#' \item {\bold{ role }} {`string` \cr Aria role assigned to the callout (Eg. dialog, alertdialog).}
#' \item {\bold{ setInitialFocus }} {`boolean` \cr If true then the callout will attempt to focus the first focusable element that it contains. If it doesn't find an element, no focus will be set and the method will return false. This means that it's the contents responsibility to either set focus or have focusable items.}
#' \item {\bold{ shouldRestoreFocus }} {`boolean` \cr If true, when this component is unmounted, focus will be restored to the element that had focus when the component first mounted.}
#' \item {\bold{ shouldUpdateWhenHidden }} {`boolean` \cr If true, the component will be updated even when hidden=true. Note that this would consume resources to update even though nothing is being shown to the user. This might be helpful though if your updates are small and you want the callout to be revealed fast to the user when hidden is set to false.}
#' \item {\bold{ style }} {`React.CSSProperties` \cr CSS style to apply to the callout.
#'
#' If you set `overflowY` in this object, it provides a performance optimization by preventing Popup (underlying component of Callout) from calculating whether it needs a scroll bar.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ICalloutContentStyleProps, ICalloutContentStyles>` \cr Optional styles for the component.}
#' \item {\bold{ target }} {`Target` \cr The target that the Callout should try to position itself based on. It can be either an Element a querySelector string of a valid Element or a MouseEvent. If MouseEvent is given then the origin point of the event will be used.}
#' \item {\bold{ theme }} {`ITheme` \cr Optional theme for component}
#' }
#'
#' @md
#' @name Callout
NULL

#' Checkbox
#'
#' @description
#' Check boxes (`Checkbox`) give people a way to select one or more items from a group, or switch between two mutually exclusive options (checked or unchecked, on or off).
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Checkbox).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a single check box when there's only one selection to make or choice to confirm. Selecting a blank check box selects it. Selecting it again clears the check box.
#' - Use multiple check boxes when one or more options can be selected from a group. Unlike radio buttons, selecting one check box will not clear another check box.
#'
#' ### Content
#'
#' - Separate two groups of check boxes with headings rather than positioning them one after the other.
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#' - Don't use end punctuation (unless the check box label absolutely requires multiple sentences).
#' - Use a sentence fragment for the label, rather than a full sentence.
#' - Make it easy for people to understand what will happen if they select or clear a check box.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaDescribedBy }} {`string` \cr ID for element that provides extended information for the checkbox.}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessible label for the checkbox.}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr ID for element that contains label information for the checkbox.}
#' \item {\bold{ ariaPositionInSet }} {`number` \cr The position in the parent set (if in a set) for aria-posinset.}
#' \item {\bold{ ariaSetSize }} {`number` \cr The total size of the parent set (if in a set) for aria-setsize.}
#' \item {\bold{ boxSide }} {`'start' | 'end'` \cr Allows you to set the checkbox to be at the before (start) or after (end) the label.}
#' \item {\bold{ checked }} {`boolean` \cr Checked state. Mutually exclusive to "defaultChecked". Use this if you control the checked state at a higher level and plan to pass in the correct value based on handling onChange events and re-rendering.}
#' \item {\bold{ checkmarkIconProps }} {`IIconProps` \cr Custom icon props for the check mark rendered by the checkbox}
#' \item {\bold{ className }} {`string` \cr Additional class name to provide on the root element, in addition to the ms-Checkbox class.}
#' \item {\bold{ componentRef }} {`IRefObject<ICheckbox>` \cr Optional callback to access the ICheckbox interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultChecked }} {`boolean` \cr Default checked state. Mutually exclusive to "checked". Use this if you want an uncontrolled component, and want the Checkbox instance to maintain its own state.}
#' \item {\bold{ defaultIndeterminate }} {`boolean` \cr Optional uncontrolled indeterminate visual state for checkbox. Setting indeterminate state takes visual precedence over checked or defaultChecked props given but does not affect checked state. This is not a toggleable state. On load the checkbox will receive indeterminate visual state and after the user's first click it will be removed exposing the true state of the checkbox.}
#' \item {\bold{ disabled }} {`boolean` \cr Disabled state of the checkbox.}
#' \item {\bold{ indeterminate }} {`boolean` \cr Optional controlled indeterminate visual state for checkbox. Setting indeterminate state takes visual precedence over checked or defaultChecked props given but does not affect checked state. This should not be a toggleable state. On load the checkbox will receive indeterminate visual state and after the first user click it should be removed by your supplied onChange callback function exposing the true state of the checkbox.}
#' \item {\bold{ inputProps }} {`React.ButtonHTMLAttributes<HTMLElement | HTMLButtonElement>` \cr Optional input props that will be mixed into the input element, *before* other props are applied. This allows you to extend the input element with additional attributes, such as data-automation-id needed for automation. Note that if you provide, for example, "disabled" as well as "inputProps.disabled", the former will take precedence over the later.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this checkbox}
#' \item {\bold{ label }} {`string` \cr Label to display next to the checkbox.}
#' \item {\bold{ onChange }} {`(ev?: React.FormEvent<HTMLElement | HTMLInputElement>, checked?: boolean) => void` \cr Callback that is called when the checked value has changed.}
#' \item {\bold{ onRenderLabel }} {`IRenderFunction<ICheckboxProps>` \cr Custom render function for the label.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ICheckboxStyleProps, ICheckboxStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Checkbox
NULL

#' ChoiceGroup
#'
#' @description
#' Radio buttons (`ChoiceGroup`) let people select a single option from two or more choices.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ChoiceGroup).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use radio buttons when there are two to seven options, you have enough screen space, and the options are important enough to be a good use of that screen space.
#' - If there are more than seven options, use a drop-down menu instead.
#' - To give people a way to select more than one option, use check boxes instead.
#' - If a default option is recommended for most people in most situations, use a drop-down menu instead.
#' - Align radio buttons vertically instead of horizontally, if possible. Horizontal alignment is harder to read and localize. If there are only two mutually exclusive options, combine them into a single check box or toggle. For example, use a check box for "I agree" statements instead of radio buttons for "I agree" and "I disagree".
#'
#' ### Content
#'
#' - List the options in a logical order, such as most likely to be selected to least, simplest operation to most complex, or least risk to most. Listing options in alphabetical order isn't recommended because the order will change when the text is localized.
#' - Select the safest (to prevent loss of data or system access), most secure, and most private option as the default. If safety and security aren't factors, select the most likely or convenient option.
#' - Use a phrase for the label, rather than a full sentence.
#' - Make sure to give people the option to not make a choice. For example, include a "None" option.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ componentRef }} {`IRefObject<IChoiceGroupOption>` \cr Optional callback to access the IChoiceGroup interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ focused }} {`boolean` \cr Indicates if the ChoiceGroupOption should appear focused, visually}
#' \item {\bold{ name }} {`string` \cr This value is used to group each ChoiceGroupOption into the same logical ChoiceGroup}
#' \item {\bold{ onBlur }} {`(ev: React.FocusEvent<HTMLElement>, props?: IChoiceGroupOption) => void` \cr A callback for receiving a notification when the choice has lost focus.}
#' \item {\bold{ onChange }} {`(evt?: React.FormEvent<HTMLElement | HTMLInputElement>, props?: IChoiceGroupOption) => void` \cr A callback for receiving a notification when the choice has been changed.}
#' \item {\bold{ onFocus }} {`(ev?: React.FocusEvent<HTMLElement | HTMLInputElement>, props?: IChoiceGroupOption) => void | undefined` \cr A callback for receiving a notification when the choice has received focus.}
#' \item {\bold{ required }} {`boolean` \cr If true, it specifies that an option must be selected in the ChoiceGroup before submitting the form}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr ID of an element to use as the aria label for this ChoiceGroup.}
#' \item {\bold{ componentRef }} {`IRefObject<IChoiceGroup>` \cr Optional callback to access the IChoiceGroup interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultSelectedKey }} {`string | number` \cr The key of the option that will be initially checked.}
#' \item {\bold{ label }} {`string` \cr Descriptive label for the choice group.}
#' \item {\bold{ onChange }} {`(ev?: React.FormEvent<HTMLElement | HTMLInputElement>, option?: IChoiceGroupOption) => void` \cr A callback for receiving a notification when the choice has been changed.}
#' \item {\bold{ onChanged }} {`(option: IChoiceGroupOption, evt?: React.FormEvent<HTMLElement | HTMLInputElement>) => void` \cr Deprecated and will be removed by 07/17/2017. Use `onChange` instead.}
#' \item {\bold{ options }} {`IChoiceGroupOption[]` \cr The options for the choice group.}
#' \item {\bold{ selectedKey }} {`string | number` \cr The key of the selected option. If you provide this, you must maintain selection state by observing onChange events and passing a new value in when changed.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IChoiceGroupStyleProps, IChoiceGroupStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' }
#'
#' @md
#' @name ChoiceGroup
NULL

#' Coachmark
#'
#' @description
#' Coach marks (`Coachmark`) are used to draw a person’s attention to parts of the UI and increase engagement with those elements. A teaching bubble appears on hover or selection of the coach mark.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Coachmark).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ## Layout
#'
#' - Only one coach mark and teaching bubble combo should be displayed at a time.
#' - Coach marks can be standalone or sequential. Sequential coach marks should be used sparingly to walk through complex multistep interactions. It’s recommended that a sequence of coach marks doesn’t exceed three steps.
#' - Coach marks are designed to only hold teaching bubbles.
#' - Coach mark size, color, and animation shouldn’t be altered.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaAlertText }} {`string` \cr Text to announce to screen reader / narrator when Coachmark is displayed}
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Defines the element id referencing the element containing the description for the Coachmark.}
#' \item {\bold{ ariaDescribedByText }} {`string` \cr Defines the text content for the ariaDescribedBy element}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Defines the element id referencing the element containing label text for Coachmark.}
#' \item {\bold{ ariaLabelledByText }} {`string` \cr Defines the text content for the ariaLabelledBy element}
#' \item {\bold{ beaconColorOne }} {`string` \cr Beacon color one.}
#' \item {\bold{ beaconColorTwo }} {`string` \cr Beacon color two.}
#' \item {\bold{ beakHeight }} {`number` \cr The height of the Beak component.}
#' \item {\bold{ beakWidth }} {`number` \cr The width of the Beak component.}
#' \item {\bold{ className }} {`string` \cr If provided, additional class name to provide on the root element.}
#' \item {\bold{ collapsed }} {`boolean` \cr The starting collapsed state for the Coachmark. Use `isCollapsed` instead.}
#' \item {\bold{ color }} {`string` \cr Color of the Coachmark/TeachingBubble.}
#' \item {\bold{ componentRef }} {`IRefObject<ICoachmark>` \cr Optional callback to access the ICoachmark interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ delayBeforeCoachmarkAnimation }} {`number` \cr Delay in milliseconds before Coachmark animation appears.}
#' \item {\bold{ delayBeforeMouseOpen }} {`number` \cr Delay before allowing mouse movements to open the Coachmark.}
#' \item {\bold{ height }} {`number` \cr The height of the Coachmark.}
#' \item {\bold{ isCollapsed }} {`boolean` \cr The starting collapsed state for the Coachmark.}
#' \item {\bold{ isPositionForced }} {`boolean` \cr Whether or not to force the Coachmark/TeachingBubble content to fit within the window bounds.}
#' \item {\bold{ mouseProximityOffset }} {`number` \cr The distance in pixels the mouse is located before opening up the Coachmark.}
#' \item {\bold{ onAnimationOpenEnd }} {`() => void` \cr Callback when the opening animation completes.}
#' \item {\bold{ onAnimationOpenStart }} {`() => void` \cr Callback when the opening animation begins.}
#' \item {\bold{ onDismiss }} {`(ev?: any) => void` \cr Callback when the Coachmark tries to close.}
#' \item {\bold{ onMouseMove }} {`(e: MouseEvent) => void` \cr Callback to run when the mouse moves.}
#' \item {\bold{ persistentBeak }} {`boolean` \cr If true then the Coachmark beak (arrow pointing towards target) will always be visible as long as Coachmark is visible}
#' \item {\bold{ positioningContainerProps }} {`IPositioningContainerProps` \cr Props to pass to the PositioningContainer component. Specify the `directionalHint` to indicate on which edge the Coachmark/TeachingBubble should be positioned.}
#' \item {\bold{ preventDismissOnLostFocus }} {`boolean` \cr If true then the Coachmark will not dismiss when it loses focus}
#' \item {\bold{ preventFocusOnMount }} {`boolean` \cr If true then focus will not be set to the Coachmark when it mounts. Useful in cases where focus on coachmark is causing other components in page to dismiss upon losing focus.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ICoachmarkStyleProps, ICoachmarkStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ target }} {`HTMLElement | string | null` \cr The target that the Coachmark should try to position itself based on.}
#' \item {\bold{ teachingBubbleRef }} {`ITeachingBubble` \cr Ref for TeachingBubble}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher order component.}
#' \item {\bold{ width }} {`number` \cr The width of the Coachmark.}
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Defines the element id referencing the element containing the description for the positioningContainer.}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessible label text for positioningContainer.}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Defines the element id referencing the element containing label text for positioningContainer.}
#' \item {\bold{ backgroundColor }} {`string` \cr The background color of the positioningContainer in hex format ie. #ffffff.}
#' \item {\bold{ bounds }} {`IRectangle` \cr The bounding rectangle for which the contextual menu can appear in.}
#' \item {\bold{ className }} {`string` \cr CSS class to apply to the positioningContainer.}
#' \item {\bold{ componentRef }} {`IRefObject<IPositioningContainer>` \cr All props for your component are to be defined here.}
#' \item {\bold{ coverTarget }} {`boolean` \cr If true the position returned will have the menu element cover the target. If false then it will position next to the target;}
#' \item {\bold{ directionalHint }} {`DirectionalHint` \cr How the element should be positioned}
#' \item {\bold{ directionalHintFixed }} {`boolean` \cr If true the position will not change sides in an attempt to fit the positioningContainer within bounds. It will still attempt to align it to whatever bounds are given.}
#' \item {\bold{ directionalHintForRTL }} {`DirectionalHint` \cr How the element should be positioned in RTL layouts. If not specified, a mirror of `directionalHint` will be used instead}
#' \item {\bold{ doNotLayer }} {`boolean` \cr If true do not render on a new layer. If false render on a new layer.}
#' \item {\bold{ finalHeight }} {`number` \cr Specify the final height of the content. To be used when expanding the content dynamically so that positioningContainer can adjust its position.}
#' \item {\bold{ minPagePadding }} {`number` \cr The minimum distance the positioningContainer will be away from the edge of the screen.}
#' \item {\bold{ offsetFromTarget }} {`number` \cr The gap between the positioningContainer and the target}
#' \item {\bold{ onDismiss }} {`(ev?: any) => void` \cr Callback when the positioningContainer tries to close.}
#' \item {\bold{ onLayerMounted }} {`() => void` \cr Optional callback when the layer content has mounted.}
#' \item {\bold{ onPositioned }} {`(positions?: IPositionedData) => void` \cr Optional callback that is called once the positioningContainer has been correctly positioned.}
#' \item {\bold{ positioningContainerMaxHeight }} {`number` \cr Set max height of positioningContainer When not set the positioningContainer will expand with contents up to the bottom of the screen}
#' \item {\bold{ positioningContainerWidth }} {`number` \cr Custom width for positioningContainer including borders. If value is 0, no width is applied.}
#' \item {\bold{ preventDismissOnScroll }} {`boolean` \cr If true then the onClose will not not dismiss on scroll}
#' \item {\bold{ role }} {`string` \cr Aria role assigned to the positioningContainer (Eg. dialog, alertdialog).}
#' \item {\bold{ setInitialFocus }} {`boolean` \cr If true then the positioningContainer will attempt to focus the first focusable element that it contains. If it doesn't find an element, no focus will be set and the method will return false. This means that it's the contents responsibility to either set focus or have focusable items.}
#' \item {\bold{ target }} {`HTMLElement | string | MouseEvent | Point | null` \cr The target that the positioningContainer should try to position itself based on. It can be either an HTMLElement a querySelector string of a valid HTMLElement or a MouseEvent. If MouseEvent is given then the origin point of the event will be used.}
#' \item {\bold{ targetPoint }} {`Point` \cr Point used to position the positioningContainer. Deprecated, use `target` instead.}
#' \item {\bold{ useTargetPoint }} {`boolean` \cr If true use a point rather than rectangle to position the positioningContainer. For example it can be used to position based on a click.}
#' }
#'
#' @md
#' @name Coachmark
NULL

#' ColorPicker
#'
#' @description
#' The color picker (`ColorPicker`) is used to browse through and select colors. By default, it lets people navigate through colors on a color spectrum; or specify a color in either Red-Green-Blue (RGB); or alpha color code; or Hexadecimal textboxes.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ColorPicker).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ alphaLabel }} {`string` \cr Label for the alpha textfield.}
#' \item {\bold{ alphaSliderHidden }} {`boolean` \cr Whether to hide the alpha (or transparency) slider and text field.}
#' \item {\bold{ alphaType }} {`'alpha' | 'transparency' | 'none'` \cr `alpha` (the default) means display a slider and text field for editing alpha values. `transparency` also displays a slider and text field but for editing transparency values. `none` hides these controls.
#'
#' Alpha represents the opacity of the color, whereas transparency represents the transparentness of the color: i.e. a 30% transparent color has 70% opaqueness.}
#' \item {\bold{ blueLabel }} {`string` \cr Label for the blue text field.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the ColorPicker.}
#' \item {\bold{ color }} {`IColor | string` \cr Object or CSS-compatible string to describe the color.}
#' \item {\bold{ componentRef }} {`IRefObject<IColorPicker>` \cr Gets the component ref.}
#' \item {\bold{ greenLabel }} {`string` \cr Label for the green text field.}
#' \item {\bold{ hexLabel }} {`string` \cr Label for the hex text field.}
#' \item {\bold{ onChange }} {`(ev: React.SyntheticEvent<HTMLElement>, color: IColor) => void` \cr Callback for when the user changes the color. (Not called when the color is changed via props.)}
#' \item {\bold{ redLabel }} {`string` \cr Label for the red text field.}
#' \item {\bold{ showPreview }} {`boolean` \cr Whether to show color preview box.}
#' \item {\bold{ strings }} {`IColorPickerStrings` \cr Labels for elements within the ColorPicker. Defaults are provided in English only.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IColorPickerStyleProps, IColorPickerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' \item {\bold{ ariaDescription }} {`string` \cr Detailed description for how to use the color rectangle. Moving the thumb horizontally adjusts saturation and moving it vertically adjusts value (essentially, brightness).}
#' \item {\bold{ ariaLabel }} {`string` \cr Label of the ColorRectangle for the benefit of screen reader users.}
#' \item {\bold{ ariaValueFormat }} {`string` \cr Format string for the color rectangle's current value as read by screen readers. The string must include descriptions and two placeholders for the current values: `{0}` for saturation and `{1}` for value/brightness.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the ColorRectangle.}
#' \item {\bold{ color }} {`IColor` \cr Current color of the rectangle.}
#' \item {\bold{ componentRef }} {`IRefObject<IColorRectangle>` \cr Gets the component ref.}
#' \item {\bold{ minSize }} {`number` \cr Minimum width and height.}
#' \item {\bold{ onChange }} {`(ev: React.MouseEvent | React.KeyboardEvent, color: IColor) => void` \cr Callback for when the color changes.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IColorRectangleStyleProps, IColorRectangleStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' \item {\bold{ ariaLabel }} {`string` \cr Label of the ColorSlider for the benefit of screen reader users.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the ColorSlider.}
#' \item {\bold{ componentRef }} {`IRefObject<IColorSlider>` \cr Gets the component ref.}
#' \item {\bold{ isAlpha }} {`boolean` \cr If true, the slider represents an alpha slider and will display a gray checkered pattern in the background. Otherwise, the slider represents a hue slider.}
#' \item {\bold{ maxValue }} {`number` \cr Maximum value of the slider.}
#' \item {\bold{ minValue }} {`number` \cr Minimum value of the slider.}
#' \item {\bold{ onChange }} {`(event: React.MouseEvent | React.KeyboardEvent, newValue?: number) => void` \cr Callback issued when the value changes.}
#' \item {\bold{ overlayColor }} {`string` \cr Hex color to use when rendering an alpha or transparency slider's overlay, *without* the `#`.}
#' \item {\bold{ overlayStyle }} {`React.CSSProperties` \cr Custom style for the overlay element.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IColorSliderStyleProps, IColorSliderStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' \item {\bold{ thumbColor }} {`string` \cr CSS-compatible string for the color of the thumb element.}
#' \item {\bold{ type }} {`'hue' | 'alpha' | 'transparency'` \cr Type of slider to display.}
#' \item {\bold{ value }} {`number` \cr Current value of the slider.}
#' }
#'
#' @md
#' @name ColorPicker
NULL

#' ComboBox
#'
#' @description
#' A combo box (`ComboBox`) combines a text field and a drop-down menu, giving people a way to select an option from a list or enter their own choice.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ComboBox).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a combo box when there are multiple choices that can be collapsed under one title, when the list of items is long, or when space is constrained.
#'
#' ### Content
#'
#' - Use single words or shortened statements as options.
#' - Don't use punctuation at the end of options.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowFreeform }} {`boolean` \cr Whether the ComboBox is free form, meaning that the user input is not bound to provided options. Defaults to false.}
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Optional prop to add a string id that can be referenced inside the aria-describedby attribute}
#' \item {\bold{ autoComplete }} {`'on' | 'off'` \cr Whether the ComboBox auto completes. As the user is inputing text, it will be suggested potential matches from the list of options. If the combo box is expanded, this will also scroll to the suggested option, and give it a selected style.}
#' \item {\bold{ autofill }} {`IAutofillProps` \cr The AutofillProps to be passed into the Autofill component inside combobox}
#' \item {\bold{ buttonIconProps }} {`IIconProps` \cr The IconProps to use for the button aspect of the combobox}
#' \item {\bold{ caretDownButtonStyles }} {`Partial<IButtonStyles>` \cr Styles for the caret down button.}
#' \item {\bold{ comboBoxOptionStyles }} {`Partial<IComboBoxOptionStyles>` \cr Default styles that should be applied to ComboBox options, in case an option does not come with user-defined custom styles}
#' \item {\bold{ componentRef }} {`IRefObject<IComboBox>` \cr Optional callback to access the IComboBox interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dropdownMaxWidth }} {`number` \cr Custom max width for dropdown}
#' \item {\bold{ dropdownWidth }} {`number` \cr Custom width for dropdown (unless useComboBoxAsMenuWidth is undefined or false)}
#' \item {\bold{ getClassNames }} {`(theme: ITheme, isOpen: boolean, disabled: boolean, required: boolean, focused: boolean, allowFreeForm: boolean, hasErrorMessage: boolean, className?: string) => IComboBoxClassNames` \cr Custom function for providing the classNames for the ComboBox. Can be used to provide all styles for the component instead of applying them on top of the default styles.}
#' \item {\bold{ iconButtonProps }} {`IButtonProps` \cr Optional iconButton props on combo box}
#' \item {\bold{ isButtonAriaHidden }} {`boolean` \cr Sets the 'aria-hidden' attribute on the ComboBox's button element instructing screen readers how to handle the element. This element is hidden by default because all functionality is handled by the input element and the arrow button is only meant to be decorative.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this combo box}
#' \item {\bold{ multiSelectDelimiter }} {`string` \cr When multiple items are selected, this will be used to separate values in the combobox input.}
#' \item {\bold{ onChange }} {`(event: React.FormEvent<IComboBox>, option?: IComboBoxOption, index?: number, value?: string) => void` \cr Callback issued when either: 1) the selected option changes 2) a manually edited value is submitted. In this case there may not be a matched option if allowFreeform is also true (and hence only value would be true, the other parameter would be null in this case)}
#' \item {\bold{ onItemClick }} {`(event: React.FormEvent<IComboBox>, option?: IComboBoxOption, index?: number) => void` \cr Callback issued when a ComboBox item is clicked.}
#' \item {\bold{ onMenuDismiss }} {`() => void` \cr Function that gets invoked before the menu gets dismissed}
#' \item {\bold{ onMenuDismissed }} {`() => void` \cr Function that gets invoked when the ComboBox menu is dismissed}
#' \item {\bold{ onMenuOpen }} {`() => void` \cr Function that gets invoked when the ComboBox menu is launched}
#' \item {\bold{ onPendingValueChanged }} {`(option?: IComboBoxOption, index?: number, value?: string) => void` \cr Callback issued when the user changes the pending value in ComboBox. This will be called any time the component is updated and there is a current pending value. Option, index, and value will all be undefined if no change has taken place and the previously entered pending value is still valid.}
#' \item {\bold{ onRenderLabel }} {`IRenderFunction<IOnRenderComboBoxLabelProps>` \cr Custom render function for the label text.}
#' \item {\bold{ onRenderLowerContent }} {`IRenderFunction<IComboBoxProps>` \cr Add additional content below the callout list.}
#' \item {\bold{ onRenderUpperContent }} {`IRenderFunction<IComboBoxProps>` \cr Add additional content above the callout list.}
#' \item {\bold{ onResolveOptions }} {`(options: IComboBoxOption[]) => IComboBoxOption[] | PromiseLike<IComboBoxOption[]>` \cr Callback issued when the options should be resolved, if they have been updated or if they need to be passed in the first time}
#' \item {\bold{ onScrollToItem }} {`(itemIndex: number) => void` \cr Callback issued when the ComboBox requests the list to scroll to a specific element}
#' \item {\bold{ options }} {`IComboBoxOption[]` \cr Collection of options for this ComboBox}
#' \item {\bold{ persistMenu }} {`boolean` \cr Menu will not be created or destroyed when opened or closed, instead it will be hidden. This will improve perf of the menu opening but could potentially impact overall perf by having more elements in the dom. Should only be used when perf is important. Note: This may increase the amount of time it takes for the comboBox itself to mount.}
#' \item {\bold{ scrollSelectedToTop }} {`boolean` \cr When options are scrollable the selected option is positioned at the top of the callout when it is opened (unless it has reached the end of the scrollbar).}
#' \item {\bold{ shouldRestoreFocus }} {`boolean` \cr When specified, determines whether the callout (the menu which drops down) should restore the focus after being dismissed or not. If false, then the menu will not try to set focus to whichever element had focus before the menu was opened.}
#' \item {\bold{ styles }} {`Partial<IComboBoxStyles>` \cr Custom styles for this component}
#' \item {\bold{ text }} {`string` \cr Value to show in the input, does not have to map to a combobox option}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ useComboBoxAsMenuWidth }} {`boolean` \cr Whether to use the ComboBoxes width as the menu's width}
#' \item {\bold{ multiselectAccessibleText }} {`string` \cr Accessible text for label when combobox is multiselected.}
#' \item {\bold{ props }} {`IComboBoxProps` \cr Props to render the combobox.}
#' }
#'
#' @md
#' @name ComboBox
NULL

#' CommandBar
#'
#' @description
#' CommandBar is a surface that houses commands that operate on the content of
#' the window, panel, or parent region it resides above. CommandBars are one of the most
#' visible and recognizable ways to surface commands, and can be an intuitive
#' method for interacting with content on the page; however, if overloaded or
#' poorly organized, they can be difficult to use and hide valuable commands from
#' your user. CommandBars can also display a search box for finding content, hold
#' simple commands as well as menus, or display the status of ongoing actions.
#'
#' Commands should be sorted in order of importance, from left-to-right or right-to-left
#' depending on the culture. Secondarily, organize commands in logical
#' groupings for easier recall. CommandBars work best when they display no more
#' than 5-7 commands. This helps users quickly find your most valuable features.
#' If you need to show more commands, consider using the overflow menu. If you
#' need to render status or viewing controls, these go on the right side of the
#' CommandBar (or left side if in a left-to-right experience). Do not display
#' more than 2-3 items on the right side as it will make the overall CommandBar
#' difficult to parse.
#'
#' All command items should have an icon and a label. Commands can render as
#' labels only as well. In smaller widths, commands can just use icon only, but
#' only for the most recognizable and frequently used commands. All other
#' commands should go into an overflow where text labels can be shown.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/CommandBar).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ buttonStyles }} {`IButtonStyles` \cr Custom styles for individual button}
#' \item {\bold{ cacheKey }} {`string` \cr A custom cache key to be used for this item. If `cacheKey` is changed, the cache will invalidate. Defaults to `key` value.}
#' \item {\bold{ commandBarButtonAs }} {`IComponentAs<ICommandBarItemProps>` \cr Method to override the render of the individual command bar button. Not used when item is rendered in overflow.}
#' \item {\bold{ iconOnly }} {`boolean` \cr Show only an icon for this item, not text. Does not apply if item is in the overflow.}
#' \item {\bold{ renderedInOverflow }} {`boolean` \cr Context under which the item is being rendered. This value is mutated by the CommandBar and is useful for adjusting the `onRender` function.}
#' \item {\bold{ tooltipHostProps }} {`ITooltipHostProps` \cr Props for the tooltip when in `iconOnly` mode.}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessibility text to be read by the screen reader when the user's focus enters the command bar. The screen reader will read this text after reading information about the first focusable item in the command bar.}
#' \item {\bold{ buttonAs }} {`IComponentAs<IButtonProps>` \cr Custom component for the near and far item buttons. Not used for overflow menu items.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the command bar}
#' \item {\bold{ componentRef }} {`IRefObject<ICommandBar>` \cr Optional callback to access the ICommandBar interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dataDidRender }} {`(renderedData: any) => void` \cr Function to be called every time data is rendered. It provides the data that was actually rendered. A use case would be adding telemetry when a particular control is shown in an overflow or dropped as a result of `onReduceData`, or to count the number of renders that an implementation of `onReduceData` triggers.}
#' \item {\bold{ farItems }} {`ICommandBarItemProps[]` \cr Items to render on the right side (or left, in RTL). ICommandBarItemProps extends IContextualMenuItem.}
#' \item {\bold{ items }} {`ICommandBarItemProps[]` \cr Items to render. ICommandBarItemProps extends IContextualMenuItem.}
#' \item {\bold{ onDataGrown }} {`(movedItem: ICommandBarItemProps) => void` \cr Callback invoked when data has been grown.}
#' \item {\bold{ onDataReduced }} {`(movedItem: ICommandBarItemProps) => void` \cr Callback invoked when data has been reduced.}
#' \item {\bold{ onGrowData }} {`(data: ICommandBarData) => ICommandBarData | undefined` \cr Custom function to grow data if items are too small for the given space. Return `undefined` if no more steps can be taken to avoid infinate loop.}
#' \item {\bold{ onReduceData }} {`(data: ICommandBarData) => ICommandBarData | undefined` \cr Custom function to reduce data if items do not fit in given space. Return `undefined` if no more steps can be taken to avoid infinate loop.}
#' \item {\bold{ overflowButtonAs }} {`IComponentAs<IButtonProps>` \cr Custom component for the overflow button.}
#' \item {\bold{ overflowButtonProps }} {`IButtonProps` \cr Props to be passed to overflow button. If `menuProps` are passed through this prop, any items provided will be prepended to any computed overflow items.}
#' \item {\bold{ overflowItems }} {`ICommandBarItemProps[]` \cr Default items to have in the overflow menu. ICommandBarItemProps extends IContextualMenuItem.}
#' \item {\bold{ shiftOnReduce }} {`boolean` \cr When true, items will be 'shifted' off the front of the array when reduced, and unshifted during grow.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ICommandBarStyleProps, ICommandBarStyles>` \cr Customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name CommandBar
NULL

#' ContextualMenu
#'
#' @description
#' ContextualMenus are lists of commands that are based on the context of selection, mouse hover or keyboard focus. They are one of the most effective and highly used command surfaces, and can be used in a variety of places.
#'
#' There are variants that originate from a command bar, or from cursor or focus. Those that come from CommandBars use a beak that is horizontally centered on the button. Ones that come from right click and menu button do not have a beak, but appear to the right and below the cursor. ContextualMenus can have submenus from commands, show selection checks, and icons.
#'
#' Organize commands in groups divided by rules. This helps users remember command locations, or find less used commands based on proximity to others. One should also group sets of mutually exclusive or multiple selectable options. Use icons sparingly, for high value commands, and don’t mix icons with selection checks, as it makes parsing commands difficult. Avoid submenus of submenus as they can be difficult to invoke or remember.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ContextualMenu).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the ContextualMenuItem}
#' \item {\bold{ classNames }} {`IMenuItemClassNames` \cr Classnames for different aspects of a menu item}
#' \item {\bold{ componentRef }} {`IRefObject<IContextualMenuRenderItem>` \cr Optional callback to access the IContextualMenuRenderItem interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dismissMenu }} {`(ev?: any, dismissAll?: boolean) => void` \cr This prop will get set by ContextualMenu and can be called to close the menu this item belongs to. If dismissAll is true, all menus will be closed.}
#' \item {\bold{ dismissSubMenu }} {`() => void` \cr This prop will get set by ContextualMenu and can be called to close this item's subMenu, if present.}
#' \item {\bold{ getSubmenuTarget }} {`() => HTMLElement | undefined` \cr This prop will get set by the wrapping component and will return the element that wraps this ContextualMenuItem. Used for openSubMenu.}
#' \item {\bold{ hasIcons }} {`boolean | undefined` \cr If this item has icons}
#' \item {\bold{ index }} {`number` \cr Index of the item}
#' \item {\bold{ item }} {`IContextualMenuItem` \cr The item to display}
#' \item {\bold{ onCheckmarkClick }} {`(item: IContextualMenuItem, ev: React.MouseEvent<HTMLElement>) => void` \cr Click handler for the checkmark}
#' \item {\bold{ openSubMenu }} {`(item: any, target: HTMLElement) => void` \cr This prop will get set by ContextualMenu and can be called to open this item's subMenu, if present.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IContextualMenuItemStyleProps, IContextualMenuItemStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ focusableElementIndex }} {`number` \cr }
#' \item {\bold{ hasCheckmarks }} {`boolean` \cr }
#' \item {\bold{ hasIcons }} {`boolean` \cr }
#' \item {\bold{ index }} {`number` \cr }
#' \item {\bold{ totalItemCount }} {`number` \cr }
#' \item {\bold{ defaultMenuItemRenderer }} {`(item: IContextualMenuItemRenderProps) => React.ReactNode` \cr }
#' \item {\bold{ hasCheckmarks }} {`boolean` \cr }
#' \item {\bold{ hasIcons }} {`boolean` \cr }
#' \item {\bold{ items }} {`IContextualMenuItem[]` \cr }
#' \item {\bold{ role }} {`string` \cr }
#' \item {\bold{ totalItemCount }} {`number` \cr }
#' \item {\bold{ alignTargetEdge }} {`boolean` \cr If true the positioning logic will prefer to flip edges rather than to nudge the rectangle to fit within bounds, thus making sure the element aligns perfectly with target's alignment edge}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessible label for the ContextualMenu's root element (inside the callout).}
#' \item {\bold{ beakWidth }} {`number` \cr The width of the beak.}
#' \item {\bold{ bounds }} {`IRectangle | ((target?: Target, targetWindow?: Window) => IRectangle | undefined)` \cr The bounding rectangle (or callback that returns a rectangle) which the contextual menu can appear in.}
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr Additional custom props for the Callout.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class to apply to the ContextualMenu.}
#' \item {\bold{ componentRef }} {`IRefObject<IContextualMenu>` \cr Optional callback to access the IContextualMenu interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ contextualMenuItemAs }} {`React.ComponentClass<IContextualMenuItemProps> | React.FunctionComponent<IContextualMenuItemProps>` \cr Custom component to use for rendering individual menu items.}
#' \item {\bold{ coverTarget }} {`boolean` \cr If true, the menu will be positioned to cover the target. If false, it will be positioned next to the target.}
#' \item {\bold{ delayUpdateFocusOnHover }} {`boolean` \cr If true, the contextual menu will not be updated until focus enters the menu via other means. This will only result in different behavior when `shouldFocusOnMount = false`.}
#' \item {\bold{ directionalHint }} {`DirectionalHint` \cr How the menu should be positioned}
#' \item {\bold{ directionalHintFixed }} {`boolean` \cr If true the position will not change sides in an attempt to fit the ContextualMenu within bounds. It will still attempt to align it to whatever bounds are given.}
#' \item {\bold{ directionalHintForRTL }} {`DirectionalHint` \cr How the menu should be positioned in RTL layouts. If not specified, a mirror of `directionalHint` will be used.}
#' \item {\bold{ doNotLayer }} {`boolean` \cr If true do not render on a new layer. If false render on a new layer.}
#' \item {\bold{ focusZoneProps }} {`IFocusZoneProps` \cr Props to pass down to the FocusZone. NOTE: the default FocusZoneDirection will be used unless a direction is specified in the focusZoneProps (even if other focusZoneProps are defined)}
#' \item {\bold{ gapSpace }} {`number` \cr The gap between the ContextualMenu and the target}
#' \item {\bold{ getMenuClassNames }} {`(theme: ITheme, className?: string) => IContextualMenuClassNames` \cr Method to provide the classnames to style the contextual menu.}
#' \item {\bold{ hidden }} {`boolean` \cr If true, renders the ContextualMenu in a hidden state. Use this flag, rather than rendering a ContextualMenu conditionally based on visibility, to improve rendering performance when it becomes visible. Note: When ContextualMenu is hidden its content will not be rendered. It will only render once the ContextualMenu is visible.}
#' \item {\bold{ id }} {`string` \cr ID for the ContextualMenu's root element (inside the callout). Should be used for `aria-owns` and other such uses, rather than direct reference for programmatic purposes.}
#' \item {\bold{ isBeakVisible }} {`boolean` \cr If true then the beak is visible. If false it will not be shown.}
#' \item {\bold{ isSubMenu }} {`boolean` \cr Whether this menu is a submenu of another menu.}
#' \item {\bold{ items }} {`IContextualMenuItem[]` \cr Menu items to display.}
#' \item {\bold{ labelElementId }} {`string` \cr Used as `aria-labelledby` for the menu element inside the callout.}
#' \item {\bold{ onDismiss }} {`(ev?: React.MouseEvent | React.KeyboardEvent, dismissAll?: boolean) => void` \cr Callback when the ContextualMenu tries to close. If `dismissAll` is true then all submenus will be dismissed.}
#' \item {\bold{ onItemClick }} {`(ev?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>, item?: IContextualMenuItem) => boolean | void` \cr Click handler which is invoked if `onClick` is not passed for individual contextual menu item. Returning true will dismiss the menu even if `ev.preventDefault()` was called.}
#' \item {\bold{ onMenuDismissed }} {`(contextualMenu?: IContextualMenuProps) => void` \cr Callback for when the menu is being closed (removing from the DOM).}
#' \item {\bold{ onMenuOpened }} {`(contextualMenu?: IContextualMenuProps) => void` \cr Callback for when the menu has been opened.}
#' \item {\bold{ onRenderMenuList }} {`IRenderFunction<IContextualMenuListProps>` \cr Method to override the render of the list of menu items.}
#' \item {\bold{ onRenderSubMenu }} {`IRenderFunction<IContextualMenuProps>` \cr Custom render function for a submenu.}
#' \item {\bold{ onRestoreFocus }} {`(options: { originalElement?: HTMLElement | Window; containsFocus: boolean; }) => void` \cr Called when the component is unmounting, and focus needs to be restored. Argument passed down contains two variables, the element that the underlying popup believes focus should go to and whether or not the popup currently contains focus. If this prop is provided, focus will not be restored automatically, you'll need to call originalElement.focus()}
#' \item {\bold{ shouldFocusOnContainer }} {`boolean` \cr Whether to focus on the contextual menu container (as opposed to the first menu item).}
#' \item {\bold{ shouldFocusOnMount }} {`boolean` \cr Whether to focus on the menu when mounted.}
#' \item {\bold{ shouldUpdateWhenHidden }} {`boolean` \cr If true, the menu will be updated even when `hidden=true`. Note that this will consume resources to update even when nothing is being shown to the user. This might be helpful if your updates are small and you want the menu to display quickly when `hidden` is set to false.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IContextualMenuStyleProps, IContextualMenuStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ subMenuHoverDelay }} {`number` \cr Delay (in milliseconds) to wait before expanding / dismissing a submenu on mouseEnter or mouseLeave}
#' \item {\bold{ target }} {`Target` \cr The target that the ContextualMenu should try to position itself based on. It can be either an element, a query selector string resolving to a valid element, or a MouseEvent. If a MouseEvent is given, the origin point of the event will be used.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher-order component.}
#' \item {\bold{ title }} {`string` \cr Title to be displayed at the top of the menu, above the items.}
#' \item {\bold{ useTargetAsMinWidth }} {`boolean` \cr If true the context menu will have a minimum width equal to the width of the target element}
#' \item {\bold{ useTargetWidth }} {`boolean` \cr If true the context menu will render as the same width as the target element}
#' }
#'
#' @md
#' @name ContextualMenu
NULL

#' DatePicker
#'
#' @description
#' Picking a date can be tough without context. A date picker (`DatePicker`) offers a drop-down control that’s optimized for picking a single date from a calendar view where contextual information like the day of the week or fullness of the calendar is important. You can modify the calendar to provide additional context or to limit available dates.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/DatePicker).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use the control the way it’s designed and built. Don’t break it apart.
#'
#' ### Content
#'
#' - The control provides the date in a specific format. If the date can be entered in an input field, provide helper text in the appropriate format.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allFocusable }} {`boolean` \cr Allows all elements to be focused, including disabled ones}
#' \item {\bold{ allowTextInput }} {`boolean` \cr Whether the DatePicker allows input a date string directly or not}
#' \item {\bold{ ariaLabel }} {`string` \cr Aria Label for TextField of the DatePicker for screen reader users.}
#' \item {\bold{ borderless }} {`boolean` \cr Determines if DatePicker has a border.}
#' \item {\bold{ calendarAs }} {`IComponentAs<ICalendarProps>` \cr Custom Calendar to be used for date picking}
#' \item {\bold{ calendarProps }} {`ICalendarProps` \cr Pass calendar props to calendar component}
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr Pass callout props to callout component}
#' \item {\bold{ className }} {`string` \cr Optional Classname for datepicker root element .}
#' \item {\bold{ componentRef }} {`IRefObject<IDatePicker>` \cr Optional callback to access the IDatePicker interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dateTimeFormatter }} {`ICalendarFormatDateCallbacks` \cr Apply additional formating to dates, for example localized date formatting.}
#' \item {\bold{ disableAutoFocus }} {`boolean` \cr Whether the DatePicker should open automatically when the control is focused}
#' \item {\bold{ disabled }} {`boolean` \cr Disabled state of the DatePicker.}
#' \item {\bold{ firstDayOfWeek }} {`DayOfWeek` \cr The first day of the week for your locale.}
#' \item {\bold{ firstWeekOfYear }} {`FirstWeekOfYear` \cr Defines when the first week of the year should start, FirstWeekOfYear.FirstDay, FirstWeekOfYear.FirstFullWeek or FirstWeekOfYear.FirstFourDayWeek are the possible values}
#' \item {\bold{ formatDate }} {`(date?: Date) => string` \cr Optional method to format the chosen date to a string to display in the DatePicker}
#' \item {\bold{ highlightCurrentMonth }} {`boolean` \cr Whether the month picker should highlight the current month}
#' \item {\bold{ highlightSelectedMonth }} {`boolean` \cr Whether the month picker should highlight the selected month}
#' \item {\bold{ initialPickerDate }} {`Date` \cr The initially highlighted date in the calendar picker}
#' \item {\bold{ isMonthPickerVisible }} {`boolean` \cr Whether the month picker is shown beside the day picker or hidden.}
#' \item {\bold{ isRequired }} {`boolean` \cr Whether the DatePicker is a required field or not}
#' \item {\bold{ label }} {`string` \cr Label for the DatePicker}
#' \item {\bold{ maxDate }} {`Date` \cr The maximum allowable date.}
#' \item {\bold{ minDate }} {`Date` \cr The minimum allowable date.}
#' \item {\bold{ onAfterMenuDismiss }} {`() => void` \cr Callback that runs after DatePicker's menu (Calendar) is closed}
#' \item {\bold{ onSelectDate }} {`(date: Date | null | undefined) => void` \cr Callback issued when a date is selected}
#' \item {\bold{ parseDateFromString }} {`(dateStr: string) => Date | null` \cr Optional method to parse the text input value to date, it is only useful when allowTextInput is set to true}
#' \item {\bold{ pickerAriaLabel }} {`string` \cr Aria label for date picker popup for screen reader users.}
#' \item {\bold{ placeholder }} {`string` \cr Placeholder text for the DatePicker}
#' \item {\bold{ showCloseButton }} {`boolean` \cr Whether the CalendarDay close button should be shown or not.}
#' \item {\bold{ showGoToToday }} {`boolean` \cr Whether the "Go to today" link should be shown or not}
#' \item {\bold{ showMonthPickerAsOverlay }} {`boolean` \cr Show month picker on top of date picker when visible.}
#' \item {\bold{ showWeekNumbers }} {`boolean` \cr Whether the calendar should show the week number (weeks 1 to 53) before each week row}
#' \item {\bold{ strings }} {`IDatePickerStrings` \cr Localized strings to use in the DatePicker}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDatePickerStyleProps, IDatePickerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ tabIndex }} {`number` \cr The tabIndex of the TextField}
#' \item {\bold{ textField }} {`ITextFieldProps` \cr Pass textField props to textField component. Prop name is "textField" for compatiblity with upcoming slots work.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ today }} {`Date` \cr Value of today. If null, current time in client machine will be used.}
#' \item {\bold{ underlined }} {`boolean` \cr Whether or not the Textfield of the DatePicker is underlined.}
#' \item {\bold{ value }} {`Date` \cr Default value of the DatePicker, if any}
#' }
#'
#' @md
#' @name DatePicker
NULL

#' DetailsList
#'
#' @description
#' A details list (`DetailsList`) is a robust way to display an information-rich collection of items, and allow people to sort, group, and filter the content. Use a details list when information density is critical.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/DetailsList).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - List items are composed of selection, icon, and name columns at minimum. You can include other columns, such as date modified, or any other metadata field associated with the collection.
#' - Avoid using file type icon overlays to denote status of a file as it can make the entire icon unclear.
#' - If there are multiple lines of text in a column, consider the variable row height variant.
#' - Give columns ample default width to display information.
#'
#' ### Content
#'
#' - Use sentence-style capitalization for column headers—only capitalize the first word. For more info, see `[Capitalization]` in the Microsoft Writing Style Guide.
#'
#' `[capitalization]`: https://docs.microsoft.com/style-guide/capitalization
#'
#' ### FAQ
#'
#' #### My scrollable content isn't updating on scroll. What should I do?
#'
#' Add the `data-is-scrollable="true"` attribute to your scrollable element containing the DetailsList.
#'
#' By default, the List used within DetailsList will use the `body` element as the scrollable element. If you contain the List within a scrollable `div` using `overflow: auto` or `scroll`, the List needs to listen for scroll events on that element instead. On initialization, the List will traverse up the DOM looking for the first element with the `data-is-scrollable` attribute to know which element to listen to for knowing when to re-evaulate the visible window.
#'
#' #### My List is not re-rendering when I mutate its items. What should I do?
#'
#' To determine if the List within DetailsList should re-render its contents, the component performs a referential equality check within its `shouldComponentUpdate` method. This is done to minimize the performance overhead associated with re-rendering the virtualized List pages, as recommended by the [React documentation](https://reactjs.org/docs/optimizing-performance.html#the-power-of-not-mutating-data).
#'
#' As a result of this implementation, the inner List will not determine it should re-render if the array values are mutated.
#' To avoid this problem, we recommend re-creating the items array backing the DetailsList by using a method such as `Array.prototype.concat` or ES6 spread syntax shown below:
#'
#' ```tsx
#' public appendItems(): void {
#'   const { items } = this.state;
#'
#'   this.setState({
#'     items: [...items, ...['Foo', 'Bar']]
#'   })
#' }
#'
#' public render(): JSX.Element {
#'   const { items } = this.state;
#'
#'   return <DetailsList items={items} />;
#' }
#' ```
#'
#' By re-creating the items array without mutating the values, the inner List will correctly determine its contents have changed and it should then re-render with the new values.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ onColumnDragEnd }} {`(props: { dropLocation?: ColumnDragEndLocation; }, event: MouseEvent) => void` \cr Callback to notify the column dragEnd event to List Need this to check whether the dragEnd has happened on corresponding list or outside of the list}
#' \item {\bold{ cellStyleProps }} {`ICellStyleProps` \cr Custom styles for cell rendering.}
#' \item {\bold{ column }} {`IColumn` \cr The column definition for the component instance.}
#' \item {\bold{ columnIndex }} {`number` \cr The column index for the component instance.}
#' \item {\bold{ componentRef }} {`() => void` \cr A reference to the component instance.}
#' \item {\bold{ dragDropHelper }} {`IDragDropHelper | null` \cr The drag and drop helper for the component instance.}
#' \item {\bold{ isDraggable }} {`boolean` \cr Whether or not the column can be re-ordered via drag and drop.}
#' \item {\bold{ isDropped }} {`boolean` \cr Whether or not the column has been dropped via drag and drop.}
#' \item {\bold{ onColumnClick }} {`(ev: React.MouseEvent<HTMLElement>, column: IColumn) => void` \cr Callback fired when click event occurs.}
#' \item {\bold{ onColumnContextMenu }} {`(column: IColumn, ev: React.MouseEvent<HTMLElement>) => void` \cr Callback fired on contextual menu event to provide contextual menu UI.}
#' \item {\bold{ onRenderColumnHeaderTooltip }} {`IRenderFunction<IDetailsColumnRenderTooltipProps>` \cr Render function for providing a column header tooltip.}
#' \item {\bold{ parentId }} {`string` \cr Parent ID used for accessibility label(s).}
#' \item {\bold{ setDraggedItemIndex }} {`(itemIndex: number) => void` \cr }
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDetailsColumnStyleProps, IDetailsColumnStyles>` \cr The component styles to respect during render.}
#' \item {\bold{ theme }} {`ITheme` \cr The theme object to respect during render.}
#' \item {\bold{ updateDragInfo }} {`(props: { itemIndex: number; }, event?: MouseEvent) => void` \cr Callback on drag and drop event.}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ columns }} {`IColumn[]` \cr Column metadata}
#' \item {\bold{ selection }} {`ISelection` \cr Selection from utilities}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr Selection mode}
#' \item {\bold{ onRenderFooter }} {`IRenderFunction<IDetailsGroupDividerProps>` \cr }
#' \item {\bold{ onRenderHeader }} {`IRenderFunction<IDetailsGroupDividerProps>` \cr }
#' \item {\bold{ ariaLabel }} {`string` \cr ariaLabel for the entire header}
#' \item {\bold{ ariaLabelForSelectAllCheckbox }} {`string` \cr ariaLabel for the header checkbox that selects or deselects everything}
#' \item {\bold{ ariaLabelForSelectionColumn }} {`string` \cr ariaLabel for the selection column}
#' \item {\bold{ ariaLabelForToggleAllGroupsButton }} {`string` \cr ariaLabel for expand/collapse group button}
#' \item {\bold{ className }} {`string` \cr Overriding class name}
#' \item {\bold{ collapseAllVisibility }} {`CollapseAllVisibility` \cr Whether to collapse for all visibility}
#' \item {\bold{ columnReorderOptions }} {`IColumnReorderOptions` \cr Column reordering options}
#' \item {\bold{ columnReorderProps }} {`IColumnReorderHeaderProps` \cr Column reordering options}
#' \item {\bold{ componentRef }} {`IRefObject<IDetailsHeader>` \cr Ref to the component itself}
#' \item {\bold{ isAllCollapsed }} {`boolean` \cr Whether or not all is collapsed}
#' \item {\bold{ layoutMode }} {`DetailsListLayoutMode` \cr Layout mode - fixedColumns or justified}
#' \item {\bold{ minimumPixelsForDrag }} {`number` \cr Minimum pixels to be moved before dragging is registered}
#' \item {\bold{ onColumnAutoResized }} {`(column: IColumn, columnIndex: number) => void` \cr Callback for when column is automatically resized}
#' \item {\bold{ onColumnClick }} {`(ev: React.MouseEvent<HTMLElement>, column: IColumn) => void` \cr Callback for when the column is clicked}
#' \item {\bold{ onColumnContextMenu }} {`(column: IColumn, ev: React.MouseEvent<HTMLElement>) => void` \cr Callback for when the column needs to show a context menu}
#' \item {\bold{ onColumnIsSizingChanged }} {`(column: IColumn, isSizing: boolean) => void` \cr Callback for when column sizing has changed}
#' \item {\bold{ onColumnResized }} {`(column: IColumn, newWidth: number, columnIndex: number) => void` \cr Callback for when column is resized}
#' \item {\bold{ onRenderColumnHeaderTooltip }} {`IRenderFunction<IDetailsColumnRenderTooltipProps>` \cr Callback to render a tooltip for the column header}
#' \item {\bold{ onRenderDetailsCheckbox }} {`IRenderFunction<IDetailsCheckboxProps>` \cr If provided, can be used to render a custom checkbox}
#' \item {\bold{ onToggleCollapseAll }} {`(isAllCollapsed: boolean) => void` \cr Callback for when collapse all is toggled}
#' \item {\bold{ selectAllVisibility }} {`SelectAllVisibility` \cr Select all button visibility}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDetailsHeaderStyleProps, IDetailsHeaderStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme from the Higher Order Component}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ columns }} {`IColumn[]` \cr Column metadata}
#' \item {\bold{ selection }} {`ISelection` \cr Selection from utilities}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr Selection mode}
#' \item {\bold{ cellStyleProps }} {`ICellStyleProps` \cr Rules for rendering column cells.}
#' \item {\bold{ checkboxVisibility }} {`CheckboxVisibility | undefined` \cr Checkbox visibility}
#' \item {\bold{ columns }} {`IColumn[]` \cr Column metadata}
#' \item {\bold{ groupNestingDepth }} {`number` \cr Nesting depth of a grouping}
#' \item {\bold{ indentWidth }} {`number | undefined` \cr How much to indent}
#' \item {\bold{ rowWidth }} {`number` \cr Minimum width of the row.}
#' \item {\bold{ selection }} {`ISelection | undefined` \cr Selection from utilities}
#' \item {\bold{ selectionMode }} {`SelectionMode | undefined` \cr Selection mode}
#' \item {\bold{ viewport }} {`IViewport | undefined` \cr View port of the virtualized list}
#' \item {\bold{ ariaLabel }} {`string` \cr Accessible label describing or summarizing the list.}
#' \item {\bold{ ariaLabelForGrid }} {`string` \cr Accessible label for the grid within the list.}
#' \item {\bold{ ariaLabelForListHeader }} {`string` \cr Accessible label for the list header.}
#' \item {\bold{ ariaLabelForSelectAllCheckbox }} {`string` \cr Accessible label for the select all checkbox.}
#' \item {\bold{ ariaLabelForSelectionColumn }} {`string` \cr Accessible label for the name of the selection column.}
#' \item {\bold{ cellStyleProps }} {`ICellStyleProps` \cr Props impacting the render style of cells. Since these have an impact on calculated column widths, they are handled separately from normal theme styling, but they are passed to the styling system.}
#' \item {\bold{ checkboxCellClassName }} {`string` \cr Class name to add to the cell of a checkbox.}
#' \item {\bold{ checkboxVisibility }} {`CheckboxVisibility` \cr Controls the visibility of selection check box.}
#' \item {\bold{ checkButtonAriaLabel }} {`string` \cr Accessible label for the check button.}
#' \item {\bold{ className }} {`string` \cr Class name to add to the root element.}
#' \item {\bold{ columnReorderOptions }} {`IColumnReorderOptions` \cr Options for column reordering using drag and drop.}
#' \item {\bold{ columns }} {`IColumn[]` \cr column defitions. If none are provided, default columns will be created based on the items' properties.}
#' \item {\bold{ compact }} {`boolean` \cr Whether to render in compact mode.}
#' \item {\bold{ componentRef }} {`IRefObject<IDetailsList>` \cr Callback to access the IDetailsList interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ constrainMode }} {`ConstrainMode` \cr Controls how the list contrains overflow.}
#' \item {\bold{ disableSelectionZone }} {`boolean` \cr Whether to disable the built-in SelectionZone, so the host component can provide its own.}
#' \item {\bold{ dragDropEvents }} {`IDragDropEvents` \cr Map of callback functions related to row drag and drop functionality.}
#' \item {\bold{ enableUpdateAnimations }} {`boolean` \cr Whether to animate updates}
#' \item {\bold{ enterModalSelectionOnTouch }} {`boolean` \cr Whether the selection zone should enter modal state on touch.}
#' \item {\bold{ getCellValueKey }} {`(item?: any, index?: number, column?: IColumn) => string` \cr If provided, will be the "default" item column cell value return. A column's `getValueKey` can override `getCellValueKey`.}
#' \item {\bold{ getGroupHeight }} {`IGroupedListProps['getGroupHeight']` \cr Callback to override default group height calculation used by list virtualization.}
#' \item {\bold{ getKey }} {`(item: any, index?: number) => string` \cr Callback to get the item key, to be used in the selection and on render. Must be provided if sorting or filtering is enabled.}
#' \item {\bold{ getRowAriaDescribedBy }} {`(item: any) => string` \cr Callback to get the aria-describedby IDs (space-separated strings) of elements that describe the item.}
#' \item {\bold{ getRowAriaLabel }} {`(item: any) => string` \cr Callback to get the aria-label string for a given item.}
#' \item {\bold{ groupProps }} {`IDetailsGroupRenderProps` \cr Override properties to render groups.}
#' \item {\bold{ groups }} {`IGroup[]` \cr Grouping instructions.}
#' \item {\bold{ indentWidth }} {`number` \cr Override for the indent width used for group nesting.}
#' \item {\bold{ initialFocusedIndex }} {`number` \cr Default index to set focus to once the items have rendered and the index exists.}
#' \item {\bold{ isHeaderVisible }} {`boolean` \cr Controls the visibility of the header.}
#' \item {\bold{ isPlaceholderData }} {`boolean` \cr Set this to true to indicate that the items being displayed are placeholder data.}
#' \item {\bold{ items }} {`any[]` \cr The items to render.}
#' \item {\bold{ layoutMode }} {`DetailsListLayoutMode` \cr Controls how the columns are adjusted.}
#' \item {\bold{ listProps }} {`IListProps` \cr Properties to pass through to the List components being rendered.}
#' \item {\bold{ minimumPixelsForDrag }} {`number` \cr The minimum mouse move distance to interpret the action as drag event.}
#' \item {\bold{ onActiveItemChanged }} {`(item?: any, index?: number, ev?: React.FocusEvent<HTMLElement>) => void` \cr Callback for when an item in the list becomes active by clicking anywhere inside the row or navigating to it with the keyboard.}
#' \item {\bold{ onColumnHeaderClick }} {`(ev?: React.MouseEvent<HTMLElement>, column?: IColumn) => void` \cr Callback for when the user clicks on the column header.}
#' \item {\bold{ onColumnHeaderContextMenu }} {`(column?: IColumn, ev?: React.MouseEvent<HTMLElement>) => void` \cr Callback for when the user asks for a contextual menu (usually via right click) from a column header.}
#' \item {\bold{ onColumnResize }} {`(column?: IColumn, newWidth?: number, columnIndex?: number) => void` \cr Callback fired on column resize}
#' \item {\bold{ onDidUpdate }} {`(detailsList?: DetailsListBase) => void` \cr Callback for when the list has been updated. Useful for telemetry tracking externally.}
#' \item {\bold{ onItemContextMenu }} {`(item?: any, index?: number, ev?: Event) => void | boolean` \cr Callback for when the context menu of an item has been accessed. If undefined or false is returned, `ev.preventDefault()` will be called.}
#' \item {\bold{ onItemInvoked }} {`(item?: any, index?: number, ev?: Event) => void` \cr Callback for when a given row has been invoked (by pressing enter while it is selected.)}
#' \item {\bold{ onRenderCheckbox }} {`IRenderFunction<IDetailsListCheckboxProps>` \cr If provided, can be used to render a custom checkbox.}
#' \item {\bold{ onRenderDetailsFooter }} {`IRenderFunction<IDetailsFooterProps>` \cr An override to render the details footer.}
#' \item {\bold{ onRenderDetailsHeader }} {`IRenderFunction<IDetailsHeaderProps>` \cr An override to render the details header.}
#' \item {\bold{ onRenderItemColumn }} {`(item?: any, index?: number, column?: IColumn) => React.ReactNode` \cr If provided, will be the "default" item column renderer method. This affects cells within the rows, not the rows themselves. If a column definition provides its own `onRender` method, that will be used instead of this.}
#' \item {\bold{ onRenderMissingItem }} {`(index?: number, rowProps?: IDetailsRowProps) => React.ReactNode` \cr Callback for what to render when the item is missing.}
#' \item {\bold{ onRenderRow }} {`IRenderFunction<IDetailsRowProps>` \cr Callback to override the default row rendering.}
#' \item {\bold{ onRowDidMount }} {`(item?: any, index?: number) => void` \cr Callback for when a given row has been mounted. Useful for identifying when a row has been rendered on the page.}
#' \item {\bold{ onRowWillUnmount }} {`(item?: any, index?: number) => void` \cr Callback for when a given row has been unmounted. Useful for identifying when a row has been removed from the page.}
#' \item {\bold{ onShouldVirtualize }} {`(props: IListProps) => boolean` \cr Callback to determine whether the list should be rendered in full, or virtualized.
#'
#' Virtualization will add and remove pages of items as the user scrolls them into the visible range. This benefits larger list scenarios by reducing the DOM on the screen, but can negatively affect performance for smaller lists.
#'
#' The default implementation will virtualize when this callback is not provided.}
#' \item {\bold{ rowElementEventMap }} {`{ eventName: string; callback: (context: IDragDropContext, event?: any) => void; }[]` \cr Event names and corresponding callbacks that will be registered to rendered row elements.}
#' \item {\bold{ selection }} {`ISelection` \cr Selection model to track selection state.}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr Controls how/if the details list manages selection. Options include none, single, multiple}
#' \item {\bold{ selectionPreservedOnEmptyClick }} {`boolean` \cr By default, selection is cleared when clicking on an empty (non-focusable) section of the screen. Setting this value to true overrides that behavior and maintains selection.}
#' \item {\bold{ selectionZoneProps }} {`ISelectionZoneProps` \cr Additional props to pass through to the SelectionZone created by default.}
#' \item {\bold{ setKey }} {`string` \cr A key that uniquely identifies the given items. If provided, the selection will be reset when the key changes.}
#' \item {\bold{ shouldApplyApplicationRole }} {`boolean` \cr Whether the role `application` should be applied to the list.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDetailsListStyleProps, IDetailsListStyles>` \cr Custom overrides to the themed or default styles.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by a higher-order component.}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ usePageCache }} {`boolean` \cr Whether to enable render page caching. This is an experimental performance optimization that is off by default.}
#' \item {\bold{ useReducedRowRenderer }} {`boolean` \cr Whether to re-render a row only when props changed. Might cause regression when depending on external updates.}
#' \item {\bold{ viewport }} {`IViewport` \cr Viewport info, provided by the `withViewport` decorator.}
#' \item {\bold{ cellsByColumn }} {`{ [columnKey: string]: React.ReactNode; }` \cr Optional pre-rendered content per column. Preferred over onRender or onRenderItemColumn if provided.}
#' \item {\bold{ checkboxCellClassName }} {`string` \cr Class name for the checkbox cell}
#' \item {\bold{ checkButtonAriaLabel }} {`string` \cr Check button's aria label}
#' \item {\bold{ className }} {`string` \cr Overriding class name}
#' \item {\bold{ collapseAllVisibility }} {`CollapseAllVisibility` \cr Collapse all visibility}
#' \item {\bold{ compact }} {`boolean` \cr Whether to render in compact mode}
#' \item {\bold{ componentRef }} {`IRefObject<IDetailsRow>` \cr Ref of the component}
#' \item {\bold{ dragDropEvents }} {`IDragDropEvents` \cr Handling drag and drop events}
#' \item {\bold{ dragDropHelper }} {`IDragDropHelper` \cr Helper for the drag and drop}
#' \item {\bold{ enableUpdateAnimations }} {`boolean` \cr Whether to animate updates}
#' \item {\bold{ eventsToRegister }} {`{ eventName: string; callback: (item?: any, index?: number, event?: any) => void; }[]` \cr A list of events to register}
#' \item {\bold{ getRowAriaDescribedBy }} {`(item: any) => string` \cr Callback for getting the row aria-describedby}
#' \item {\bold{ getRowAriaLabel }} {`(item: any) => string` \cr Callback for getting the row aria label}
#' \item {\bold{ item }} {`any` \cr Data source for this component}
#' \item {\bold{ itemIndex }} {`number` \cr Index of the collection of items of the DetailsList}
#' \item {\bold{ onDidMount }} {`(row?: DetailsRowBase) => void` \cr Callback for did mount for parent}
#' \item {\bold{ onRenderCheck }} {`(props: IDetailsRowCheckProps) => JSX.Element` \cr Callback for rendering a checkbox}
#' \item {\bold{ onRenderDetailsCheckbox }} {`IRenderFunction<IDetailsCheckboxProps>` \cr If provided, can be used to render a custom checkbox}
#' \item {\bold{ onWillUnmount }} {`(row?: DetailsRowBase) => void` \cr Callback for will mount for parent}
#' \item {\bold{ rowFieldsAs }} {`React.ComponentType<IDetailsRowFieldsProps>` \cr DOM element into which to render row field}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDetailsRowStyleProps, IDetailsRowStyles>` \cr Overriding styles to this row}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by styled() function}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ useReducedRowRenderer }} {`boolean` \cr Rerender DetailsRow only when props changed. Might cause regression when depending on external updates.}
#' \item {\bold{ anySelected }} {`boolean` \cr Is any selected - also true for isSelectionModal}
#' \item {\bold{ canSelect }} {`boolean` \cr Can this checkbox be selectable}
#' \item {\bold{ checkClassName }} {`string` \cr The classname to be passed down to Check component}
#' \item {\bold{ className }} {`string` \cr Optional className to attach to the slider root element.}
#' \item {\bold{ compact }} {`boolean` \cr Is this in compact mode?}
#' \item {\bold{ isHeader }} {`boolean` \cr Is the check part of the header in a DetailsList}
#' \item {\bold{ isVisible }} {`boolean` \cr Whether or not this checkbox is visible}
#' \item {\bold{ onRenderDetailsCheckbox }} {`IRenderFunction<IDetailsCheckboxProps>` \cr If provided, can be used to render a custom checkbox}
#' \item {\bold{ selected }} {`boolean` \cr Whether or not this check is selected}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDetailsRowCheckStyleProps, IDetailsRowCheckStyles>` \cr Style override}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ cellStyleProps }} {`ICellStyleProps` \cr Style properties to customize cell render output.}
#' \item {\bold{ columns }} {`IColumn[]` \cr Columns metadata}
#' \item {\bold{ columnStartIndex }} {`number` \cr Index to start for the column}
#' \item {\bold{ compact }} {`boolean` \cr whether to render as a compact field}
#' \item {\bold{ enableUpdateAnimations }} {`boolean` \cr }
#' \item {\bold{ item }} {`any` \cr Data source for this component}
#' \item {\bold{ itemIndex }} {`number` \cr The item index of the collection for the DetailsList}
#' \item {\bold{ rowClassNames }} {`{ [k in keyof Pick<IDetailsRowStyles, 'isMultiline' | 'isRowHeader' | 'cell' | 'cellAnimation' | 'cellPadded' | 'cellUnpadded' | 'fields'>]: string; }` \cr Subset of classnames currently generated in DetailsRow that are used within DetailsRowFields.}
#' \item {\bold{ columns }} {`IColumn[]` \cr Column metadata}
#' \item {\bold{ selection }} {`ISelection` \cr Selection from utilities}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr Selection mode}
#' \item {\bold{ ariaLabelForShimmer }} {`string` \cr Aria label for shimmer. Set on grid while shimmer is enabled.}
#' \item {\bold{ detailsListStyles }} {`IDetailsListProps['styles']` \cr DetailsList styles to pass through.}
#' \item {\bold{ enableShimmer }} {`boolean` \cr Boolean flag to control when to render placeholders vs real items. It's up to the consumer app to know when fetching of the data is done to toggle this prop.}
#' \item {\bold{ onRenderCustomPlaceholder }} {`(rowProps: IDetailsRowProps, index?: number, defaultRender?: (props: IDetailsRowProps) => React.ReactNode) => React.ReactNode` \cr Custom placeholder renderer to be used when in need to override the default placeholder of a DetailsRow. `rowProps` argument is passed to leverage the calculated column measurements done by DetailsList or you can use the optional arguments of item `index` and `defaultRender` to execute additional logic before rendering the default placeholder.}
#' \item {\bold{ removeFadingOverlay }} {`boolean` \cr Determines whether to remove a fading out to bottom overlay over the shimmering items used to further emphasize the unknown number of items that will be fetched.}
#' \item {\bold{ shimmerLines }} {`number` \cr Number of shimmer placeholder lines to render.}
#' \item {\bold{ shimmerOverlayStyles }} {`IStyleFunctionOrObject<IShimmeredDetailsListStyleProps, IShimmeredDetailsListStyles>` \cr Custom styles to override the styles specific to the ShimmeredDetailsList root area.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmeredDetailsListStyleProps, IShimmeredDetailsListStyles>` \cr Custom styles to override the styles specific to the ShimmeredDetailsList root area.}
#' \item {\bold{ skipViewportMeasures }} {`boolean` \cr Whether or not to use ResizeObserver (if available) to detect and measure viewport on 'resize' events.
#'
#' Falls back to window 'resize' event.}
#' }
#'
#' @md
#' @name DetailsList
NULL

#' Dialog
#'
#' @description
#' A dialog box (`Dialog`) is a temporary pop-up that takes focus from the page or app and requires people to interact with it. It’s primarily used for confirming actions, such as deleting a file, or asking people to make a choice.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Dialog).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Don't use more than three buttons.
#' - Dialog boxes consist of a header, body, and footer.
#' - Validate that people’s entries are acceptable before closing the dialog box. Show an inline validation error near the field they must correct.
#' - Blocking dialogs should be used very sparingly, only when it is critical that people make a choice or provide information before they can proceed. Blocking dialogs are generally used for irreversible or potentially destructive tasks. They’re typically paired with an overlay without a light dismiss.
#'
#' #### Header
#'
#' - Locks to the top of the dialog.
#' - May include an icon to the left of the title.
#' - Includes a Close button in the top-right corner.
#'
#' #### Footer
#'
#' - Lock buttons to the bottom of the dialog.
#' - Includes one primary button. A secondary button is optional.
#'
#' #### Width
#'
#' - Maximum is 340 pixels.
#' - Minimum is 288 pixels.
#'
#' #### Height
#'
#' - Maximum is 340 pixels.
#' - Minimum is 172 pixels.
#'
#' ### Content
#'
#' #### Title
#'
#' - Keep the title as concise as possible.
#' - Don’t use periods at the end of titles.
#' - This mandatory content should explain the main information in a clear, concise, and specific statement or question. For example, “Delete this file?” instead of “Are you sure?”
#' - The title shouldn’t be a description of the body content. For example, don’t use “Error” as a title. Instead, use an informative statement like “Your session ended.”
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' #### Body copy (Optional)
#'
#' - Don't restate the title in the body.
#' - Use ending punctuation on sentences.
#' - Use actionable language, with the most important information at the beginning.
#' - Use the optional body content area for additional info or instructions, if needed. Only include information needed to help people make a decision.
#'
#' #### Button labels
#'
#' - Write button labels that are specific responses to the main information in the title. The title “Delete this file?” could have buttons labeled “Delete” and “Cancel”.
#' - Be concise. Limit labels to one or two words. Usually a single verb is best. Include a noun if there is any room for interpretation about what the verb means. For example, “Delete” or “Delete file”.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ closeButtonAriaLabel }} {`string` \cr Label to be passed to to aria-label of close button}
#' \item {\bold{ componentRef }} {`IRefObject<IDialogContent>` \cr Optional callback to access the IDialogContent interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ draggableHeaderClassName }} {`string` \cr The classname for when the header is draggable}
#' \item {\bold{ isMultiline }} {`boolean` \cr Is inside a multiline wrapper}
#' \item {\bold{ onDismiss }} {`(ev?: React.MouseEvent<HTMLButtonElement>) => any` \cr Callback for when the Dialog is dismissed from the close button or light dismiss, before the animation completes.}
#' \item {\bold{ responsiveMode }} {`ResponsiveMode` \cr Responsive mode passed in from decorator.}
#' \item {\bold{ showCloseButton }} {`boolean` \cr Show an 'x' close button in the upper-right corner}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDialogContentStyleProps, IDialogContentStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ subText }} {`string` \cr The subtext to display in the dialog}
#' \item {\bold{ subTextId }} {`string` \cr The Id for subText container}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ title }} {`string | JSX.Element` \cr The title text to display at the top of the dialog.}
#' \item {\bold{ titleId }} {`string` \cr The Id for title container}
#' \item {\bold{ titleProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr The props for title container.}
#' \item {\bold{ topButtonsProps }} {`IButtonProps[]` \cr Other top buttons that will show up next to the close button}
#' \item {\bold{ type }} {`DialogType` \cr The type of Dialog to display.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDialogFooter>` \cr Gets the component ref.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDialogFooterStyleProps, IDialogFooterStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ ariaDescribedById }} {`string` \cr Optional id for aria-DescribedBy}
#' \item {\bold{ ariaLabelledById }} {`string` \cr Optional id for aria-LabelledBy}
#' \item {\bold{ className }} {`string` \cr Optional class name to be added to the root class}
#' \item {\bold{ componentRef }} {`IRefObject<IDialog>` \cr Optional callback to access the IDialog interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ containerClassName }} {`string` \cr Optional override for container class}
#' \item {\bold{ contentClassName }} {`string` \cr Optional override content class}
#' \item {\bold{ dialogContentProps }} {`IDialogContentProps` \cr Props to be passed through to Dialog Content}
#' \item {\bold{ hidden }} {`boolean` \cr Whether the dialog is hidden.}
#' \item {\bold{ isBlocking }} {`boolean` \cr Whether the dialog can be light dismissed by clicking outside the dialog (on the overlay).}
#' \item {\bold{ isDarkOverlay }} {`boolean` \cr Whether the overlay is dark themed.}
#' \item {\bold{ isOpen }} {`boolean` \cr Whether the dialog is displayed. Deprecated, use `hidden` instead.}
#' \item {\bold{ maxWidth }} {`ICSSRule | ICSSPixelUnitRule` \cr Sets the maximum width for the dialog. It limits the width property to be larger than the value specified in max-width.}
#' \item {\bold{ minWidth }} {`ICSSRule | ICSSPixelUnitRule` \cr Sets the minimum width of the dialog. It limits the width property to be not smaller than the value specified in min-width.}
#' \item {\bold{ modalProps }} {`IModalProps` \cr Props to be passed through to Modal}
#' \item {\bold{ onDismiss }} {`(ev?: React.MouseEvent<HTMLButtonElement>) => any` \cr A callback function for when the Dialog is dismissed from the close button or light dismiss. Can also be specified separately in content and modal.}
#' \item {\bold{ onDismissed }} {`() => any` \cr A callback function which is called after the Dialog is dismissed and the animation is complete.}
#' \item {\bold{ onLayerDidMount }} {`() => void` \cr A callback function for when the Dialog content is mounted on the overlay layer}
#' \item {\bold{ onLayerMounted }} {`() => void` \cr Deprecated at 0.81.2, use `onLayerDidMount` instead.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDialogStyleProps, IDialogStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ subText }} {`string` \cr The subtext to display in the dialog.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ title }} {`string | JSX.Element` \cr The title text to display at the top of the dialog.}
#' \item {\bold{ topButtonsProps }} {`IButtonProps[]` \cr Other top buttons that will show up next to the close button}
#' \item {\bold{ type }} {`DialogType` \cr The type of Dialog to display.}
#' }
#'
#' @md
#' @name Dialog
NULL

#' DocumentCard
#'
#' @description
#' A document card (`DocumentCard`) represents a file, and contains additional metadata or actions. This offers people a richer view into a file than the typical grid view.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/DocumentCard).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use this control to represent Office documents or other files in aggregate views, such as when you're showing someone’s most trending document.
#' - Incorporate metadata that is relevant and useful in this particular view. A card can be specialized to be about the document’s latest changes, or about the document’s popularity, as you see fit.
#' - Use a document card when you're illustrating an event that encompasses multiple files. For example, a card can be configured to represent a single upload action when adding more than one file.
#' - Don’t use a document card in views where someone is likely to be performing bulk operations in files, or when the list may get very long. Specifically, if you’re showing all the items inside an actual folder, a card may be overkill because the majority of the items in the folder may not have interesting metadata.
#' - Don’t use a document card if space is at a premium or you can’t show relevant and timely commands or metadata. Cards are useful because they can expose on-item interactions like “Share” buttons or view counts. If your app does not need this, show a simple grid or list of items instead, which are easier to scan.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ actions }} {`IButtonProps[]` \cr The actions available for this document.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardActions>` \cr Gets the component ref.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardActionsStyleProps, IDocumentCardActionsStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ views }} {`Number` \cr The number of views this document has received.}
#' \item {\bold{ activity }} {`string` \cr Describes the activity that has taken place, such as "Created Feb 23, 2016".}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardActivity>` \cr Gets the component ref.}
#' \item {\bold{ people }} {`IDocumentCardActivityPerson[]` \cr One or more people who are involved in this activity.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardActivityStyleProps, IDocumentCardActivityStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardDetails>` \cr Gets the component ref.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardDetailsStyleProps, IDocumentCardDetailsStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardImage>` \cr Gets the component ref.}
#' \item {\bold{ height }} {`number` \cr If provided, forces the preview image to be this height.}
#' \item {\bold{ iconProps }} {`IIconProps` \cr The props for the icon associated with this document type.}
#' \item {\bold{ imageFit }} {`ImageFit` \cr Used to determine how to size the image to fit the dimensions of the component. If both dimensions are provided, then the image is fit using ImageFit.scale, otherwise ImageFit.none is used.}
#' \item {\bold{ imageSrc }} {`string` \cr Path to the preview image.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardImageStyleProps, IDocumentCardImageStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ width }} {`number` \cr If provided, forces the preview image to be this width.}
#' \item {\bold{ ariaLabel }} {`string` \cr Aria label for the link to the document location.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardLocation>` \cr Gets the component ref.}
#' \item {\bold{ location }} {`string` \cr Text for the location of the document.}
#' \item {\bold{ locationHref }} {`string` \cr URL to navigate to for this location.}
#' \item {\bold{ onClick }} {`(ev?: React.MouseEvent<HTMLElement>) => void` \cr Function to call when the location is clicked.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardLocationStyleProps, IDocumentCardLocationStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardLogo>` \cr Gets the component ref.}
#' \item {\bold{ logoIcon }} {`string` \cr Describes DocumentCard Logo badge.}
#' \item {\bold{ logoName }} {`string` \cr Describe Logo name, optional.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardLogoStyleProps, IDocumentCardLogoStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardPreview>` \cr Gets the component ref.}
#' \item {\bold{ getOverflowDocumentCountText }} {`(overflowCount: number) => string` \cr The function return string that will describe the number of overflow documents. such as (overflowCount: number) =\> `+${ overflowCount } more`,}
#' \item {\bold{ previewImages }} {`IDocumentCardPreviewImage[]` \cr One or more preview images to display.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardPreviewStyleProps, IDocumentCardPreviewStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ accentColor }} {`string` \cr Hex color value of the line below the card, which should correspond to the document type. This should only be supplied when using the 'compact' card layout.
#'
#' Deprecated at v4.17.1, to be removed at \>= v5.0.0.}
#' \item {\bold{ children }} {`React.ReactNode` \cr Child components to render within the card.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCard>` \cr Optional callback to access the IDocumentCard interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ onClick }} {`(ev?: React.SyntheticEvent<HTMLElement>) => void` \cr Function to call when the card is clicked or keyboard Enter/Space is pushed.}
#' \item {\bold{ onClickHref }} {`string` \cr A URL to navigate to when the card is clicked. If a function has also been provided, it will be used instead of the URL.}
#' \item {\bold{ onClickTarget }} {`string` \cr A target browser context for opening the link. If not specified, will open in the same tab/window.}
#' \item {\bold{ role }} {`string` \cr Aria role assigned to the documentCard (Eg. button, link). Use this to override the default assignment.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardStyleProps, IDocumentCardStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ type }} {`DocumentCardType` \cr The type of DocumentCard to display.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardStatus>` \cr Gets the component ref.}
#' \item {\bold{ status }} {`string` \cr Describe status information. Required field.}
#' \item {\bold{ statusIcon }} {`string` \cr Describes DocumentCard status icon.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardStatusStyleProps, IDocumentCardStatusStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ className }} {`string` \cr Optional override class name}
#' \item {\bold{ componentRef }} {`IRefObject<IDocumentCardTitle>` \cr Gets the component ref.}
#' \item {\bold{ shouldTruncate }} {`boolean` \cr Whether we truncate the title to fit within the box. May have a performance impact.}
#' \item {\bold{ showAsSecondaryTitle }} {`boolean` \cr Whether show as title as secondary title style such as smaller font and lighter color.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDocumentCardTitleStyleProps, IDocumentCardTitleStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ title }} {`string` \cr Title text. If the card represents more than one document, this should be the title of one document and a "+X" string. For example, a collection of four documents would have a string of "Document.docx +3".}
#' }
#'
#' @md
#' @name DocumentCard
NULL

#' Dropdown
#'
#' @description
#' A dropdown menu is a list in which the selected item is always visible while other items are visible on demand by clicking a dropdown button.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Dropdown).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a dropdown list when there are multiple choices that can be collapsed under one title, if the list of items is too long, or when space is constrained.
#' - Use a dropdown list when the selected option is more important than the alternatives (in contrast to radio buttons where all the choices are visible, putting equal emphasis on all options).
#'
#' ### Content
#'
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#' - The dropdown list label should describe what can be found in the menu.
#' - Use shortened statements or single words as list options.
#' - If there isn't a default option, use "Select an option" as placeholder text.
#' - If "None" is an option, include it.
#' - Write the choices using parallel construction. For example, start with the same part of speech or verb tense.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ defaultSelectedKeys }} {`string[] | number[]` \cr Keys that will be initially used to set selected items. This prop is only used when `multiSelect` is true (use `defaultSelectedKey` for single select). Mutually exclusive with `selectedKeys`.}
#' \item {\bold{ dropdownWidth }} {`number` \cr Custom width for dropdown. If value is 0, width of the input field is used.}
#' \item {\bold{ isDisabled }} {`boolean` \cr Deprecated at v0.52.0, use `disabled` instead.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this dropdown}
#' \item {\bold{ multiSelectDelimiter }} {`string` \cr When multiple items are selected, this will be used to separate values in the dropdown input.}
#' \item {\bold{ notifyOnReselect }} {`boolean` \cr If true, `onChange` will still be called when an already-selected item is clicked again in single select mode. (Normally it would not be called in this case.)}
#' \item {\bold{ onChange }} {`(event: React.FormEvent<HTMLDivElement>, option?: IDropdownOption, index?: number) => void` \cr Callback for when the selected option changes.}
#' \item {\bold{ onChanged }} {`(option: IDropdownOption, index?: number) => void` \cr }
#' \item {\bold{ onRenderCaretDown }} {`IRenderFunction<IDropdownProps>` \cr Custom renderer for chevron icon}
#' \item {\bold{ onRenderLabel }} {`IRenderFunction<IDropdownProps>` \cr Custom renderer for the label.}
#' \item {\bold{ onRenderPlaceholder }} {`IRenderFunction<IDropdownProps>` \cr Custom renderer for placeholder text}
#' \item {\bold{ onRenderPlaceHolder }} {`IRenderFunction<IDropdownProps>` \cr Custom renderer for placeholder text}
#' \item {\bold{ onRenderTitle }} {`IRenderFunction<IDropdownOption[]>` \cr Custom renderer for selected option displayed in input}
#' \item {\bold{ options }} {`IDropdownOption[]` \cr Options for the dropdown. If using `defaultSelectedKey` or `defaultSelectedKeys`, options must be pure for correct behavior.}
#' \item {\bold{ placeHolder }} {`string` \cr Input placeholder text. Displayed until an option is selected.}
#' \item {\bold{ responsiveMode }} {`ResponsiveMode` \cr By default, the dropdown will render the standard way for screen sizes `large` and above, or in a panel on `small` and `medium` screens. Manually set this prop to override this behavior.}
#' \item {\bold{ selectedKeys }} {`string[] | number[] | null` \cr Keys of the selected items, only used when `multiSelect` is true (use `selectedKey` for single select). If you provide this, you must maintain selection state by observing onChange events and passing a new prop value in when changed. Passing null will clear the selection. Mutually exclusive with `defaultSelectedKeys`.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IDropdownStyleProps, IDropdownStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher order component.}
#' }
#'
#' @md
#' @name Dropdown
NULL

#' Facepile
#'
#' @description
#' A face pile (`Facepile`) displays a list of personas. Each circle represents a person and contains their image or initials. Often this control is used when sharing who has access to a specific view or file, or when assigning someone a task within a workflow.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Facepile).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - The face pile empty state should only include an "Add" button. Another variant is to use an input field with placeholder text instructing people to add a person. See the people picker component for the menu used to add people to the face pile list.
#' - When there is only one person in the face pile, consider using their name next to the face or initials.
#' - When there is a need to show the face pile expanded into a vertical list, include a downward chevron button. Selecting the chevron opens a standard list view of people.
#' - When the face pile exceeds a max number of 5 people, show a button at the end of the list indicating how many are not being shown. Clicking or tapping on the overflow would open a standard list view of people.
#' - The component can include an "Add" button which can be used for quickly adding a person to the list.
#' - When hovering over a person in the face pile, include a tooltip or people card that offers more information about that person.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ addButtonProps }} {`IButtonProps` \cr Button properties for the add face button}
#' \item {\bold{ ariaDescription }} {`string` \cr ARIA label for persona list}
#' \item {\bold{ ariaLabel }} {`string` \cr Defines the aria label that the screen readers use when focus goes on a list of personas.}
#' \item {\bold{ chevronButtonProps }} {`IButtonProps` \cr Deprecated at v0.70, use `overflowButtonProps` instead.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Facepile}
#' \item {\bold{ componentRef }} {`IRefObject<IFacepile>` \cr Optional callback to access the IFacepile interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ getPersonaProps }} {`(persona: IFacepilePersona) => IPersonaSharedProps` \cr Method to access properties on the underlying Persona control}
#' \item {\bold{ maxDisplayablePersonas }} {`number` \cr Maximum number of personas to show}
#' \item {\bold{ onRenderPersona }} {`IRenderFunction<IFacepilePersona>` \cr Optional custom renderer for the persona, gets called when there is one persona in personas array}
#' \item {\bold{ onRenderPersonaCoin }} {`IRenderFunction<IFacepilePersona>` \cr Optional custom renderer for the persona coins, gets called when there are multiple persona in personas array}
#' \item {\bold{ overflowButtonProps }} {`IButtonProps` \cr Properties for the overflow icon}
#' \item {\bold{ overflowButtonType }} {`OverflowButtonType` \cr Type of overflow icon to use}
#' \item {\bold{ overflowPersonas }} {`IFacepilePersona[]` \cr Personas to place in the overflow}
#' \item {\bold{ personas }} {`IFacepilePersona[]` \cr Array of IPersonaProps that define each Persona.}
#' \item {\bold{ personaSize }} {`PersonaSize` \cr Size to display the personas}
#' \item {\bold{ showAddButton }} {`boolean` \cr Show add person button}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IFacepileStyleProps, IFacepileStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' }
#'
#' @md
#' @name Facepile
NULL

#' FocusTrapZone
#'
#' @description
#' FocusTrapZone is used to trap the focus in any html element. Pressing tab will circle focus within the inner focusable elements of the FocusTrapZone.
#'
#' **Note:** Trapping focus will restrict interaction with other elements in the website such as the side nav. Turn off the "Use trap zone" toggle control to allow this interaction to happen again.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/FocusTrapZone).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Sets the aria-labelledby attribute.}
#' \item {\bold{ componentRef }} {`IRefObject<IFocusTrapZone>` \cr Optional callback to access the IFocusTrapZone interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ disabled }} {`boolean` \cr Whether to disable the FocusTrapZone's focus trapping behavior.}
#' \item {\bold{ disableFirstFocus }} {`boolean` \cr Do not put focus onto the first element inside the focus trap zone.}
#' \item {\bold{ elementToFocusOnDismiss }} {`HTMLElement` \cr Sets the element to focus on when exiting the FocusTrapZone.}
#' \item {\bold{ enableAriaHiddenSiblings }} {`boolean` \cr Puts aria-hidden=true on all non-ancestors of the current element, for screen readers. This is an experimental feature that will be graduated to default behavior after testing. This flag will be removed with the next major release.}
#' \item {\bold{ firstFocusableSelector }} {`string | (() => string)` \cr Class name (not actual selector) for first focusable item. Do not append a dot. Only applies if `focusPreviouslyFocusedInnerElement` is false.}
#' \item {\bold{ focusPreviouslyFocusedInnerElement }} {`boolean` \cr Specifies which descendant element to focus when `focus()` is called. If false, use the first focusable descendant, filtered by the `firstFocusableSelector` property if present. If true, use the element that was focused when the trap zone last had a focused descendant (or fall back to the first focusable descendant if the trap zone has never been focused).}
#' \item {\bold{ forceFocusInsideTrap }} {`boolean` \cr Whether the focus trap zone should force focus to stay inside of it.}
#' \item {\bold{ ignoreExternalFocusing }} {`boolean` \cr If false (the default), the trap zone will restore focus to the element which activated it once the trap zone is unmounted or disabled. Set to true to disable this behavior.}
#' \item {\bold{ isClickableOutsideFocusTrap }} {`boolean` \cr Whether clicks are allowed outside this FocusTrapZone.}
#' }
#'
#' @md
#' @name FocusTrapZone
NULL

#' FocusZone
#'
#' @description
#' FocusZones abstract arrow key navigation behaviors. Tabbable elements (buttons, anchors, and elements with data-is-focusable='true' attributes) are considered when pressing directional arrow keys and focus is moved appropriately. Tabbing to a zone sets focus only to the current "active" element, making it simple to use the tab key to transition from one zone to the next, rather than through every focusable element.
#'
#' Using a FocusZone is simple. Just wrap a bunch of content inside of a FocusZone, and arrows and tabbling will be handled for you! See examples below.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/FocusZone).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowFocusRoot }} {`boolean` \cr Allows focus to park on root when focus is in the `FocusZone` at render time.}
#' \item {\bold{ allowTabKey }} {`boolean` \cr Allows tab key to be handled to tab through a list of items in the focus zone, an unfortunate side effect is that users will not be able to tab out of the focus zone and have to hit escape or some other key.}
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Sets the aria-describedby attribute.}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Sets the aria-labelledby attribute.}
#' \item {\bold{ as }} {`React.ElementType` \cr A component that should be used as the root element of the FocusZone component.}
#' \item {\bold{ checkForNoWrap }} {`boolean` \cr Determines whether to check for data-no-horizontal-wrap or data-no-vertical-wrap attributes when determining how to move focus}
#' \item {\bold{ className }} {`string` \cr Additional class name to provide on the root element, in addition to the ms-FocusZone class.}
#' \item {\bold{ componentRef }} {`IRefObject<IFocusZone>` \cr Optional callback to access the IFocusZone interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultActiveElement }} {`string` \cr Optionally provide a selector for identifying the initial active element.}
#' \item {\bold{ defaultTabbableElement }} {`string | ((root: HTMLElement) => HTMLElement)` \cr Optionally defines the initial tabbable element inside the FocusZone. If a string is passed then it is treated as a selector for identifying the initial tabbable element. If a function is passed then it uses the root element as a parameter to return the initial tabbable element.}
#' \item {\bold{ direction }} {`FocusZoneDirection` \cr Defines which arrows to react to.}
#' \item {\bold{ disabled }} {`boolean` \cr If set, the FocusZone will not be tabbable and keyboard navigation will be disabled. This does not affect disabled attribute of any child.}
#' \item {\bold{ doNotAllowFocusEventToPropagate }} {`boolean` \cr Whether the FocusZone should allow focus events to propagate past the FocusZone.}
#' \item {\bold{ elementType }} {`any` \cr Element type the root element will use. Default is "div".}
#' \item {\bold{ handleTabKey }} {`FocusZoneTabbableElements` \cr Allows tab key to be handled to tab through a list of items in the focus zone, an unfortunate side effect is that users will not be able to tab out of the focus zone and have to hit escape or some other key.}
#' \item {\bold{ isCircularNavigation }} {`boolean` \cr If set, will cycle to the beginning of the targets once the user navigates to the next target while at the end, and to the end when navigate to the previous at the beginning.}
#' \item {\bold{ isInnerZoneKeystroke }} {`(ev: React.KeyboardEvent<HTMLElement>) => boolean` \cr If provided, this callback will be executed on keypresses to determine if the user intends to navigate into the inner zone. Returning true will ask the first inner zone to set focus.}
#' \item {\bold{ onActiveElementChanged }} {`(element?: HTMLElement, ev?: React.FocusEvent<HTMLElement>) => void` \cr Callback for when one of immediate children elements gets active by getting focused or by having one of its respective children elements focused.}
#' \item {\bold{ onBeforeFocus }} {`(childElement?: HTMLElement) => boolean` \cr Callback method for determining if focus should indeed be set on the given element.}
#' \item {\bold{ onFocus }} {`(event: React.FocusEvent<HTMLElement | FocusZone>) => void` \cr Callback called when "focus" event triggered in FocusZone.}
#' \item {\bold{ onFocusNotification }} {`() => void` \cr Callback to notify creators that focus has been set on the FocusZone}
#' \item {\bold{ pagingSupportDisabled }} {`boolean` \cr Determines whether to disable the paging support for Page Up and Page Down keyboard scenarios.}
#' \item {\bold{ preventDefaultWhenHandled }} {`boolean` \cr If true, FocusZone prevents the default behavior of Keyboard events when changing focus between elements.}
#' \item {\bold{ preventFocusRestoration }} {`boolean` \cr If true, prevents the FocusZone from attempting to restore the focus to the inner element when the focus is on the root element after componentDidUpdate.}
#' \item {\bold{ rootProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr Deprecated at v1.12.1. DIV props provided to the FocusZone will be mixed into the root element.}
#' \item {\bold{ shouldEnterInnerZone }} {`(ev: React.KeyboardEvent<HTMLElement>) => boolean` \cr Callback function that will be executed on keypresses to determine if the user intends to navigate into the inner (nested) zone. Returning true will ask the first inner zone to set focus.}
#' \item {\bold{ shouldFocusInnerElementWhenReceivedFocus }} {`boolean` \cr If true and FocusZone's root element (container) receives focus, the focus will land either on the defaultTabbableElement (if set) or on the first tabbable element of this FocusZone. Usually a case for nested focus zones, when the nested focus zone's container is a focusable element.}
#' \item {\bold{ shouldFocusOnMount }} {`boolean` \cr Determines if a default tabbable element should be force focused on FocusZone mount.  @default false}
#' \item {\bold{ shouldInputLoseFocusOnArrowKey }} {`(inputElement: HTMLInputElement) => boolean` \cr A callback method to determine if the input element should lose focus on arrow keys}
#' \item {\bold{ shouldRaiseClicks }} {`boolean` \cr Determines whether the FocusZone will walk up the DOM trying to invoke click callbacks on focusable elements on Enter and Space keydowns to ensure accessibility for tags that don't guarantee this behavior.}
#' \item {\bold{ shouldReceiveFocus }} {`(childElement?: HTMLElement) => boolean` \cr Callback method for determining if focus should indeed be set on the given element.}
#' \item {\bold{ shouldResetActiveElementWhenTabFromZone }} {`boolean` \cr If true and TAB key is not handled by FocusZone, resets current active element to null value. For example, when roving index is not desirable and focus should always reset to the default tabbable element.}
#' \item {\bold{ stopFocusPropagation }} {`boolean` \cr Whether the FocusZone should allow focus events to propagate past the FocusZone.}
#' }
#'
#' @md
#' @name FocusZone
NULL

#' GroupedList
#'
#' @description
#' A grouped list (`GroupedList`) allows you to render a set of items as multiple lists with various grouping properties.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/GroupedList).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ## FAQ
#'
#' ### My List is not re-rendering when I mutate its items. What should I do?
#'
#' To determine if the list within the grouped list should re-render its contents, the component performs a referential equality check within its `shouldComponentUpdate` method.
#' This is done to minimize the performance overhead associating with re-rendering the virtualized List pages, as recommended by the [React documentation](https://reactjs.org/docs/optimizing-performance.html#the-power-of-not-mutating-data).
#'
#' As a result of this implementation, the inner list will not determine it should re-render if the array values are mutated.
#' To avoid this problem, we recommend re-creating the items array backing the grouped list by using a method such as `Array.prototype.concat` or ES6 spread syntax shown below:
#'
#' ```tsx
#' public appendItems(): void {
#'   const { items } = this.state;
#'
#'   this.setState({
#'     items: [...items, ...['Foo', 'Bar']]
#'   })
#' }
#'
#' public render(): JSX.Element {
#'   const { items } = this.state;
#'
#'   return <GroupedList items={items} />;
#' }
#' ```
#'
#' By re-creating the items array without mutating the values, the inner List will correctly determine its contents have changed and then it should re-render with the new values.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Custom className}
#' \item {\bold{ compact }} {`boolean` \cr Boolean value to indicate if the component should render in compact mode. Set to false by default}
#' \item {\bold{ componentRef }} {`IRefObject<{}>` \cr }
#' \item {\bold{ expandButtonProps }} {`React.HTMLAttributes<HTMLButtonElement>` \cr Props for expand/collapse button}
#' \item {\bold{ footerText }} {`string` \cr Text to display for the group footer.}
#' \item {\bold{ group }} {`IGroup` \cr The group to be rendered by the header.}
#' \item {\bold{ groupIndex }} {`number` \cr The index of the group.}
#' \item {\bold{ groupLevel }} {`number` \cr The indent level of the group.}
#' \item {\bold{ groups }} {`IGroup[]` \cr Stores parent group's children.}
#' \item {\bold{ indentWidth }} {`number` \cr Width corresponding to a single level. This is multiplied by the groupLevel to get the full spacer width for the group.}
#' \item {\bold{ isCollapsedGroupSelectVisible }} {`boolean` \cr Determines if the group selection check box is shown for collapsed groups.}
#' \item {\bold{ isGroupLoading }} {`(group: IGroup) => boolean` \cr Callback to determine if a group has missing items and needs to load them from the server.}
#' \item {\bold{ isSelected }} {`boolean` \cr Deprecated at v.65.1 and will be removed by v 1.0. Use `selected` instead.}
#' \item {\bold{ loadingText }} {`string` \cr Text shown on group headers to indicate the group is being loaded.}
#' \item {\bold{ onGroupHeaderClick }} {`(group: IGroup) => void` \cr Callback for when the group header is clicked.}
#' \item {\bold{ onRenderTitle }} {`IRenderFunction<IGroupHeaderProps>` \cr Override which allows the caller to provider a custom renderer for the GroupHeader title.}
#' \item {\bold{ onToggleCollapse }} {`(group: IGroup) => void` \cr Callback for when the group is expanded or collapsed.}
#' \item {\bold{ onToggleSelectGroup }} {`(group: IGroup) => void` \cr Callback for when the group is selected.}
#' \item {\bold{ onToggleSummarize }} {`(group: IGroup) => void` \cr Callback for when the group "Show All" link is clicked}
#' \item {\bold{ selected }} {`boolean` \cr If all items in the group are selected.}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr The selection mode of the list the group lives within.}
#' \item {\bold{ showAllLinkText }} {`string` \cr Text to display for the group "Show All" link.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by the Higher Order Component}
#' \item {\bold{ viewport }} {`IViewport` \cr A reference to the viewport in which the header is rendered.}
#' \item {\bold{ className }} {`string` \cr Optional class name to add to the root element.}
#' \item {\bold{ compact }} {`boolean` \cr Boolean value to indicate if the component should render in compact mode. Set to false by default}
#' \item {\bold{ componentRef }} {`IRefObject<IGroupedList>` \cr Optional callback to access the IGroupedList interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dragDropEvents }} {`IDragDropEvents` \cr Map of callback functions related to drag and drop functionality.}
#' \item {\bold{ dragDropHelper }} {`IDragDropHelper` \cr helper to manage drag/drop across item and groups}
#' \item {\bold{ eventsToRegister }} {`{ eventName: string; callback: (context: IDragDropContext, event?: any) => void; }[]` \cr Event names and corresponding callbacks that will be registered to groups and rendered elements}
#' \item {\bold{ focusZoneProps }} {`IFocusZoneProps` \cr Optional properties to pass through to the FocusZone.}
#' \item {\bold{ getGroupHeight }} {`(group: IGroup, groupIndex: number) => number` \cr Optional function to override default group height calculation used by list virtualization.}
#' \item {\bold{ groupProps }} {`IGroupRenderProps` \cr Optional override properties to render groups.}
#' \item {\bold{ groups }} {`IGroup[]` \cr Optional grouping instructions.}
#' \item {\bold{ items }} {`any[]` \cr List of items to render.}
#' \item {\bold{ listProps }} {`IListProps` \cr Optional properties to pass through to the list components being rendered.}
#' \item {\bold{ onGroupExpandStateChanged }} {`(isSomeGroupExpanded: boolean) => void` \cr Optional callback when the group expand state changes between all collapsed and at least one group is expanded.}
#' \item {\bold{ onRenderCell }} {`(nestingDepth?: number, item?: any, index?: number) => React.ReactNode` \cr Rendering callback to render the group items.}
#' \item {\bold{ onShouldVirtualize }} {`(props: IListProps) => boolean` \cr Optional callback to determine whether the list should be rendered in full, or virtualized. Virtualization will add and remove pages of items as the user scrolls them into the visible range. This benefits larger list scenarios by reducing the DOM on the screen, but can negatively affect performance for smaller lists. The default implementation will virtualize when this callback is not provided.}
#' \item {\bold{ selection }} {`ISelection` \cr Optional selection model to track selection state.}
#' \item {\bold{ selectionMode }} {`SelectionMode` \cr Controls how/if the list manages selection.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IGroupedListStyleProps, IGroupedListStyles>` \cr Style function to be passed in to override the themed or default styles}
#' \item {\bold{ theme }} {`ITheme` \cr Theme that is passed in from Higher Order Component}
#' \item {\bold{ usePageCache }} {`boolean` \cr boolean to control if pages containing unchanged items should be cached, this is a perf optimization The same property in List.Props}
#' \item {\bold{ viewport }} {`IViewport` \cr Optional Viewport, provided by the parent component.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IGroupFooterStyleProps, IGroupFooterStyles>` \cr Style function to be passed in to override the themed or default styles}
#' \item {\bold{ checked }} {`boolean` \cr }
#' \item {\bold{ theme }} {`ITheme` \cr }
#' \item {\bold{ ariaPosInSet }} {`number` \cr Defines an element's number or position in the current set of listitems or treeitems}
#' \item {\bold{ ariaSetSize }} {`number` \cr Defines the number of items in the current set of listitems or treeitems}
#' \item {\bold{ expandButtonIcon }} {`string` \cr Defines the name of a custom icon to be used for group headers. If not set, the default icon will be used}
#' \item {\bold{ expandButtonProps }} {`React.HTMLAttributes<HTMLButtonElement>` \cr Native props for the GroupHeader expand and collapse button}
#' \item {\bold{ groupedListId }} {`string` \cr GroupedList id for aria-controls}
#' \item {\bold{ onRenderGroupHeaderCheckbox }} {`IRenderFunction<IGroupHeaderCheckboxProps>` \cr If provided, can be used to render a custom checkbox}
#' \item {\bold{ selectAllButtonProps }} {`React.HTMLAttributes<HTMLButtonElement>` \cr Native props for the GroupHeader select all button}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IGroupHeaderStyleProps, IGroupHeaderStyles>` \cr Style function to be passed in to override the themed or default styles}
#' \item {\bold{ useFastIcons }} {`boolean` \cr Whether to use fast icon and check components. The icons can't be targeted by customization but are still customizable via class names.}
#' \item {\bold{ collapseAllVisibility }} {`CollapseAllVisibility` \cr Flag to indicate whether to ignore the collapsing icon on header.}
#' \item {\bold{ footerProps }} {`IGroupFooterProps` \cr Information to pass in to the group footer.}
#' \item {\bold{ getGroupItemLimit }} {`(group: IGroup) => number` \cr Grouping item limit.}
#' \item {\bold{ headerProps }} {`IGroupHeaderProps` \cr Information to pass in to the group header.}
#' \item {\bold{ isAllGroupsCollapsed }} {`boolean` \cr Boolean indicating if all groups are in collapsed state.}
#' \item {\bold{ onRenderFooter }} {`IRenderFunction<IGroupFooterProps>` \cr Override which allows the caller to provide a custom footer.}
#' \item {\bold{ onRenderHeader }} {`IRenderFunction<IGroupHeaderProps>` \cr Override which allows the caller to provide a custom header.}
#' \item {\bold{ onRenderShowAll }} {`IRenderFunction<IGroupShowAllProps>` \cr Override which allows the caller to provide a custom Show All link.}
#' \item {\bold{ onToggleCollapseAll }} {`(isAllCollapsed: boolean) => void` \cr Callback for when all groups are expanded or collapsed.}
#' \item {\bold{ role }} {`string` \cr Override which allows the caller to provide a custom aria role}
#' \item {\bold{ showAllProps }} {`IGroupShowAllProps` \cr Information to pass in to the group Show all footer.}
#' \item {\bold{ showEmptyGroups }} {`boolean` \cr Boolean indicating if empty groups are shown}
#' \item {\bold{ showAllLinkText }} {`string` \cr The Show All link text.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IGroupShowAllStyleProps, IGroupShowAllStyles>` \cr Style function to be passed in to override the themed or default styles}
#' \item {\bold{ count }} {`number` \cr Count of spacer(s)}
#' \item {\bold{ indentWidth }} {`number` \cr How much to indent}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IGroupSpacerStyleProps, IGroupSpacerStyles>` \cr Style function to be passed in to override the themed or default styles}
#' \item {\bold{ theme }} {`ITheme` \cr Theme from Higher Order Component}
#' }
#'
#' @md
#' @name GroupedList
NULL

#' HoverCard
#'
#' @description
#' Hover cards (`HoverCard`) show commands and information, such as metadata and activity, when someone hovers over an item.
#'
#' - Tabbing with a keyboard to the element triggering the HoverCard to open on focus (see first example). In this case no further navigation within the card is available and navigating to the next element will close the card.
#' - Tabbing with a keyboard to the element triggering the HoverCard and opening when the hotKey is pressed (see second example). When the card is opened it will automatically focus the first focusable element of the card content.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/HoverCard).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Hover cards contain both compact and expanded states, with the compact state appearing after 500 milliseconds and the expanded state appearing as the user continues to hover after 1500 milliseconds.
#' - The hover card positions itself automatically, depending upon where the target is on the viewport. Position the target so the card doesn’t obstruct inline commanding on the item.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ compactCardHeight }} {`number` \cr Height of compact card}
#' \item {\bold{ expandedCardHeight }} {`number` \cr Height of expanded card}
#' \item {\bold{ mode }} {`ExpandingCardMode` \cr Use to open the card in expanded format and not wait for the delay}
#' \item {\bold{ onRenderCompactCard }} {`IRenderFunction<any>` \cr Render function to populate compact content area}
#' \item {\bold{ onRenderExpandedCard }} {`IRenderFunction<any>` \cr Render function to populate expanded content area}
#' \item {\bold{ cardDismissDelay }} {`number` \cr Length of card dismiss delay. A min number is necessary for pointer to hop between target and card}
#' \item {\bold{ cardOpenDelay }} {`number` \cr Length of compact card delay}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the HoverCard root element.}
#' \item {\bold{ componentRef }} {`IRefObject<IHoverCard>` \cr Optional callback to access the IHoverCardHost interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ eventListenerTarget }} {`HTMLElement | string | null` \cr This prop is to separate the target to anchor hover card from the target to attach event listener. If set, this prop separates the target to anchor the hover card from the target to attach the event listener. When no `eventListenerTarget` given, HoverCard will use `target` prop or its root to set event listener.}
#' \item {\bold{ expandedCardOpenDelay }} {`number` \cr Time in ms when expanded card should open after compact card}
#' \item {\bold{ expandingCardProps }} {`IExpandingCardProps` \cr Additional ExpandingCard props to pass through HoverCard like renderers, target. gapSpace etc. Used along with 'type' prop set to HoverCardType.expanding. Reference detail properties in ICardProps and IExpandingCardProps.}
#' \item {\bold{ instantOpenOnClick }} {`boolean` \cr Enables instant open of the full card upon click}
#' \item {\bold{ onCardExpand }} {`() => void` \cr Callback when visible card is expanded.}
#' \item {\bold{ onCardHide }} {`() => void` \cr Callback when card hides}
#' \item {\bold{ onCardVisible }} {`() => void` \cr Callback when card becomes visible}
#' \item {\bold{ openHotKey }} {`KeyCodes` \cr HotKey used for opening the HoverCard when tabbed to target.}
#' \item {\bold{ plainCardProps }} {`IPlainCardProps` \cr Additional PlainCard props to pass through HoverCard like renderers, target, gapSpace etc. Used along with 'type' prop set to HoverCardType.plain. See for more details ICardProps and IPlainCardProps interfaces.}
#' \item {\bold{ setAriaDescribedBy }} {`boolean` \cr Whether or not to mark the container as described by the hover card. If not specified, the caller should mark as element as described by the hover card id.}
#' \item {\bold{ setInitialFocus }} {`boolean` \cr Set to true to set focus on the first focusable element in the card. Works in pair with the 'trapFocus' prop.}
#' \item {\bold{ shouldBlockHoverCard }} {`() => void` \cr Should block hover card or not}
#' \item {\bold{ sticky }} {`boolean` \cr If true disables Card dismiss upon mouse leave, so that card sticks around.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IHoverCardStyleProps, IHoverCardStyles>` \cr Custom styles for this component}
#' \item {\bold{ target }} {`HTMLElement | string | null` \cr Optional target element to tag hover card on. If not provided and using HoverCard as a wrapper, don't set the 'data-is-focusable=true' attribute to the root of the wrapped child. If no target is given, HoverCard will use its root as a target and become the focusable element with a focus listener attached to it.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher order component.}
#' \item {\bold{ trapFocus }} {`boolean` \cr Set to true if you want to render the content of the HoverCard in a FocusTrapZone for accessibility reasons. Optionally 'setInitialFocus' prop can be set to true to move focus inside the FocusTrapZone.}
#' \item {\bold{ type }} {`HoverCardType` \cr Type of the hover card to render.}
#' \item {\bold{ onRenderPlainCard }} {`IRenderFunction<any>` \cr Render function to populate compact content area}
#' }
#'
#' @md
#' @name HoverCard
NULL

#' Icon
#'
#' @description
#' In a user interface, an icon is an image that represents an application, a capability, or some other concept or specific entity with meaning for the user. An icon is usually selectable but can also be a nonselectable image, such as a company's logo.
#'
#' For a list of icons, visit our [icon documentation](#/styles/web/icons).
#'
#' Note that icons are not bundled by default and typically must be loaded by calling `initializeIcons` from the `@uifabric/icons` package at the root of your application. See the [icon documentation](#/styles/web/icons#fabric-react) for more details.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Icon).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Custom class to style the icon.}
#' \item {\bold{ iconName }} {`string` \cr The name of the icon to use from the icon font. If string is empty, a placeholder icon will be rendered the same width as an icon.}
#' \item {\bold{ ariaLabel }} {`string` \cr The aria label of the icon for the benefit of screen readers.}
#' \item {\bold{ iconName }} {`string` \cr The name of the icon to use from the icon font. If string is empty, a placeholder icon will be rendered the same width as an icon.}
#' \item {\bold{ iconType }} {`IconType` \cr The type of icon to render (image or icon font).}
#' \item {\bold{ imageErrorAs }} {`React.ComponentType<IImageProps>` \cr If rendering an image icon, this component will be rendered in the event that loading the image fails.}
#' \item {\bold{ imageProps }} {`IImageProps` \cr If rendering an image icon, these props will be passed to the Image component.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IIconStyleProps, IIconStyles>` \cr Gets the styles for an Icon.}
#' \item {\bold{ theme }} {`ITheme` \cr }
#' \item {\bold{ className }} {`string` \cr Custom class to style the icon.}
#' \item {\bold{ imageProps }} {`IImageProps` \cr Props passed to the Image component.}
#' }
#'
#' @md
#' @name Icon
NULL

#' Image
#'
#' @description
#' An image is a graphic representation of something (e.g photo or illustration). The borders have been added to these examples in order to help visualize empty space in the image frame.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Image).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Component}
#' \item {\bold{ coverStyle }} {`ImageCoverStyle` \cr Specifies the cover style to be used for this image. If not specified, this will be dynamically calculated based on the aspect ratio for the image.}
#' \item {\bold{ errorSrc }} {`string` \cr Deprecated at v1.3.6, to replace the src in case of errors, use `onLoadingStateChange` instead and rerender the Image with a difference src.}
#' \item {\bold{ imageFit }} {`ImageFit` \cr Used to determine how the image is scaled and cropped to fit the frame.}
#' \item {\bold{ maximizeFrame }} {`boolean` \cr If true, the image frame will expand to fill its parent container.}
#' \item {\bold{ onLoadingStateChange }} {`(loadState: ImageLoadState) => void` \cr Optional callback method for when the image load state has changed. The 'loadState' parameter indicates the current state of the Image.}
#' \item {\bold{ shouldFadeIn }} {`boolean` \cr If true, fades the image in when loaded.}
#' \item {\bold{ shouldStartVisible }} {`boolean` \cr If true, the image starts as visible and is hidden on error. Otherwise, the image is hidden until it is successfully loaded. This disables shouldFadeIn.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IImageStyleProps, IImageStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Image
NULL

#' Keytips
#'
#' @description
#'
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Keytips).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ componentRef }} {`IRefObject<IKeytipLayer>` \cr Optional callback to access the KeytipLayer component. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ content }} {`string` \cr String to put inside the layer to be used for the aria-describedby for the component with the keytip Should be one of the starting sequences}
#' \item {\bold{ keytipExitSequences }} {`IKeytipTransitionKey[]` \cr List of key sequences that will exit keytips mode}
#' \item {\bold{ keytipReturnSequences }} {`IKeytipTransitionKey[]` \cr List of key sequences that execute the return functionality in keytips (going back to the previous level of keytips)}
#' \item {\bold{ keytipStartSequences }} {`IKeytipTransitionKey[]` \cr List of key sequences that will start keytips mode}
#' \item {\bold{ onEnterKeytipMode }} {`() => void` \cr Callback function triggered when keytip mode is entered}
#' \item {\bold{ onExitKeytipMode }} {`(ev?: React.KeyboardEvent<HTMLElement> | React.MouseEvent<HTMLElement>) => void` \cr Callback function triggered when keytip mode is exited. ev is the Mouse or Keyboard Event that triggered the exit, if any.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IKeytipLayerStyleProps, IKeytipLayerStyles>` \cr (Optional) Call to provide customized styling.}
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr ICalloutProps to pass to the callout element}
#' \item {\bold{ content }} {`string` \cr Content to put inside the keytip}
#' \item {\bold{ disabled }} {`boolean` \cr T/F if the corresponding control for this keytip is disabled}
#' \item {\bold{ hasDynamicChildren }} {`boolean` \cr Whether or not this keytip will have children keytips that are dynamically created (DOM is generated on keytip activation). Common cases are a Pivot or Modal.}
#' \item {\bold{ hasMenu }} {`boolean` \cr Whether or not this keytip belongs to a component that has a menu Keytip mode will stay on when a menu is opened, even if the items in that menu have no keytips}
#' \item {\bold{ keySequences }} {`string[]` \cr Array of KeySequences which is the full key sequence to trigger this keytip Should not include initial 'start' key sequence}
#' \item {\bold{ offset }} {`Point` \cr Offset x and y for the keytip, added from the top-left corner By default the keytip will be anchored to the bottom-center of the element}
#' \item {\bold{ onExecute }} {`(executeTarget: HTMLElement | null, target: HTMLElement | null) => void` \cr Function to call when this keytip is activated. 'executeTarget' is the DOM element marked with 'data-ktp-execute-target'. 'target' is the DOM element marked with 'data-ktp-target'.}
#' \item {\bold{ onReturn }} {`(executeTarget: HTMLElement | null, target: HTMLElement | null) => void` \cr Function to call when the keytip is the currentKeytip and a return sequence is pressed. 'executeTarget' is the DOM element marked with 'data-ktp-execute-target'. 'target' is the DOM element marked with 'data-ktp-target'.}
#' \item {\bold{ overflowSetSequence }} {`string[]` \cr Full KeySequence of the overflow set button, will be set automatically if this keytip is inside an overflow}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IKeytipStyleProps, IKeytipStyles>` \cr Optional styles for the component.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme for the component}
#' \item {\bold{ visible }} {`boolean` \cr T/F if the keytip is visible}
#' }
#'
#' @md
#' @name Keytips
NULL

#' Label
#'
#' @description
#' Labels give a name or title to a control or group of controls, including text fields, check boxes, combo boxes, radio buttons, and drop-down menus.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Label).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Labels should be close to the control they're paired with.
#'
#' ### Content
#'
#' - Labels should describe the purpose of the control.
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#' - Be short and concise.
#' - Use nouns or short noun phrases.
#' - Don't use labels as instructional text. For example, "Click to get started".
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ as }} {`IComponentAs<React.AllHTMLAttributes<HTMLElement>>` \cr Render the root element as another type.}
#' \item {\bold{ componentRef }} {`IRefObject<ILabel>` \cr Optional callback to access the ILabel interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ disabled }} {`boolean` \cr Renders the label as disabled.}
#' \item {\bold{ required }} {`boolean` \cr Whether the associated form field is required or not}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ILabelStyleProps, ILabelStyles>` \cr Styles for the label.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Label
NULL

#' Layer
#'
#' @description
#' A Layer is a technical component that does not have specific Design guidance.
#'
#' Layers are used to render content outside of a DOM tree, at the end of the document. This allows content to escape traditional boundaries caused by "overflow: hidden" css rules and keeps it on the top without using z-index rules. This is useful for example in ContextualMenu and Tooltip scenarios, where the content should always overlay everything else.
#'
#' There are some special considerations. Due to the nature of rendering content elsewhere asynchronously, React refs within content will not be resolvable synchronously at the time the Layer is mounted. Therefore, to use refs correctly, use functional refs `ref={ (el) => { this._root = el; }` rather than string refs `ref='root'`. Additionally measuring the physical Layer element will not include any of the children, since it won't render it. Events that propgate from within the content will not go through the Layer element as well.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Layer).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Layer}
#' \item {\bold{ componentRef }} {`IRefObject<ILayer>` \cr Optional callback to access the ILayer interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ eventBubblingEnabled }} {`boolean` \cr When enabled, Layer allows events to bubble up from Layer content. Traditionally Layer has not had this behavior. This prop preserves backwards compatibility by default while allowing users to opt in to the new event bubbling functionality.}
#' \item {\bold{ hostId }} {`string` \cr The optional id property provided on a LayerHost that this Layer should render within. The LayerHost does not need to be immediately available but once has been rendered, and if missing, we'll avoid trying to render the Layer content until the host is available. If an id is not provided, we will render the Layer content in a fixed position element rendered at the end of the document.}
#' \item {\bold{ insertFirst }} {`boolean` \cr Whether the layer should be added as the first child of the host. If true, the layer will be inserted as the first child of the host By default, the layer will be appended at the end to the host}
#' \item {\bold{ onLayerDidMount }} {`() => void` \cr Callback for when the layer is mounted.}
#' \item {\bold{ onLayerMounted }} {`() => void` \cr Callback for when the layer is mounted.}
#' \item {\bold{ onLayerWillUnmount }} {`() => void` \cr Callback for when the layer is unmounted.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ILayerStyleProps, ILayerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Layer
NULL

#' Link
#'
#' @description
#' Links lead to another part of an app, other pages, or help articles. They can also be used to initiate commands.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Link).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Links visually indicate that they can be clicked, typically by being displayed using the visited or unvisited link system colors. Traditionally, links are underlined as well, but that approach is often reserved for body copy links within an article.
#'
#' ### Content
#'
#' - People should be able to accurately predict the result of selecting a link based on its link text and optional tooltip.
#' - Use descriptive, actionable link text when possible. Avoid using URLs as link text.
#' - Don't use if the action is destructive or irreversible. Links aren't appropriate for commands with significant consequences.
#' - Keep discrete links far enough apart that people can differentiate between them and easily select each one.
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ as }} {`string | React.ComponentClass | React.FunctionComponent` \cr A component that should be used as the root element of the link returned from the Link component.}
#' \item {\bold{ componentRef }} {`IRefObject<ILink>` \cr Optional callback to access the ILink interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ disabled }} {`boolean` \cr Whether the link is disabled}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this Link}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ILinkStyleProps, ILinkStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' }
#'
#' @md
#' @name Link
NULL

#' List
#'
#' @description
#' A list provides a base component for rendering large sets of items. It’s agnostic of layout, the tile component used, and selection management.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/List).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - List items are composed of selection, icon, and name columns at minimum. You can include other columns, such as date modified, or any other metadata field associated with the collection.
#' - Avoid using file type icon overlays to denote status of a file as it can make the entire icon unclear.
#' - If there are multiple lines of text in a column, consider the variable row height variant.
#' - Give columns ample default width to display information.
#'
#' ### Content
#'
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' ### FAQ
#'
#' #### My scrollable content isn't updating on scroll, what should I do?
#'
#' Add the data-is-scrollable="true" attribute to your scrollable element containing the List.
#'
#' By default, the List will use the `<body>` element as the scrollable element. If you contain List within a scrollable `<div>` using overflow: auto or scroll, List needs to listen for scroll events on that element instead. On initialization, List will traverse up the DOM looking for the first element with the data-is-scrollable attribute to know which element to listen to for knowing when to re-evaulate the visible window.
#'
#' #### My list isn't re-rendering when I mutate its items, what should I do?
#'
#' To determine if List should re-render its contents, the component performs a referential equality check on the items array in its shouldComponentUpdate method. This is done to minimize the performance overhead associating with re-rendering the virtualized list pages, as recommended by the React documentation.
#' As a result of this implementation, List will not determine it should re-render if values within the array are mutated. To avoid this problem, we recommend re-creating the items array using a method such as Array.prototype.concat or ES6 spread syntax shown below:
#'
#' ```
#' public appendItems(): void {
#'   const { items } = this.state;
#'
#'   this.setState({
#'     items: [...items, ...[{ name: 'Foo' }, { name: 'Bar' }]]
#'   })
#' }
#'
#' public render(): JSX.Element {
#'   const { items } = this.state;
#'
#'   return <List items={items} />;
#' }
#' ```
#'
#' Since the items array has been re-created, the list will conclude that its contents have changed and it should re-render the new values.
#'
#' #### How do I limit rendering to improve performance?
#'
#' Performance is important, and DOM content is expensive. Therefore, limit what you render. The list component applies this principle by using UI virtualization. Unlike a simple for loop that renders all items in a set, a list only renders a subset of items, and as you scroll around, the subset of rendered content is shifted. This gives a much better experience for large sets, especially when the per-item components are complex/render-intensive/network-intensive.
#'
#' A list breaks down the set of items passed in into pages. Only pages within a "materialized window" are actually rendered. As that window changes due to scroll events, pages that fall outside that window are removed, and their layout space is remembered and pushed into spacer elements. This gives the user the experience of browsing massive amounts of content but only using a small number of actual elements. This gives the browser much less layout to resolve, and gives React DOM diffing much less content to worry about.
#'
#' Note: If onRenderCell is not provided in IListProps, the list will attempt to render the name property for each object in the items array.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ divProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr Props to apply to the list root element.}
#' \item {\bold{ pages }} {`IPage<T>[]` \cr The active pages to be rendered into the list. These will have been rendered using `onRenderPage`.}
#' \item {\bold{ rootRef }} {`React.Ref<HTMLDivElement>` \cr The ref to be applied to the list root. The `List` uses this element to track scroll position and sizing.}
#' \item {\bold{ surfaceElement }} {`JSX.Element | null` \cr The content to be rendered as the list surface element. This will have been rendered using `onRenderSurface`.}
#' \item {\bold{ divProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr Props to apply to the list surface element.}
#' \item {\bold{ pageElements }} {`JSX.Element[]` \cr The content to be rendered representing all active pages.}
#' \item {\bold{ pages }} {`IPage<T>[]` \cr The active pages to be rendered into the list. These will have been rendered using `onRenderPage`.}
#' \item {\bold{ surfaceRef }} {`React.Ref<HTMLDivElement>` \cr A ref to be applied to the surface element. The `List` uses this element to track content size and focus.}
#' \item {\bold{ className }} {`string` \cr Optional classname to append to root list.}
#' \item {\bold{ componentRef }} {`IRefObject<IList>` \cr Optional callback to access the IList interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ getItemCountForPage }} {`(itemIndex?: number, visibleRect?: IRectangle) => number` \cr Method called by the list to get how many items to render per page from specified index. In general, use `getPageSpecification` instead.}
#' \item {\bold{ getKey }} {`(item: T, index?: number) => string` \cr Optional callback to get the item key, to be used on render.}
#' \item {\bold{ getPageHeight }} {`(itemIndex?: number, visibleRect?: IRectangle, itemCount?: number) => number` \cr Method called by the list to get the pixel height for a given page. By default, we measure the first page's height and default all other pages to that height when calculating the surface space. It is ideal to be able to adequately predict page heights in order to keep the surface space from jumping in pixels, which has been seen to cause browser performance issues. In general, use `getPageSpecification` instead.}
#' \item {\bold{ getPageSpecification }} {`(itemIndex?: number, visibleRect?: IRectangle) => IPageSpecification` \cr Called by the list to get the specification for a page. Use this method to provide an allocation of items per page, as well as an estimated rendered height for the page. The list will use this to optimize virtualization.}
#' \item {\bold{ getPageStyle }} {`(page: IPage<T>) => any` \cr Method called by the list to derive the page style object. For spacer pages, the list will derive the height and passed in heights will be ignored.}
#' \item {\bold{ ignoreScrollingState }} {`boolean` \cr Whether to disable scroll state updates. This causes the isScrolling arg in onRenderCell to always be undefined. This is a performance optimization to let List skip a render cycle by not updating its scrolling state.}
#' \item {\bold{ items }} {`T[]` \cr Items to render.}
#' \item {\bold{ onPageAdded }} {`(page: IPage<T>) => void` \cr Optional callback for monitoring when a page is added.}
#' \item {\bold{ onPageRemoved }} {`(page: IPage<T>) => void` \cr Optional callback for monitoring when a page is removed.}
#' \item {\bold{ onPagesUpdated }} {`(pages: IPage<T>[]) => void` \cr Optional callback invoked when List rendering completed. This can be on initial mount or on re-render due to scrolling. This method will be called as a result of changes in List pages (added or removed), and after ALL the changes complete. To track individual page Add / Remove use onPageAdded / onPageRemoved instead.}
#' \item {\bold{ onRenderCell }} {`(item?: T, index?: number, isScrolling?: boolean) => React.ReactNode` \cr Method to call when trying to render an item.}
#' \item {\bold{ onRenderPage }} {`IRenderFunction<IPageProps<T>>` \cr Called when the List will render a page. Override this to control how cells are rendered within a page.}
#' \item {\bold{ onRenderRoot }} {`IRenderFunction<IListOnRenderRootProps<T>>` \cr Render override for the element at the root of the `List`. Use this to apply some final attributes or structure to the content each time the list is updated with new active pages or items.}
#' \item {\bold{ onRenderSurface }} {`IRenderFunction<IListOnRenderSurfaceProps<T>>` \cr Render override for the element representing the surface of the `List`. Use this to alter the structure of the rendered content if necessary on each update.}
#' \item {\bold{ onShouldVirtualize }} {`(props: IListProps<T>) => boolean` \cr Optional callback to determine whether the list should be rendered in full, or virtualized. Virtualization will add and remove pages of items as the user scrolls them into the visible range. This benefits larger list scenarios by reducing the DOM on the screen, but can negatively affect performance for smaller lists. The default implementation will virtualize when this callback is not provided.}
#' \item {\bold{ renderCount }} {`number` \cr Number of items to render. Defaults to items.length.}
#' \item {\bold{ renderedWindowsAhead }} {`number` \cr In addition to the visible window, how many windowHeights should we render ahead.}
#' \item {\bold{ renderedWindowsBehind }} {`number` \cr In addition to the visible window, how many windowHeights should we render behind.}
#' \item {\bold{ role }} {`string` \cr The role to assign to the list root element. Use this to override the default assignment of 'list' to the root and 'listitem' to the cells.}
#' \item {\bold{ startIndex }} {`number` \cr Index in items array to start rendering from. Defaults to 0.}
#' \item {\bold{ usePageCache }} {`boolean` \cr Boolean value to enable render page caching. This is an experimental performance optimization that is off by default.}
#' \item {\bold{ version }} {`{}` \cr An object which can be passed in as a fresh instance to 'force update' the list.}
#' \item {\bold{ page }} {`IPage<T>` \cr The allocation data for the page.}
#' \item {\bold{ role }} {`string` \cr The role being assigned to the rendered page element by the list.}
#' }
#'
#' @md
#' @name List
NULL

#' MarqueeSelection
#'
#' @description
#' The MarqueeSelection component provides a service which allows the user to drag a rectangle to be drawn around
#' items to select them. This works in conjunction with a selection object, which can be used to generically store selection state, separate from a component that consumes the state.
#'
#' MarqueeSelection also works in conjunction with the AutoScroll utility to automatically scroll the container when we drag a rectangle within the vicinity of the edges.
#'
#' When a selection rectangle is dragged, we look for elements with the **data-selection-index** attribute populated. We get these elements' boundingClientRects and compare them with the root's rect to determine selection state. We update the selection state appropriately.
#'
#' In virtualization cases where items that were once selected are dematerialized, we will keep the item in its
#' previous state until we know definitively if it's on/off. (In other words, this works with List.)
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/MarqueeSelection).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the MarqueeSelection.}
#' \item {\bold{ componentRef }} {`IRefObject<IMarqueeSelection>` \cr Optional callback to access the IMarqueeSelection interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ isDraggingConstrainedToRoot }} {`boolean` \cr Optional flag to restrict the drag rect to the root element, instead of allowing the drag rect to start outside of the root element boundaries.}
#' \item {\bold{ isEnabled }} {`boolean` \cr Optional flag to control the enabled state of marquee selection. This allows you to render it and have events all ready to go, but conditionally disable it. That way transitioning between enabled/disabled generate no difference in the DOM.}
#' \item {\bold{ onShouldStartSelection }} {`(ev: MouseEvent) => boolean` \cr Optional callback that is called, when the mouse down event occurs, in order to determine if we should start a marquee selection. If true is returned, we will cancel the mousedown event to prevent upstream mousedown handlers from executing.}
#' \item {\bold{ rootProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr Optional props to mix into the root DIV element.}
#' \item {\bold{ selection }} {`ISelection` \cr The selection object to interact with when updating selection changes.}
#' \item {\bold{ styles }} {`IStyleFunction<IMarqueeSelectionStyleProps, IMarqueeSelectionStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' }
#'
#' @md
#' @name MarqueeSelection
NULL

#' MessageBar
#'
#' @description
#' A banner (`MessageBar`) displays errors, warnings, or important information about an open app or file. For example, if a file failed to upload an error message bar should appear.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/MessageBar).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - A message bar is most commonly found near the top of an app, underneath the app's main command bar. For example, the Microsoft Office message bar is positioned beneath the Ribbon, but above the document canvas.
#' - Multiple message bars can appear at a time, but a given scenario or related set of scenarios should aim to only show one message bar at a time. Message bars are rarely shown in direct response to an action; rather, they should be shown when there’s something a person should know about the overall app or document.
#' - Use the icons options to indicate the message type: the Info icon for information messages; ShieldAlert icon for security-related messages; the Warning icon for non-blocking errors; ErrorBadge icon for critical errors; the Blocked icon for blocking messages; and the Completed icon for success messages.
#'
#' ### Content
#'
#' Message bars should include:
#'
#' #### Title
#'
#' Limit titles to 50 characters (including spaces) to leave room for text expansion when translated. People should be able to scan the title to determine the purpose of the message. Capitalize only the first word of the title and any proper nouns.
#'
#' #### Body text
#'
#' Describe the information or error state concisely, ideally in a single sentence. Limit the message to fewer than 512 characters (including spaces) to leave room for text expansion when translated. Include end punctuation for complete sentences.
#'
#' #### Action buttons (Optional)
#'
#' Offer one to two action buttons to help people solve any errors they're receiving. Limit button text to fewer than 50 charactesr (including spaces) to leave room for translation. Action buttons can have any callback attached to them and should provide people with options to address the notification and dismiss the message bar.
#'
#' #### Link (Optional)
#'
#' Don’t use buttons when a subtler link will suffice. Reserve the use of a button for when the MessageBar has a single ”hero” action that is useful at that particular moment. Avoid using more than one button.
#'
#' #### Close button
#'
#' Always offer a quick way for people to close a message bar, unless there is an issue that must be resolved immediately, such as an expired subscription.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ actions }} {`JSX.Element` \cr The actions you want to show on the other side.}
#' \item {\bold{ ariaLabel }} {`string` \cr A description of the message bar for the benefit of screen readers.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the MessageBar.}
#' \item {\bold{ componentRef }} {`IRefObject<IMessageBar>` \cr Optional callback to access the IMessageBar interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ dismissButtonAriaLabel }} {`string` \cr Aria label on dismiss button if onDismiss is defined.}
#' \item {\bold{ dismissIconProps }} {`IIconProps` \cr Custom icon prop to replace the dismiss icon. If unset, default will be the Fabric Clear icon.}
#' \item {\bold{ isMultiline }} {`boolean` \cr Determines if the message bar is multi lined. If false, and the text overflows over buttons or to another line, it is clipped.}
#' \item {\bold{ messageBarIconProps }} {`IIconProps` \cr Custom icon prop to replace the message bar icon. If unset, default will be the icon set by messageBarType.}
#' \item {\bold{ messageBarType }} {`MessageBarType` \cr The type of MessageBar to render.}
#' \item {\bold{ onDismiss }} {`(ev?: React.MouseEvent<HTMLElement | BaseButton | Button>) => any` \cr Whether the message bar has a dismiss button and its callback. If null, we don't show a dismiss button.}
#' \item {\bold{ overflowButtonAriaLabel }} {`string` \cr Aria label on overflow button if truncated is defined.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IMessageBarStyleProps, IMessageBarStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' \item {\bold{ truncated }} {`boolean` \cr Determines if the message bar text is truncated. If true, a button will render to toggle between a single line view and multiline view. This prop is for single line message bars with no buttons only in a limited space scenario.}
#' }
#'
#' @md
#' @name MessageBar
NULL

#' Modal
#'
#' @description
#' Modals are temporary pop-ups that take focus from the page or app and require people to interact with them. Unlike a dialog box (`Dialog`), a modal should be used for hosting lengthy content, such as privacy statements or license agreements, or for asking people to perform complex or multiple actions, such as changing settings.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Modal).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a variable width with a minimum width of 288 pixels.
#' - Use a variable height with a minimum height of 172 pixels.
#' - Center vertically and horizontally in the available space.
#' - Always have at least one focusable element inside a modal.
#' - Blocking modals (`Modeless Modal`) should be used very sparingly, only when it's critical for people to make a choice or provide information before they can proceed.
#' - Provide a clear way for people to dismiss the control, such as a Close button, which should always go in the upper right corner.
#'
#' ### Content
#'
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowTouchBodyScroll }} {`boolean` \cr Allow body scroll on content and overlay on touch devices. Changing after mounting has no effect.}
#' \item {\bold{ className }} {`string` \cr Optional class name to be added to the root class}
#' \item {\bold{ componentRef }} {`IRefObject<IModal>` \cr Optional callback to access the IDialog interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ containerClassName }} {`string` \cr Optional override for container class}
#' \item {\bold{ dragOptions }} {`IDragOptions` \cr The options to make the modal draggable}
#' \item {\bold{ enableAriaHiddenSiblings }} {`boolean` \cr Puts aria-hidden=true on all non-ancestors of the current modal, for screen readers. This is an experimental feature that will be graduated to default behavior after testing. This flag will be removed with the next major release.}
#' \item {\bold{ isBlocking }} {`boolean` \cr Whether the dialog can be light dismissed by clicking outside the dialog (on the overlay).}
#' \item {\bold{ isDarkOverlay }} {`boolean` \cr Whether the overlay is dark themed.}
#' \item {\bold{ isModeless }} {`boolean` \cr Whether the dialog should be modeless (e.g. not dismiss when focusing/clicking outside of the dialog). if true: isBlocking is ignored, there will be no overlay (isDarkOverlay is ignored), isClickableOutsideFocusTrap is true, and forceFocusInsideTrap is false}
#' \item {\bold{ isOpen }} {`boolean` \cr Whether the dialog is displayed.}
#' \item {\bold{ layerProps }} {`ILayerProps` \cr Defines an optional set of props to be passed through to Layer}
#' \item {\bold{ onDismiss }} {`(ev?: React.MouseEvent<HTMLButtonElement>) => any` \cr A callback function for when the Modal is dismissed light dismiss, before the animation completes.}
#' \item {\bold{ onDismissed }} {`() => any` \cr A callback function which is called after the Modal is dismissed and the animation is complete.}
#' \item {\bold{ onLayerDidMount }} {`() => void` \cr A callback function for when the Modal content is mounted on the overlay layer}
#' \item {\bold{ overlay }} {`IOverlayProps` \cr Defines an optional set of props to be passed through to Overlay}
#' \item {\bold{ scrollableContentClassName }} {`string` \cr Optional override for scrollable content class}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IModalStyleProps, IModalStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ subtitleAriaId }} {`string` \cr ARIA id for the subtitle of the Modal, if any}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ titleAriaId }} {`string` \cr ARIA id for the title of the Modal, if any}
#' \item {\bold{ topOffsetFixed }} {`boolean` \cr Whether the modal should have top offset fixed once opened and expand from the bottom only when the content changes dynamically.}
#' }
#'
#' @md
#' @name Modal
NULL

#' Nav
#'
#' @description
#' Navs (also called "left nav" or "navigation pane") provide links to the main areas of an app or a site. In larger configurations, the Nav is always on-screen, usually on the left of the view. In smaller configurations, the Nav may collapse into a skinnier version or be completely hidden until the user taps an icon.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Nav).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ link }} {`INavLink` \cr (Optional) Link to be rendered.}
#' \item {\bold{ ariaLabel }} {`string` \cr (Optional) The nav container aria label.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Nav}
#' \item {\bold{ componentRef }} {`IRefObject<INav>` \cr Optional callback to access the INav interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ expandButtonAriaLabel }} {`string` \cr (Optional) The nav container aria label. The link name is prepended to this label. If not provided, the aria label will default to the link name.}
#' \item {\bold{ groups }} {`INavLinkGroup[] | null` \cr A collection of link groups to display in the navigation bar}
#' \item {\bold{ initialSelectedKey }} {`string` \cr (Optional) The key of the nav item initially selected.}
#' \item {\bold{ isOnTop }} {`boolean` \cr Indicates whether the navigation component renders on top of other content in the UI}
#' \item {\bold{ linkAs }} {`IComponentAs<INavButtonProps>` \cr Render a custom link in place of the normal one. This replaces the entire button rather than simply button content}
#' \item {\bold{ onLinkClick }} {`(ev?: React.MouseEvent<HTMLElement>, item?: INavLink) => void` \cr Function callback invoked when a link in the navigation is clicked}
#' \item {\bold{ onLinkExpandClick }} {`(ev?: React.MouseEvent<HTMLElement>, item?: INavLink) => void` \cr Function callback invoked when the chevron on a link is clicked}
#' \item {\bold{ onRenderGroupHeader }} {`IRenderFunction<IRenderGroupHeaderProps>` \cr Used to customize how content inside the group header is rendered}
#' \item {\bold{ onRenderLink }} {`IRenderFunction<INavLink>` \cr Used to customize how content inside the link tag is rendered}
#' \item {\bold{ selectedAriaLabel }} {`string` \cr (Deprecated) Use ariaCurrent on links instead}
#' \item {\bold{ selectedKey }} {`string` \cr (Optional) The key of the nav item selected by caller.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<INavStyleProps, INavStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Nav
NULL

#' OverflowSet
#'
#' @description
#' The OverflowSet is a flexible container component that is useful for displaying a primary set of content with additional content in an overflow callout. Note that the example below is only an example of how to render the component, not a specific use case.
#'
#' ### Accessibility
#'
#' By default, the OverflowSet is simply `role=group`. If you used as a menu, you will need to add `role="menubar"` and add proper aria roles to each rendered item (`menuitem`, `menuitemcheckbox`, `menuitemradio`)
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/OverflowSet).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ key }} {`string` \cr Unique id to identify the item.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for the overflowSetItem.}
#' \item {\bold{ className }} {`string` \cr Class name}
#' \item {\bold{ componentRef }} {`IRefObject<IOverflowSet>` \cr Gets the component ref.}
#' \item {\bold{ doNotContainWithinFocusZone }} {`boolean` \cr If true do not contain the OverflowSet inside of a FocusZone, otherwise the OverflowSet will contain a FocusZone. If this is set to true focusZoneProps will be ignored. Use one or the other.}
#' \item {\bold{ focusZoneProps }} {`IFocusZoneProps` \cr Custom properties for OverflowSet's FocusZone. If doNotContainWithinFocusZone is set to true focusZoneProps will be ignored. Use one or the other.}
#' \item {\bold{ items }} {`IOverflowSetItemProps[]` \cr An array of items to be rendered by your onRenderItem function in the primary content area}
#' \item {\bold{ itemSubMenuProvider }} {`(item: IOverflowSetItemProps) => any[] | undefined` \cr Function that will take in an IOverflowSetItemProps and return the subMenu for that item. If not provided, will use 'item.subMenuProps.items' by default. This is only used if your overflow set has keytips.}
#' \item {\bold{ keytipSequences }} {`string[]` \cr Optional full keytip sequence for the overflow button, if it will have a keytip.}
#' \item {\bold{ onRenderItem }} {`(item: IOverflowSetItemProps) => any` \cr Method to call when trying to render an item.}
#' \item {\bold{ onRenderOverflowButton }} {`IRenderFunction<any[]>` \cr Rendering method for overflow button and contextual menu. The argument to the function is the overflowItems passed in as props to this function.}
#' \item {\bold{ overflowItems }} {`IOverflowSetItemProps[]` \cr An array of items to be passed to overflow contextual menu}
#' \item {\bold{ overflowSide }} {`'start' | 'end'` \cr Controls wether or not the overflow button is placed at the start or end of the items. This gives a reveresed visual behavior but maintains correct keyboard navigation.}
#' \item {\bold{ role }} {`string` \cr The role for the OverflowSet.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IOverflowSetProps, IOverflowSetStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ vertical }} {`boolean` \cr Change item layout direction to vertical/stacked. If role is set to `menubar`, `vertical={true}` will also add proper `aria-orientation`.}
#' }
#'
#' @md
#' @name OverflowSet
NULL

#' Overlay
#'
#' @description
#' Overlays are used to render a semi-transparent layer on top of existing UI. Overlays help focus the user on the content that sits above the added layer and are often used to help designate a modal or blocking experience. Overlays can be seen used in conjunction with Panels and Dialogs.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Overlay).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowTouchBodyScroll }} {`boolean` \cr Allow body scroll on touch devices. Changing after mounting has no effect.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Overlay}
#' \item {\bold{ componentRef }} {`IRefObject<IOverlay>` \cr Gets the component ref.}
#' \item {\bold{ isDarkThemed }} {`boolean` \cr Whether to use the dark-themed overlay.}
#' \item {\bold{ onClick }} {`() => void` \cr }
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IOverlayStyleProps, IOverlayStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Overlay
NULL

#' Panel
#'
#' @description
#' Panels are overlays that contain supplementary content and are used for complex creation, edit, or management experiences.  For example, viewing details about an item in a list or editing settings.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Panel).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use for self-contained experiences where someone doesn’t need to interact with the app view to complete the task.
#' - Consider how the panel and its contained contents will scale across responsive web breakpoints.
#'
#' #### Header
#'
#' - Include a close button in the top-right corner.
#' - Lock the title to the top of the panel.
#' - The header can contain a variety of components. Components are stacked under the main title, locked to the top, and push content down.
#'
#' #### Body
#'
#' - The body is a flexible container that can house a wide variety of components, content, and formatting.
#' - Content can scroll.
#'
#' #### Footer
#'
#' - Standard footers include primary and secondary buttons to confirm or cancel the changes or task.
#' - Read-only panels may contain a single Close button.
#' - Lock the footer to the bottom of the panel.
#'
#' ### Content
#'
#' #### Title
#'
#' - Titles should explain the panel content in clear, concise, and specific terms.
#' - Keep the length of the title to one line, if possible.
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see `[Capitalization]` in the Microsoft Writing Style Guide.
#' - Don’t put a period at the end of the title.
#'
#' `[capitalization]`: https://docs.microsoft.com/style-guide/capitalization
#'
#' #### Button labels
#'
#' - Be concise. Limit labels to one or two words. Usually a single verb is best. Include a noun if there’s any room for interpretation about what the verb means. For example, “Save” or “Save settings.”
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowTouchBodyScroll }} {`boolean` \cr Allow body scroll on content and overlay on touch devices. Changing after mounting has no effect.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Panel}
#' \item {\bold{ closeButtonAriaLabel }} {`string` \cr Aria label on close button}
#' \item {\bold{ componentId }} {`string` \cr Deprecated property. Serves no function.}
#' \item {\bold{ componentRef }} {`IRefObject<IPanel>` \cr Optional callback to access the IPanel interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ customWidth }} {`string` \cr Custom panel width, used only when `type` is set to `PanelType.custom`.}
#' \item {\bold{ elementToFocusOnDismiss }} {`HTMLElement` \cr Sets the HTMLElement to focus on when exiting the FocusTrapZone.}
#' \item {\bold{ firstFocusableSelector }} {`string` \cr Indicates the selector for first focusable item. Deprecated, use `focusTrapZoneProps`.}
#' \item {\bold{ focusTrapZoneProps }} {`IFocusTrapZoneProps` \cr Optional props to pass to the FocusTrapZone component to manage focus in the panel.}
#' \item {\bold{ forceFocusInsideTrap }} {`boolean` \cr Indicates whether Panel should force focus inside the focus trap zone. If not explicitly specified, behavior aligns with FocusTrapZone's default behavior. Deprecated, use `focusTrapZoneProps`.}
#' \item {\bold{ hasCloseButton }} {`boolean` \cr Has the close button visible.}
#' \item {\bold{ headerClassName }} {`string` \cr Optional parameter to provider the class name for header text}
#' \item {\bold{ headerText }} {`string` \cr Header text for the Panel.}
#' \item {\bold{ headerTextProps }} {`React.HTMLAttributes<HTMLDivElement>` \cr The props for header text container.}
#' \item {\bold{ ignoreExternalFocusing }} {`boolean` \cr Indicates if this Panel will ignore keeping track of HTMLElement that activated the Zone. Deprecated, use `focusTrapZoneProps`.}
#' \item {\bold{ isBlocking }} {`boolean` \cr Whether the panel uses a modal overlay or not}
#' \item {\bold{ isFooterAtBottom }} {`boolean` \cr Determines if content should stretch to fill available space putting footer at the bottom of the page}
#' \item {\bold{ isHiddenOnDismiss }} {`boolean` \cr Whether the panel is hidden on dismiss, instead of destroyed in the DOM. Protects the contents from being destroyed when the panel is dismissed.}
#' \item {\bold{ isLightDismiss }} {`boolean` \cr Whether the panel can be light dismissed.}
#' \item {\bold{ isOpen }} {`boolean` \cr Whether the panel is displayed. If true, will cause panel to stay open even if dismissed. If false, will cause panel to stay hidden. If undefined, will allow the panel to control its own visility through open/dismiss methods.}
#' \item {\bold{ layerProps }} {`ILayerProps` \cr Optional props to pass to the Layer component hosting the panel.}
#' \item {\bold{ onDismiss }} {`(ev?: React.SyntheticEvent<HTMLElement>) => void` \cr A callback function for when the panel is closed, before the animation completes. If the panel should NOT be dismissed based on some keyboard event, then simply call ev.preventDefault() on it}
#' \item {\bold{ onDismissed }} {`() => void` \cr A callback function which is called **after** the Panel is dismissed and the animation is complete. (If you need to update the Panel's `isOpen` prop in response to a dismiss event, use `onDismiss` instead.)}
#' \item {\bold{ onLightDismissClick }} {`() => void` \cr Optional custom function to handle clicks outside the panel in lightdismiss mode}
#' \item {\bold{ onOpen }} {`() => void` \cr A callback function for when the Panel is opened, before the animation completes.}
#' \item {\bold{ onOpened }} {`() => void` \cr A callback function for when the Panel is opened, after the animation completes.}
#' \item {\bold{ onOuterClick }} {`() => void` \cr Optional custom function to handle clicks outside this component}
#' \item {\bold{ onRenderBody }} {`IRenderFunction<IPanelProps>` \cr Optional custom renderer for body region. Replaces any children passed into the component.}
#' \item {\bold{ onRenderFooter }} {`IRenderFunction<IPanelProps>` \cr Optional custom renderer for footer region. Replaces sticky footer.}
#' \item {\bold{ onRenderFooterContent }} {`IRenderFunction<IPanelProps>` \cr Custom renderer for content in the sticky footer}
#' \item {\bold{ onRenderHeader }} {`IPanelHeaderRenderer` \cr Optional custom renderer for header region. Replaces current title}
#' \item {\bold{ onRenderNavigation }} {`IRenderFunction<IPanelProps>` \cr Optional custom renderer navigation region. Replaces the region that contains the close button.}
#' \item {\bold{ onRenderNavigationContent }} {`IRenderFunction<IPanelProps>` \cr Optional custom renderer for content in the navigation region. Replaces current close button.}
#' \item {\bold{ overlayProps }} {`IOverlayProps` \cr Optional props to pass to the Overlay component that the panel uses.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPanelStyleProps, IPanelStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ type }} {`PanelType` \cr Type of the panel.}
#' }
#'
#' @md
#' @name Panel
NULL

#' PeoplePicker
#'
#' @description
#' The people picker (`PeoplePicker`) is used to select one or more entities, such as people or groups, from a list. It makes composing an email to someone, or adding them to a group, easy if you don’t know their full name or email address.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/PeoplePicker).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use the people picker to add someone to the To line of an email, or to add someone to a list.
#' - Use the `MemberList PeoplePicker` to display selections below the input field.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPeoplePickerItemSelectedStyleProps, IPeoplePickerItemSelectedStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ ValidationState }} {`ValidationState` \cr }
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the PeoplePickerItem root element.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ compact }} {`boolean` \cr Flag that controls whether each suggested PeoplePicker item (Persona) is rendered with or without secondary text for compact look.}
#' \item {\bold{ personaProps }} {`IPersonaProps` \cr Persona props for each suggested for picking PeoplePicker item.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPeoplePickerItemSuggestionStyleProps, IPeoplePickerItemSuggestionStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ suggestionsProps }} {`IBasePickerSuggestionsProps` \cr General common props for all PeoplePicker items suggestions.}
#' }
#'
#' @md
#' @name PeoplePicker
NULL

#' Persona
#'
#' @description
#' A persona is a visual representation of a person across products, typically showcasing the image that person has chosen to upload themselves. The control can also be used to show that person's online status.
#'
#' The complete control inclues an individual's avatar (an uploaded image or a composition of the person’s initials on a background color), their name or identification, and online status.
#'
#' The persona control is used in the `PeoplePicker` and `Facepile` controls.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Persona).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use the 24-pixel persona in text fields in read-only mode or in experiences like multicolumn lists which need compact persona representations.
#' - Use the 32-pixel persona in text fields in edit mode.
#' - Use the 32-pixel, 40-pixel, and 48-pixel persona in menus and list views.
#' - Use the 72-pixel and 100-pixel persona in profile cards and views.
#'
#' ### Content
#'
#' - Change the values of the color swatches in high contrast mode.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the PersonaCoin}
#' \item {\bold{ componentRef }} {`IRefObject<{}>` \cr Gets the component ref.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPersonaCoinStyleProps, IPersonaCoinStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ componentRef }} {`IRefObject<{}>` \cr Gets the component ref.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPersonaPresenceStyleProps, IPersonaPresenceStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the Persona}
#' \item {\bold{ componentRef }} {`IRefObject<IPersona>` \cr Optional callback to access the IPersona interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ onRenderOptionalText }} {`IRenderFunction<IPersonaProps>` \cr Optional custom renderer for the optional text.}
#' \item {\bold{ onRenderPrimaryText }} {`IRenderFunction<IPersonaProps>` \cr Optional custom renderer for the primary text.}
#' \item {\bold{ onRenderSecondaryText }} {`IRenderFunction<IPersonaProps>` \cr Optional custom renderer for the secondary text.}
#' \item {\bold{ onRenderTertiaryText }} {`IRenderFunction<IPersonaProps>` \cr Optional custom renderer for the tertiary text.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPersonaStyleProps, IPersonaStyles>` \cr Call to provide customized styling that will layer on top of variant rules}
#' \item {\bold{ allowPhoneInitials }} {`boolean` \cr Whether initials are calculated for phone numbers and number sequences. Example: Set property to true to get initials for project names consisting of numbers only.}
#' \item {\bold{ coinProps }} {`IPersonaCoinProps` \cr Optional HTML element props for Persona coin.}
#' \item {\bold{ coinSize }} {`number` \cr Optional custom persona coin size in pixel.}
#' \item {\bold{ hidePersonaDetails }} {`boolean` \cr Whether to not render persona details, and just render the persona image/initials.}
#' \item {\bold{ imageAlt }} {`string` \cr Alt text for the image to use. Defaults to an empty string.}
#' \item {\bold{ imageInitials }} {`string` \cr The user's initials to display in the image area when there is no image.}
#' \item {\bold{ imageShouldFadeIn }} {`boolean` \cr If true, adds the css class 'is-fadeIn' to the image.}
#' \item {\bold{ imageShouldStartVisible }} {`boolean` \cr If true, the image starts as visible and is hidden on error. Otherwise, the image is hidden until it is successfully loaded. This disables imageShouldFadeIn.}
#' \item {\bold{ imageUrl }} {`string` \cr Url to the image to use, should be a square aspect ratio and big enough to fit in the image area.}
#' \item {\bold{ initialsColor }} {`PersonaInitialsColor | string` \cr The background color when the user's initials are displayed.}
#' \item {\bold{ isOutOfOffice }} {`boolean` \cr This flag can be used to signal the persona is out of office. This will change the way the presence icon looks for statuses that support dual-presence.}
#' \item {\bold{ onPhotoLoadingStateChange }} {`(newImageLoadState: ImageLoadState) => void` \cr Optional callback for when loading state of the photo changes}
#' \item {\bold{ onRenderCoin }} {`IRenderFunction<IPersonaSharedProps>` \cr Optional custom renderer for the coin}
#' \item {\bold{ onRenderInitials }} {`IRenderFunction<IPersonaSharedProps>` \cr Optional custom renderer for the initials}
#' \item {\bold{ onRenderPersonaCoin }} {`IRenderFunction<IPersonaSharedProps>` \cr Optional custom renderer for the coin}
#' \item {\bold{ optionalText }} {`string` \cr Optional text to display, usually a custom message set. The optional text will only be shown when using size100.}
#' \item {\bold{ presence }} {`PersonaPresence` \cr Presence of the person to display - will not display presence if undefined.}
#' \item {\bold{ presenceColors }} {`{ available: string; away: string; busy: string; dnd: string; offline: string; oof: string; background: string; }` \cr The colors to be used for the presence-icon and it's background}
#' \item {\bold{ presenceTitle }} {`string` \cr Presence title to be shown as a tooltip on hover over the presence icon.}
#' \item {\bold{ primaryText }} {`string` \cr Primary text to display, usually the name of the person.}
#' \item {\bold{ secondaryText }} {`string` \cr Secondary text to display, usually the role of the user.}
#' \item {\bold{ showInitialsUntilImageLoads }} {`boolean` \cr If true renders the initials while the image is loading. This only applies when an imageUrl is provided.}
#' \item {\bold{ showSecondaryText }} {`boolean` \cr }
#' \item {\bold{ showUnknownPersonaCoin }} {`boolean` \cr If true, show the special coin for unknown persona. It has '?' in place of initials, with static font and background colors}
#' \item {\bold{ size }} {`PersonaSize` \cr Decides the size of the control.}
#' \item {\bold{ tertiaryText }} {`string` \cr Tertiary text to display, usually the status of the user. The tertiary text will only be shown when using size72 or size100.}
#' \item {\bold{ text }} {`string` \cr Primary text to display, usually the name of the person.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' }
#'
#' @md
#' @name Persona
NULL

#' Pickers
#'
#' @description
#'
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Pickers).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr ClassName for the picker.}
#' \item {\bold{ componentRef }} {`IRefObject<IBasePicker<T>>` \cr Optional callback to access the IBasePicker interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ createGenericItem }} {`(input: string, ValidationState: ValidationState) => ISuggestionModel<T> | T` \cr Function that specifies how arbitrary text entered into the well is handled.}
#' \item {\bold{ defaultSelectedItems }} {`T[]` \cr Initial items that have already been selected and should appear in the people picker.}
#' \item {\bold{ disabled }} {`boolean` \cr Flag for disabling the picker.}
#' \item {\bold{ enableSelectedSuggestionAlert }} {`boolean` \cr Adds an additional alert for the currently selected suggestion. This prop should be set to true for IE11 and below, as it enables proper screen reader behavior for each suggestion (since aria-activedescendant does not work with IE11). It should not be set for modern browsers (Edge, Chrome).}
#' \item {\bold{ getTextFromItem }} {`(item: T, currentValue?: string) => string` \cr A callback to get text from an item. Used to autofill text in the pickers.}
#' \item {\bold{ inputProps }} {`IInputProps` \cr AutoFill input native props}
#' \item {\bold{ itemLimit }} {`number` \cr Restrict the amount of selectable items.}
#' \item {\bold{ onBlur }} {`React.FocusEventHandler<HTMLInputElement | Autofill>` \cr A callback for when the user moves the focus away from the picker}
#' \item {\bold{ onChange }} {`(items?: T[]) => void` \cr A callback for when the selected list of items changes.}
#' \item {\bold{ onDismiss }} {`(ev?: any, selectedItem?: T) => boolean | void` \cr A callback to override the default behavior of adding the selected suggestion on dismiss. If it returns true or nothing, the selected item will be added on dismiss. If false, the selected item will not be added on dismiss.}
#' \item {\bold{ onEmptyInputFocus }} {`(selectedItems?: T[]) => T[] | PromiseLike<T[]>` \cr A callback for what should happen when a user clicks within the input area.}
#' \item {\bold{ onEmptyResolveSuggestions }} {`(selectedItems?: T[]) => T[] | PromiseLike<T[]>` \cr A callback for what should happen when suggestions are shown without input provided. Returns the already selected items so the resolver can filter them out. If used in conjunction with resolveDelay this will only kick off after the delay throttle.}
#' \item {\bold{ onFocus }} {`React.FocusEventHandler<HTMLInputElement | Autofill>` \cr A callback for when the user put focus on the picker}
#' \item {\bold{ onGetMoreResults }} {`(filter: string, selectedItems?: T[]) => T[] | PromiseLike<T[]>` \cr A callback that gets the rest of the results when a user clicks get more results.}
#' \item {\bold{ onInputChange }} {`(input: string) => string` \cr A callback used to modify the input string.}
#' \item {\bold{ onItemSelected }} {`(selectedItem?: T) => T | PromiseLike<T> | null` \cr A callback to process a selection after the user selects something from the picker. If the callback returns null, the item will not be added to the picker.}
#' \item {\bold{ onRemoveSuggestion }} {`(item: T) => void` \cr A callback for when an item is removed from the suggestion list}
#' \item {\bold{ onRenderItem }} {`(props: IPickerItemProps<T>) => JSX.Element` \cr Function that specifies how the selected item will appear.}
#' \item {\bold{ onRenderSuggestionsItem }} {`(props: T, itemProps: ISuggestionItemProps<T>) => JSX.Element` \cr Function that specifies how an individual suggestion item will appear.}
#' \item {\bold{ onResolveSuggestions }} {`(filter: string, selectedItems?: T[]) => T[] | PromiseLike<T[]>` \cr A callback for what should happen when a person types text into the input. Returns the already selected items so the resolver can filter them out. If used in conjunction with resolveDelay this will only kick off after the delay throttle.}
#' \item {\bold{ onValidateInput }} {`(input: string) => ValidationState` \cr A function used to validate if raw text entered into the well can be added into the selected items list}
#' \item {\bold{ pickerCalloutProps }} {`ICalloutProps` \cr The properties that will get passed to the Callout component.}
#' \item {\bold{ pickerSuggestionsProps }} {`IBasePickerSuggestionsProps` \cr The properties that will get passed to the Suggestions component.}
#' \item {\bold{ removeButtonAriaLabel }} {`string` \cr Aria label for the "X" button in the selected item component.}
#' \item {\bold{ resolveDelay }} {`number` \cr The delay time in ms before resolving suggestions, which is kicked off when input has been changed. e.g. If a second input change happens within the resolveDelay time, the timer will start over. Only until after the timer completes will onResolveSuggestions be called.}
#' \item {\bold{ searchingText }} {`((props: { input: string; }) => string) | string` \cr The text to display while searching for more results in a limited suggestions list}
#' \item {\bold{ selectedItems }} {`T[]` \cr The items that the base picker should currently display as selected. If this is provided then the picker will act as a controlled component.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IBasePickerStyleProps, IBasePickerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by styled() function.}
#' \item {\bold{ "aria-label" }} {`string` \cr Screen reader label to apply to an input element.}
#' \item {\bold{ defaultVisibleValue }} {`string` \cr The default value to be visible when the autofill first created. This is different than placeholder text because the placeholder text will disappear and re-appear. This text persists until deleted or changed.}
#' \item {\bold{ componentRef }} {`IRefObject<IPickerItem>` \cr Optional callback to access the IPickerItem interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ index }} {`number` \cr Index number of the item in the array of picked items.}
#' \item {\bold{ item }} {`T` \cr The item of Type T (Persona, Tag, or any other custom item provided).}
#' \item {\bold{ key }} {`string | number` \cr Unique key for each picked item.}
#' \item {\bold{ onItemChange }} {`(item: T, index: number) => void` \cr Internal Use only, gives a callback to the renderer to call when an item has changed. This allows the base picker to keep track of changes in the items.}
#' \item {\bold{ onRemoveItem }} {`() => void` \cr Callback issued when the item is removed from the array of picked items.}
#' \item {\bold{ removeButtonAriaLabel }} {`string` \cr Aria-label for the picked item remove button.}
#' \item {\bold{ selected }} {`boolean` \cr Whether the picked item is selected or not.}
#' \item {\bold{ className }} {`string` \cr Optional className for the root element of the suggestion item.}
#' \item {\bold{ componentRef }} {`IRefObject<ISuggestionsItem>` \cr Optional callback to access the ISuggestionItem interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ id }} {`string` \cr Unique id of the suggested item.}
#' \item {\bold{ isSelectedOverride }} {`boolean` \cr An override for the 'selected' property of the SuggestionModel.}
#' \item {\bold{ onClick }} {`(ev: React.MouseEvent<HTMLButtonElement>) => void` \cr Callback for when the user clicks on the suggestion.}
#' \item {\bold{ onRemoveItem }} {`(ev: React.MouseEvent<HTMLButtonElement>) => void` \cr Callback for when the item is removed from the array of suggested items.}
#' \item {\bold{ removeButtonAriaLabel }} {`string` \cr The ARIA label for the button to remove the suggestion from the list.}
#' \item {\bold{ RenderSuggestion }} {`(item: T, suggestionItemProps: ISuggestionItemProps<T>) => JSX.Element` \cr Optional renderer to override the default one for each type of picker.}
#' \item {\bold{ showRemoveButton }} {`boolean` \cr Whether the remove button should be rendered or not.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISuggestionsItemStyleProps, ISuggestionsItemStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ suggestionModel }} {`ISuggestionModel<T>` \cr Individual suggestion object containing its properties.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ className }} {`string` \cr The CSS className of the suggestions root.}
#' \item {\bold{ componentRef }} {`IRefObject<ISuggestions<T>>` \cr Optional callback to access the ISuggestions interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ createGenericItem }} {`() => void` \cr The callback that should be called when the user attempts to use the input text as as item}
#' \item {\bold{ forceResolveText }} {`string` \cr The text that appears indicating to the use to force resolve the input}
#' \item {\bold{ isLoading }} {`boolean` \cr Used to indicate whether or not the suggestions are loading.}
#' \item {\bold{ isMostRecentlyUsedVisible }} {`boolean` \cr Indicates if a short list of recent suggestions should be shown.}
#' \item {\bold{ isResultsFooterVisible }} {`boolean` \cr Indicates if the text in resultsFooter or resultsFooterFull should be shown at the end of the suggestion list.}
#' \item {\bold{ isSearching }} {`boolean` \cr Used to indicate whether or not the component is searching for more results.}
#' \item {\bold{ loadingText }} {`string` \cr The text to display while the results are loading.}
#' \item {\bold{ moreSuggestionsAvailable }} {`boolean` \cr Used to indicate whether or not the user can request more suggestions. Dictates whether or not the searchForMore button is displayed.}
#' \item {\bold{ mostRecentlyUsedHeaderText }} {`string` \cr The text that should appear at the top of the most recently used box.}
#' \item {\bold{ noResultsFoundText }} {`string` \cr The text that should appear if no results are found when searching.}
#' \item {\bold{ onGetMoreResults }} {`() => void` \cr The callback that should be called when the user attempts to get more results}
#' \item {\bold{ onRenderNoResultFound }} {`IRenderFunction<void>` \cr How the "no result found" should look in the suggestion list.}
#' \item {\bold{ onRenderSuggestion }} {`(props: T, suggestionItemProps: ISuggestionItemProps<T>) => JSX.Element` \cr How the suggestion should look in the suggestion list.}
#' \item {\bold{ onSuggestionClick }} {`(ev?: React.MouseEvent<HTMLElement>, item?: any, index?: number) => void` \cr What should occur when a suggestion is clicked}
#' \item {\bold{ onSuggestionRemove }} {`(ev?: React.MouseEvent<HTMLElement>, item?: T | IPersonaProps, index?: number) => void` \cr Function to fire when one of the optional remove buttons on a suggestion is clicked.
#'
#' TODO (adjective-object) remove IPersonaprops before the next major version bump}
#' \item {\bold{ refocusSuggestions }} {`(keyCode: KeyCodes) => void` \cr A function that resets focus to the expected item in the suggestion list}
#' \item {\bold{ removeSuggestionAriaLabel }} {`string` \cr An ARIA label to use for the buttons to remove individual suggestions.}
#' \item {\bold{ resultsFooter }} {`(props: ISuggestionsProps<T>) => JSX.Element` \cr A renderer that adds an element at the end of the suggestions list it has fewer items than resultsMaximumNumber.}
#' \item {\bold{ resultsFooterFull }} {`(props: ISuggestionsProps<T>) => JSX.Element` \cr A renderer that adds an element at the end of the suggestions list it has more items than resultsMaximumNumber.}
#' \item {\bold{ resultsMaximumNumber }} {`number` \cr Maximum number of suggestions to show in the full suggestion list.}
#' \item {\bold{ searchErrorText }} {`string` \cr The text that should appear if there is a search error.}
#' \item {\bold{ searchForMoreText }} {`string` \cr The text that appears indicating to the user that they can search for more results.}
#' \item {\bold{ searchingText }} {`string` \cr The text to display while searching for more results in a limited suggestions list.}
#' \item {\bold{ showForceResolve }} {`() => boolean` \cr The callback that should be called to see if the force resolve command should be shown}
#' \item {\bold{ showRemoveButtons }} {`boolean` \cr Indicates whether to show a button with each suggestion to remove that suggestion.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<any, any>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ suggestions }} {`ISuggestionModel<T>[]` \cr The list of Suggestions that will be displayed}
#' \item {\bold{ suggestionsAvailableAlertText }} {`string` \cr Screen reader message to read when there are suggestions available.}
#' \item {\bold{ suggestionsClassName }} {`string` \cr The CSS className of the suggestions list}
#' \item {\bold{ suggestionsContainerAriaLabel }} {`string` \cr An ARIA label for the container that is the parent of the suggestions.}
#' \item {\bold{ suggestionsHeaderText }} {`string` \cr The text that appears at the top of the suggestions list.}
#' \item {\bold{ suggestionsItemClassName }} {`string` \cr The className of the suggestion item.}
#' \item {\bold{ suggestionsListId }} {`string` \cr The string that will be used as the suggestionsListId. Will be used by the BasePicker to keep track of the list for aria.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' }
#'
#' @md
#' @name Pickers
NULL

#' Pivot
#'
#' @description
#' The Pivot control and related tabs pattern are used for navigating frequently accessed, distinct content categories. Pivots allow for navigation between two or more content views and relies on text headers to articulate the different sections of content.
#'
#' - Tapping on a pivot item header navigates to that header's section content.
#'
#' Tabs are a visual variant of Pivot that use a combination of icons and text or just icons to articulate section content.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Pivot).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ alwaysRender }} {`boolean` \cr Defines whether to always render the pivot item (regardless of whether it is selected or not). Useful if you're rendering content that is expensive to mount.}
#' \item {\bold{ ariaLabel }} {`string` \cr The aria label of each pivot link which will read by screen reader instead of linkText.
#'
#' Note that unless you have compelling requirements you should not override aria-label.}
#' \item {\bold{ componentRef }} {`IRefObject<{}>` \cr Gets the component ref.}
#' \item {\bold{ headerButtonProps }} {`IButtonProps | { [key: string]: string | number | boolean; }` \cr Props for the header command button. This provides a way to pass in native props, such as data-* and aria-*, for each pivot header/link element.}
#' \item {\bold{ headerText }} {`string` \cr The text displayed of each pivot link.}
#' \item {\bold{ itemCount }} {`number | string` \cr Defines an optional item count displayed in parentheses just after the `linkText`.
#'
#' Examples: completed (4), Unread (99+)}
#' \item {\bold{ itemIcon }} {`string` \cr An optional icon to show next to the pivot link.}
#' \item {\bold{ itemKey }} {`string` \cr An required key to uniquely identify a pivot item.
#'
#' Note: The 'key' from react props cannot be used inside component.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this PivotItem.}
#' \item {\bold{ linkText }} {`string` \cr The text displayed of each pivot link - renaming to `headerText`.}
#' \item {\bold{ onRenderItemLink }} {`IRenderFunction<IPivotItemProps>` \cr Optional custom renderer for the pivot item link.}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Pivot}
#' \item {\bold{ componentRef }} {`IRefObject<IPivot>` \cr Optional callback to access the IPivot interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultSelectedIndex }} {`number` \cr Default selected index for the pivot. Only provide this if the pivot is an uncontrolled component; otherwise, use the `selectedKey` property.
#'
#' This property is also mutually exclusive with `defaultSelectedKey`.}
#' \item {\bold{ defaultSelectedKey }} {`string` \cr Default selected key for the pivot. Only provide this if the pivot is an uncontrolled component; otherwise, use the `selectedKey` property.
#'
#' This property is also mutually exclusive with `defaultSelectedIndex`.}
#' \item {\bold{ getTabId }} {`(itemKey: string, index: number) => string` \cr Callback to customize how IDs are generated for each tab header. Useful if you're rendering content outside and need to connect aria-labelledby.}
#' \item {\bold{ headersOnly }} {`boolean` \cr Whether to skip rendering the tabpanel with the content of the selected tab. Use this prop if you plan to separately render the tab content and don't want to leave an empty tabpanel in the page that may confuse Screen Readers.}
#' \item {\bold{ initialSelectedIndex }} {`number` \cr Index of the pivot item initially selected. Mutually exclusive with `initialSelectedKey`. Only provide this if the pivot is an uncontrolled component; otherwise, use `selectedKey`.}
#' \item {\bold{ initialSelectedKey }} {`string` \cr Key of the pivot item initially selected. Mutually exclusive with `initialSelectedIndex`. Only provide this if the pivot is an uncontrolled component; otherwise, use `selectedKey`.}
#' \item {\bold{ linkFormat }} {`PivotLinkFormat` \cr PivotLinkFormat to use (links, tabs)}
#' \item {\bold{ linkSize }} {`PivotLinkSize` \cr PivotLinkSize to use (normal, large)}
#' \item {\bold{ onLinkClick }} {`(item?: PivotItem, ev?: React.MouseEvent<HTMLElement>) => void` \cr Callback for when the selected pivot item is changed.}
#' \item {\bold{ selectedKey }} {`string | null` \cr Key of the selected pivot item. Updating this will override the Pivot's selected item state. Only provide this if the pivot is a controlled component where you are maintaining the current state; otherwise, use `defaultSelectedKey`.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IPivotStyleProps, IPivotStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' }
#'
#' @md
#' @name Pivot
NULL

#' ProgressIndicator
#'
#' @description
#' ProgressIndicators are used to show the completion status of an operation lasting more than 2 seconds. If the state of progress cannot be determined, use a Spinner instead. ProgressIndicators can appear in a new panel, a flyout, under the UI initiating the operation, or even replacing the initiating UI, as long as the UI can return if the operation is canceled or is stopped.
#'
#' ProgressIndicators feature a bar showing total units to completion, and total units finished. The description of the operation appears above the bar, and the status in text appears below. The description should tell someone exactly what the operation is doing. Examples of formatting include:
#'
#' - **`[Object]`** is being **`[operation name]`**, or
#' - **`[Object]`** is being **`[operation name]`** to **`[destination name]`** or
#' - **`[Object]`** is being **`[operation name]`** from **`[source name]`** to **`[destination name]`**
#'
#' Status text is generally in units elapsed and total units. If the operation can be canceled, an “X” icon is used and should be placed in the upper right, aligned with the baseline of the operation name. When an error occurs, replace the status text with the error description using ms-fontColor-redDark.
#'
#' Real-world examples include copying files to a storage location, saving edits to a file, and more. Use units that are informative and relevant to give the best idea to users of how long the operation will take to complete. Avoid time units as they are rarely accurate enough to be trustworthy. Also, combine steps of a complex operation into one total bar to avoid “rewinding” the bar. Instead change the operation description to reflect the change if necessary. Bars moving backwards reduce confidence in the service.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ProgressIndicator).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaValueText }} {`string` \cr Text alternative of the progress status, used by screen readers for reading the value of the progress.}
#' \item {\bold{ barHeight }} {`number` \cr Height of the ProgressIndicator}
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the ProgressIndicator}
#' \item {\bold{ description }} {`React.ReactNode` \cr Text describing or supplementing the operation. May be a string or React virtual elements.}
#' \item {\bold{ label }} {`React.ReactNode` \cr Label to display above the control. May be a string or React virtual elements.}
#' \item {\bold{ onRenderProgress }} {`IRenderFunction<IProgressIndicatorProps>` \cr A render override for the progress track.}
#' \item {\bold{ percentComplete }} {`number` \cr Percentage of the operation's completeness, numerically between 0 and 1. If this is not set, the indeterminate progress animation will be shown instead.}
#' \item {\bold{ progressHidden }} {`boolean` \cr Whether or not to hide the progress state.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IProgressIndicatorStyleProps, IProgressIndicatorStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ title }} {`string` \cr Deprecated at v0.43.0, to be removed at \>= v0.53.0. Use `label` instead.}
#' }
#'
#' @md
#' @name ProgressIndicator
NULL

#' Rating
#'
#' @description
#' Ratings show people’s opinions of a product, helping others make more informed purchasing decisions. People can also rate products they’ve purchased.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Rating).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Make it clear which item the rating pertains to by making sure the layout and grouping are clear when several items are on the page.
#' - Don't use the rating component for data that has a continuous range, such as the brightness of a photo. Instead, use a slider.
#'
#' ### Content
#'
#' - Use a five-star rating system.
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ allowZeroStars }} {`boolean` \cr Allow the rating value to be set to 0 instead of a minimum of 1.}
#' \item {\bold{ ariaLabelFormat }} {`string` \cr Optional label format for a rating star that will be read by screen readers. Can be used like "\{0\} of \{1\} stars selected", where \{0\} will be substituted by the current rating and \{1\} will be substituted by the max rating.}
#' \item {\bold{ ariaLabelId }} {`string` \cr Deprecated: Optional id of label describing this instance of Rating.}
#' \item {\bold{ componentRef }} {`IRefObject<IRating>` \cr Optional callback to access the IRating interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ getAriaLabel }} {`(rating: number, max: number) => string` \cr }
#' \item {\bold{ icon }} {`string` \cr Custom icon}
#' \item {\bold{ max }} {`number` \cr Maximum rating, defaults to 5, has to be \>= min}
#' \item {\bold{ min }} {`number` \cr Minimum rating, defaults to 1, has to be \>= 0}
#' \item {\bold{ onChange }} {`(event: React.FocusEvent<HTMLElement>, rating?: number) => void` \cr Callback issued when the rating changes.}
#' \item {\bold{ onChanged }} {`(rating: number) => void` \cr }
#' \item {\bold{ rating }} {`number` \cr Selected rating, has to be an integer between min and max}
#' \item {\bold{ readOnly }} {`boolean` \cr Optional flag to mark rating control as readOnly}
#' \item {\bold{ size }} {`RatingSize` \cr Size of rating, defaults to small}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IRatingStyleProps, IRatingStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' \item {\bold{ unselectedIcon }} {`string` \cr Custom icon for unselected rating elements.}
#' }
#'
#' @md
#' @name Rating
NULL

#' ResizeGroup
#'
#' @description
#' ResizeGroup is a React component that can be used to help fit the right amount of content within a container. The consumer of the ResizeGroup provides some initial data, a reduce function, and a render function. The render function is responsible for populating the contents of a the container when given some data. The initial data should represent the data that should be rendered when the ResizeGroup has infinite width. If the contents returned by the render function do not fit within the ResizeGroup, the reduce function is called to get a version of the data whose rendered width should be smaller than the data that was just rendered.
#'
#' An example scenario is shown below, where controls that do not fit on screen are rendered in an overflow menu. The data in this situation is a list of 'primary' controls that are rendered on the top level and a set of overflow controls rendered in the overflow menu. The initial data in this case has all the controls in the primary set. The implementation of onReduceData moves a control from the overflow well into the primary control set.
#'
#' This component queries the DOM for the dimensions of elements. Too many of these dimension queries will negatively affect the performance of the component and could cause poor interactive performance on websites. One way to reduce the number of measurements performed by the component is to provide a cacheKey in the initial data and in the return value of onReduceData. Two data objects with the same cacheKey are assumed to have the same width, resulting in measurements being skipped for that data object. In the controls with an overflow example, the cacheKey is simply the concatenation of the keys of the controls that appear in the top level.
#'
#' There is a boolean context property (isMeasured) added to let child components know if they are only being used for measurement purposes. When isMeasured is true, it will signify that the component is not the instance visible to the user. This will not be needed for most scenarios. It is intended to be used to to skip unwanted side effects of mounting a child component more than once. This includes cases where the component makes API requests, requests focus to one of its elements, expensive computations, and/or renders markup unrelated to its size. Be careful not to use this property to change the components rendered output in a way that effects it size in any way.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ResizeGroup).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the Component}
#' \item {\bold{ componentRef }} {`IRefObject<IResizeGroup>` \cr Optional callback to access the IResizeGroup interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ data }} {`any` \cr Initial data to be passed to the `onRenderData` function. When there is no `onGrowData` provided, this data should represent what should be passed to the render function when the parent container of the ResizeGroup is at its maximum supported width. A `cacheKey` property may optionally be included as part of the data. Two data objects with the same `cacheKey` will be assumed to take up the same width and will prevent measurements. The type of `cacheKey` is a string.}
#' \item {\bold{ dataDidRender }} {`(renderedData: any) => void` \cr Function to be called every time data is rendered. It provides the data that was actually rendered. A use case would be adding telemetry when a particular control is shown in an overflow well or dropped as a result of onReduceData or to count the number of renders that an implementation of onReduceData triggers.}
#' \item {\bold{ direction }} {`ResizeGroupDirection` \cr Direction of this resize group, vertical or horizontal}
#' \item {\bold{ onGrowData }} {`(prevData: any) => any` \cr Function to be performed on the data in order to increase its width. It is called in scenarios where the container has more room than the previous render and we may be able to fit more content. If there are no more scaling operations to perform on teh data, it should return undefined to prevent an infinite render loop.}
#' \item {\bold{ onReduceData }} {`(prevData: any) => any` \cr Function to be performed on the data in order to reduce its width and make it fit into the given space. If there are no more scaling steps to apply, it should return undefined to prevent an infinite render loop.}
#' \item {\bold{ onRenderData }} {`(data: any) => JSX.Element` \cr Function to render the data. Called when rendering the contents to the screen and when rendering in a hidden div to measure the size of the contents.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IResizeGroupStyleProps, IResizeGroupStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name ResizeGroup
NULL

#' ScrollablePane
#'
#' @description
#' A scrollable pane (`ScrollablePane`) is a helper component that's used with the `Sticky` component. It will "stick" to the top or bottom of the scrollable region and remain visible.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ScrollablePane).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use the sticky component on block-level elements.
#' - Sticky components should ideally be section headers and/or footers.
#' - Use `position: absolute`. Ensure that the parent element has an explicit `height` and `position: relative`, or has space already allocated for the scrollable pane.
#' - Ensure that the total height of `Sticky` components does not exceed the height of the `ScrollablePane`.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ className }} {`string` \cr Additional css class to apply to the ScrollablePane}
#' \item {\bold{ componentRef }} {`IRefObject<IScrollablePane>` \cr Optional callback to access the IScrollablePane interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ initialScrollPosition }} {`number` \cr Sets the initial scroll position of the ScrollablePane}
#' \item {\bold{ scrollbarVisibility }} {`ScrollbarVisibility` \cr }
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IScrollablePaneStyleProps, IScrollablePaneStyles>` \cr Call to provide customized styling that will layer on top of the variant rules}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name ScrollablePane
NULL

#' SearchBox
#'
#' @description
#' A search box (`SearchBox`) provides an input field for searching content within a site or app to find specific items.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SearchBox).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Don't build a custom search control based on the default text box or any other control.
#' - Use a search box without a parent container when it's not restricted to a certain width to accommodate other content. This search box will span the entire width of the space it's in.
#'
#' ### Content
#'
#' - Use placeholder text in the search box to describe what people can search for. For example, "Search", "Search files", or "Search contacts list".
#' - Although search entry points tend to be similarly visualized, they can provide access to results that range from broad to narrow. By effectively communicating the scope of a search, you can ensure that people's expectations are met by the capabilities of the search you're performing, which will reduce the possibility of frustration. The search entry point should be placed near the content being searched.<br/><br/>Some common search scopes include:
#'   - **Global**: Search across multiple sources of cloud and local content. Varied results include URLs, documents, media, actions, apps, and more.
#'   - **Web**: Search a web index. Results include pages, entities, and answers.
#'   - **My stuff**: Search across devices, cloud, social graphs, and more. Results are varied but are constrained by the connection to user accounts.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr The aria label of the SearchBox for the benefit of screen readers.}
#' \item {\bold{ className }} {`string` \cr CSS class to apply to the SearchBox.}
#' \item {\bold{ clearButtonProps }} {`IButtonProps` \cr The props for the clear button.}
#' \item {\bold{ componentRef }} {`IRefObject<ISearchBox>` \cr Optional callback to access the ISearchBox interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultValue }} {`string` \cr The default value of the text in the SearchBox, in the case of an uncontrolled component. This prop is being deprecated since so far, uncontrolled behavior has not been implemented.}
#' \item {\bold{ disableAnimation }} {`boolean` \cr Whether or not to animate the SearchBox icon on focus.}
#' \item {\bold{ iconProps }} {`Pick<IIconProps, Exclude<keyof IIconProps, 'className'>>` \cr The props for the icon.}
#' \item {\bold{ labelText }} {`string` \cr Deprecated. Use `placeholder` instead.}
#' \item {\bold{ onChange }} {`(event?: React.ChangeEvent<HTMLInputElement>, newValue?: string) => void` \cr Callback function for when the typed input for the SearchBox has changed.}
#' \item {\bold{ onChanged }} {`(newValue: any) => void` \cr Deprecated at v0.52.2, use `onChange` instead.}
#' \item {\bold{ onClear }} {`(ev?: any) => void` \cr Callback executed when the user clears the search box by either clicking 'X' or hitting escape.}
#' \item {\bold{ onEscape }} {`(ev?: any) => void` \cr Callback executed when the user presses escape in the search box.}
#' \item {\bold{ onSearch }} {`(newValue: any) => void` \cr Callback executed when the user presses enter in the search box.}
#' \item {\bold{ placeholder }} {`string` \cr Placeholder for the search box.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISearchBoxStyleProps, ISearchBoxStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' \item {\bold{ underlined }} {`boolean` \cr Whether or not the SearchBox is underlined.}
#' \item {\bold{ value }} {`string` \cr The value of the text in the SearchBox.}
#' }
#'
#' @md
#' @name SearchBox
NULL

#' Separator
#'
#' @description
#' A separator visually separates content into groups.
#'
#' You can render content in the separator by specifying the component's children.
#' The component's children can be plain text or a component like Icon.
#' The content is center-aligned by default.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Separator).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ alignContent }} {`'start' | 'center' | 'end'` \cr Where the content should be aligned in the separator.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISeparatorStyleProps, ISeparatorStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' \item {\bold{ vertical }} {`boolean` \cr Whether the element is a vertical separator.}
#' }
#'
#' @md
#' @name Separator
NULL

#' Shimmer
#'
#' @description
#' Shimmer is a temporary animation placeholder for when a service call takes time to return data and we don't want to block rendering the rest of the UI.
#'
#' If a smooth transition from Shimmer to content is desired, wrap the content node with a Shimmer element and use the `isDataLoaded` prop to trigger the transition. In cases where the content node is not wrapped in a Shimmer, use the `shimmerElements` or `customElementsGroup` props, and once data arrives, manually replace the Shimmer UI with the intended content. See the examples below for reference.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Shimmer).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ borderStyle }} {`IRawStyle` \cr Use to set custom styling of the shimmerCircle borders.}
#' \item {\bold{ componentRef }} {`IRefObject<IShimmerCircle>` \cr Optional callback to access the IShimmerCircle interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ height }} {`number` \cr Sets the height of the circle.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmerCircleStyleProps, IShimmerCircleStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ backgroundColor }} {`string` \cr Defines the background color of the space in between and around shimmer elements.}
#' \item {\bold{ componentRef }} {`IRefObject<IShimmerElementsGroup>` \cr Optional callback to access the IShimmerElementsGroup interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ flexWrap }} {`boolean` \cr Optional boolean for enabling flexWrap of the container containing the shimmerElements.}
#' \item {\bold{ rowHeight }} {`number` \cr Optional maximum row height of the shimmerElements container.}
#' \item {\bold{ shimmerElements }} {`IShimmerElement[]` \cr Elements to render in one group of the Shimmer.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmerElementsGroupStyleProps, IShimmerElementsGroupStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ width }} {`string` \cr Optional width for ShimmerElements container.}
#' \item {\bold{ borderStyle }} {`IRawStyle` \cr Use to set custom styling of the shimmerGap borders.}
#' \item {\bold{ componentRef }} {`IRefObject<IShimmerGap>` \cr Optional callback to access the IShimmerGap interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ height }} {`number` \cr Sets the height of the gap.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmerGapStyleProps, IShimmerGapStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ width }} {`number | string` \cr Sets width value of the gap.}
#' \item {\bold{ borderStyle }} {`IRawStyle` \cr Use to set custom styling of the shimmerLine borders.}
#' \item {\bold{ componentRef }} {`IRefObject<IShimmerLine>` \cr Optional callback to access the IShimmerLine interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ height }} {`number` \cr Sets the height of the rectangle.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmerLineStyleProps, IShimmerLineStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ width }} {`number | string` \cr Sets width value of the line.}
#' \item {\bold{ ariaLabel }} {`string` \cr Localized string of the status label for screen reader}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the Shimmer container.}
#' \item {\bold{ componentRef }} {`IRefObject<IShimmer>` \cr Optional callback to access the IShimmer interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ customElementsGroup }} {`React.ReactNode` \cr Custom elements when necessary to build complex placeholder skeletons.}
#' \item {\bold{ isDataLoaded }} {`boolean` \cr Controls when the shimmer is swapped with actual data through an animated transition.}
#' \item {\bold{ shimmerColors }} {`IShimmerColors` \cr Defines an object with possible colors to pass for Shimmer customization used on different backgrounds.}
#' \item {\bold{ shimmerElements }} {`IShimmerElement[]` \cr Elements to render in one line of the Shimmer.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IShimmerStyleProps, IShimmerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ width }} {`number | string` \cr Sets the width value of the shimmer wave wrapper.}
#' }
#'
#' @md
#' @name Shimmer
NULL

#' Slider
#'
#' @description
#' A slider provides a visual indication of adjustable content, as well as the current setting in the total range of content. Use a slider when you want people to set defined values (such as volume or brightness), or when people would benefit from instant feedback on the effect of setting changes.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Slider).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Don't use a slider for binary settings.
#' - Don't use a continuous slider if the range of values is large.
#' - Don't use for a range with fewer than three values.
#' - Sliders are typically horizontal but can be vertical, when needed.
#'
#' ### Content
#'
#' - Include a label indicating what value the slider changes.
#' - Use step points if you don't want the slider to allow arbitrary values between minimum and maximum.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr A description of the Slider for the benefit of screen readers.}
#' \item {\bold{ ariaValueText }} {`(value: number) => string` \cr A text description of the Slider number value for the benefit of screen readers. This should be used when the Slider number value is not accurately represented by a number.}
#' \item {\bold{ buttonProps }} {`React.HTMLAttributes<HTMLButtonElement>` \cr Optional mixin for additional props on the thumb button within the slider.}
#' \item {\bold{ className }} {`string` \cr Optional className to attach to the slider root element.}
#' \item {\bold{ componentRef }} {`IRefObject<ISlider>` \cr Optional callback to access the ISlider interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultValue }} {`number` \cr The initial value of the Slider. Use this if you intend for the Slider to be an uncontrolled component. This value is mutually exclusive to value. Use one or the other.}
#' \item {\bold{ disabled }} {`boolean` \cr Optional flag to render the Slider as disabled.}
#' \item {\bold{ label }} {`string` \cr Description label of the Slider}
#' \item {\bold{ max }} {`number` \cr The max value of the Slider}
#' \item {\bold{ min }} {`number` \cr The min value of the Slider}
#' \item {\bold{ onChange }} {`(value: number) => void` \cr Callback when the value has been changed}
#' \item {\bold{ onChanged }} {`(event: MouseEvent | TouchEvent | KeyboardEvent, value: number) => void` \cr Callback on mouse up or touch end}
#' \item {\bold{ originFromZero }} {`boolean` \cr Optional flag to attach the origin of slider to zero. Helpful when the range include negatives.}
#' \item {\bold{ showValue }} {`boolean` \cr Whether to show the value on the right of the Slider.}
#' \item {\bold{ snapToStep }} {`boolean` \cr Optional flag to decide that thumb will snap to closest value while moving the slider}
#' \item {\bold{ step }} {`number` \cr The difference between the two adjacent values of the Slider}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISliderStyleProps, ISliderStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' \item {\bold{ value }} {`number` \cr The initial value of the Slider. Use this if you intend to pass in a new value as a result of onChange events. This value is mutually exclusive to defaultValue. Use one or the other.}
#' \item {\bold{ valueFormat }} {`(value: number) => string` \cr Optional function to format the slider value.}
#' \item {\bold{ vertical }} {`boolean` \cr Optional flag to render the slider vertically. Defaults to rendering horizontal.}
#' }
#'
#' @md
#' @name Slider
NULL

#' SpinButton
#'
#' @description
#' A spin button (`SpinButton`) allows someone to incrementally adjust a value in small steps. It’s mainly used for numeric values, but other values are supported too.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SpinButton).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a spin button when you need to incrementally change a value.
#' - Use a spin button when values are tied to a unit of measure.
#' - Don't use a spin button for binary settings.
#' - Don't use a spin button for a range of three values or less.
#' - Place labels to the left of the spin button control. For example, "Length of ruler (cm)".
#' - Spin button width should adjust to fit the number values.
#'
#' ### Content
#'
#' - Include a label indicating what value the spin button changes.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaDescribedBy }} {`string` \cr ID of a label which describes the control, if not using the default label.}
#' \item {\bold{ ariaLabel }} {`string` \cr A description of the control for the benefit of screen reader users.}
#' \item {\bold{ ariaPositionInSet }} {`number` \cr The position in the parent set (if in a set).}
#' \item {\bold{ ariaSetSize }} {`number` \cr The total size of the parent set (if in a set).}
#' \item {\bold{ ariaValueNow }} {`number` \cr Sets the control's aria-valuenow. This is the numeric form of `value`. Providing this only makes sense when using as a controlled component.}
#' \item {\bold{ ariaValueText }} {`string` \cr }
#' \item {\bold{ className }} {`string` \cr Custom className for the control.}
#' \item {\bold{ componentRef }} {`IRefObject<ISpinButton>` \cr Gets the component ref.}
#' \item {\bold{ decrementButtonAriaLabel }} {`string` \cr Accessible label text for the decrement button (for screen reader users).}
#' \item {\bold{ decrementButtonIcon }} {`IIconProps` \cr Custom props for the decrement button.}
#' \item {\bold{ defaultValue }} {`string` \cr Initial value of the control. Updates to this prop will not be respected.
#'
#' Use this if you intend for the SpinButton to be an uncontrolled component which maintains its own value. Mutually exclusive with `value`.}
#' \item {\bold{ disabled }} {`boolean` \cr Whether or not the control is disabled.}
#' \item {\bold{ downArrowButtonStyles }} {`Partial<IButtonStyles>` \cr Custom styles for the down arrow button.
#'
#' Note: The buttons are in a checked state when arrow keys are used to incremenent/decrement the SpinButton. Use `rootChecked` instead of `rootPressed` for styling when that is the case.}
#' \item {\bold{ getClassNames }} {`(theme: ITheme, disabled: boolean, isFocused: boolean, keyboardSpinDirection: KeyboardSpinDirection, labelPosition?: Position, className?: string) => ISpinButtonClassNames` \cr Custom function for providing the classNames for the control. Can be used to provide all styles for the component instead of applying them on top of the default styles.}
#' \item {\bold{ iconButtonProps }} {`IButtonProps` \cr Additional props for the up and down arrow buttons.}
#' \item {\bold{ iconProps }} {`IIconProps` \cr Props for an icon to display alongside the control's label.}
#' \item {\bold{ incrementButtonAriaLabel }} {`string` \cr Accessible label text for the increment button (for screen reader users).}
#' \item {\bold{ incrementButtonIcon }} {`IIconProps` \cr Custom props for the increment button.}
#' \item {\bold{ inputProps }} {`React.InputHTMLAttributes<HTMLElement | HTMLInputElement>` \cr Additional props for the input field.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Keytip for the control.}
#' \item {\bold{ label }} {`string` \cr Descriptive label for the control.}
#' \item {\bold{ labelPosition }} {`Position` \cr Where to position the control's label.}
#' \item {\bold{ max }} {`number` \cr Max value of the control.}
#' \item {\bold{ min }} {`number` \cr Min value of the control.}
#' \item {\bold{ onBlur }} {`React.FocusEventHandler<HTMLInputElement>` \cr Callback for when the control loses focus.}
#' \item {\bold{ onDecrement }} {`(value: string, event?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>) => string | void` \cr Callback for when the decrement button or down arrow key is pressed.}
#' \item {\bold{ onFocus }} {`React.FocusEventHandler<HTMLInputElement>` \cr Callback for when the user focuses the control.}
#' \item {\bold{ onIncrement }} {`(value: string, event?: React.MouseEvent<HTMLElement> | React.KeyboardEvent<HTMLElement>) => string | void` \cr Callback for when the increment button or up arrow key is pressed.}
#' \item {\bold{ onValidate }} {`(value: string, event?: React.SyntheticEvent<HTMLElement>) => string | void` \cr Callback for when the entered value should be validated.}
#' \item {\bold{ precision }} {`number` \cr How many decimal places the value should be rounded to.
#'
#' The default is calculated based on the precision of `step`: i.e. if step = 1, precision = 0. step = 0.0089, precision = 4. step = 300, precision = 2. step = 23.00, precision = 2.}
#' \item {\bold{ step }} {`number` \cr Difference between two adjacent values of the control. This value is used to calculate the precision of the input if no `precision` is given. The precision calculated this way will always be \>= 0.}
#' \item {\bold{ styles }} {`Partial<ISpinButtonStyles>` \cr Custom styling for individual elements within the control.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' \item {\bold{ title }} {`string` \cr A more descriptive title for the control, visible on its tooltip.}
#' \item {\bold{ upArrowButtonStyles }} {`Partial<IButtonStyles>` \cr Custom styles for the up arrow button.
#'
#' Note: The buttons are in a checked state when arrow keys are used to incremenent/decrement the SpinButton. Use `rootChecked` instead of `rootPressed` for styling when that is the case.}
#' \item {\bold{ value }} {`string` \cr Current value of the control.
#'
#' Use this if you intend to pass in a new value as a result of change events. Mutually exclusive with `defaultValue`.}
#' }
#'
#' @md
#' @name SpinButton
NULL

#' Spinner
#'
#' @description
#' A Spinner is an outline of a circle which animates around itself indicating to the user that things are processing. A Spinner is shown when it's unsure how long a task will take making it the indeterminate version of a ProgressIndicator. They can be various sizes, located inline with content or centered. They generally appear after an action is being processed or committed. They are subtle and generally do not take up much space, but are transitions from the completed task.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Spinner).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr Alternative status label for screen reader}
#' \item {\bold{ ariaLive }} {`'assertive' | 'polite' | 'off'` \cr Politeness setting for label update announcement.}
#' \item {\bold{ className }} {`string` \cr Additional CSS class(es) to apply to the Spinner.}
#' \item {\bold{ componentRef }} {`IRefObject<ISpinner>` \cr Optional callback to access the ISpinner interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ label }} {`string` \cr The label to show next to the Spinner. Label updates will be announced to the screen readers. Use ariaLive to control politeness level.}
#' \item {\bold{ labelPosition }} {`SpinnerLabelPosition` \cr The position of the label in regards of the spinner animation.}
#' \item {\bold{ size }} {`SpinnerSize` \cr The size of Spinner to render. \{ extraSmall, small, medium, large \}}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISpinnerStyleProps, ISpinnerStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization.)}
#' \item {\bold{ type }} {`SpinnerType` \cr Deprecated and will be removed at \>= 2.0.0. Use `SpinnerSize` instead.}
#' }
#'
#' @md
#' @name Spinner
NULL

#' Stack
#'
#' @description
#' A `Stack` is a container-type component that abstracts the implementation of a flexbox in order to define the layout of its children components.
#'
#' ### Stack Properties
#'
#' Although the `Stack` component has a number of different properties, there are three in particular that define the overall layout that the component has:
#'
#' 1. Direction: Refers to whether the stacking of children components is horizontal or vertical. By default the `Stack` component is vertical, but can be turned horizontal by adding the `horizontal` property when using the component.
#' 2. Alignment: Refers to how the children components are aligned inside the container. This is controlled via the `verticalAlign` and `horizontalAlign` properties. One thing to notice here is that while flexbox containers align always across the cross axis, `Stack` aims to remove the mental strain involved in this process by making the `verticalAlign` and `horizontalAlign` properties always follow the vertical and horizontal axes, respectively, regardless of the direction of the `Stack`.
#' 3. Spacing: Refers to the space that exists between children components inside the `Stack`. This is controlled via the `gap` and `verticalGap` properties.
#'
#' ## Stack Items
#'
#' The `Stack` component provides an abstraction of a flexbox container but there are some flexbox related properties that are applied on specific children of the flexbox instead of being applied on the container. This is where `Stack Items` comes into play.
#'
#' A `Stack Item` abstracts those properties that are or can be specifically applied on flexbox's children, like `grow` and `shrink`.
#'
#' To use a `Stack Item` in an application, the `Stack` component should be imported and `Stack.Item` should be used inside of a `Stack`. This is done so that the existence of the `Stack Item` is inherently linked to the `Stack` component.
#'
#' ### Stack Wrapping
#'
#' Aside from the previously mentioned properties, there is another property called `wrap` that determines if items overflow the `Stack` container or wrap around it. The wrap property only works in the direction of the `Stack`, which means that the children components can still overflow in the perpendicular direction (i.e. in a `Vertical Stack`, items might overflow horizontally and vice versa).
#'
#' ### Stack Nesting
#'
#' `Stacks` can be nested inside one another in order to be able to configure the layout of the application as desired.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Stack).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ align }} {`'auto' | 'stretch' | 'baseline' | 'start' | 'center' | 'end'` \cr Defines how to align the StackItem along the x-axis (for vertical Stacks) or the y-axis (for horizontal Stacks).}
#' \item {\bold{ className }} {`string` \cr Defines a CSS class name used to style the StackItem.}
#' \item {\bold{ disableShrink }} {`boolean` \cr Defines whether the StackItem should be prevented from shrinking. This can be used to prevent a StackItem from shrinking when it is inside of a Stack that has shrinking items.}
#' \item {\bold{ grow }} {`boolean | number | 'inherit' | 'initial' | 'unset'` \cr Defines how much to grow the StackItem in proportion to its siblings.}
#' \item {\bold{ order }} {`number | string` \cr Defines order of the StackItem.}
#' \item {\bold{ shrink }} {`boolean | number | 'inherit' | 'initial' | 'unset'` \cr Defines at what ratio should the StackItem shrink to fit the available space.}
#' \item {\bold{ verticalFill }} {`boolean` \cr Defines whether the StackItem should take up 100% of the height of its parent.}
#' \item {\bold{ as }} {`React.ElementType<React.HTMLAttributes<HTMLElement>>` \cr Defines how to render the Stack.}
#' \item {\bold{ disableShrink }} {`boolean` \cr Defines whether Stack children should not shrink to fit the available space.}
#' \item {\bold{ gap }} {`number | string` \cr Defines the spacing between Stack children. The property is specified as a value for 'row gap', followed optionally by a value for 'column gap'. If 'column gap' is omitted, it's set to the same value as 'row gap'.}
#' \item {\bold{ grow }} {`boolean | number | 'inherit' | 'initial' | 'unset'` \cr Defines how much to grow the Stack in proportion to its siblings.}
#' \item {\bold{ horizontal }} {`boolean` \cr Defines whether to render Stack children horizontally.}
#' \item {\bold{ horizontalAlign }} {`Alignment` \cr Defines how to align Stack children horizontally (along the x-axis).}
#' \item {\bold{ maxHeight }} {`number | string` \cr Defines the maximum height that the Stack can take.}
#' \item {\bold{ maxWidth }} {`number | string` \cr Defines the maximum width that the Stack can take.}
#' \item {\bold{ padding }} {`number | string` \cr Defines the inner padding of the Stack.}
#' \item {\bold{ reversed }} {`boolean` \cr Defines whether to render Stack children in the opposite direction (bottom-to-top if it's a vertical Stack and right-to-left if it's a horizontal Stack).}
#' \item {\bold{ verticalAlign }} {`Alignment` \cr Defines how to align Stack children vertically (along the y-axis).}
#' \item {\bold{ verticalFill }} {`boolean` \cr Defines whether the Stack should take up 100% of the height of its parent. This property is required to be set to true when using the `grow` flag on children in vertical oriented Stacks. Stacks are rendered as block elements and grow horizontally to the container already.}
#' \item {\bold{ wrap }} {`boolean` \cr Defines whether Stack children should wrap onto multiple rows or columns when they are about to overflow the size of the Stack.}
#' }
#'
#' @md
#' @name Stack
NULL

#' SwatchColorPicker
#'
#' @description
#' A swatch color picker (`SwatchColorPicker`) displays color options as a grid. It can be shown by itself, with a header and dividers, or as a button that expands to show the swatch color picker.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/SwatchColorPicker).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a swatch color picker when there are multiple color options that can be grouped or collapsed under one title.
#' - Don’t use a swatch color picker when there’s a large number of color options. The best component for that is a color picker.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ color }} {`string` \cr The CSS-compatible string to describe the color}
#' \item {\bold{ id }} {`string` \cr Arbitrary unique string associated with this option}
#' \item {\bold{ index }} {`number` \cr Index for this option}
#' \item {\bold{ label }} {`string` \cr Tooltip and aria label for this item}
#' \item {\bold{ borderWidth }} {`number` \cr Width of the border that indicates a selected/hovered cell, in pixels.}
#' \item {\bold{ circle }} {`boolean` \cr True if this cell should be rendered as a circle, false if it should be a square.  @default `true` (render as circle)}
#' \item {\bold{ color }} {`string` \cr The CSS-compatible string to describe the color}
#' \item {\bold{ disabled }} {`boolean` \cr Whether this cell should be disabled  @default false}
#' \item {\bold{ height }} {`number` \cr Height of the cell, in pixels}
#' \item {\bold{ id }} {`string` \cr Used as a PREFIX for the cell's ID (the cell will not have this literal string as its ID).}
#' \item {\bold{ idPrefix }} {`string` \cr Prefix for this cell's ID. Will be required in a future version once `id` is removed.}
#' \item {\bold{ index }} {`number` \cr Index for this option}
#' \item {\bold{ item }} {`IColorCellProps` \cr Item to render}
#' \item {\bold{ label }} {`string` \cr Tooltip and aria label for this item}
#' \item {\bold{ onClick }} {`(item: IColorCellProps) => void` \cr Handler for when a color cell is clicked.}
#' \item {\bold{ onFocus }} {`(item: IColorCellProps) => void` \cr }
#' \item {\bold{ onHover }} {`(item?: IColorCellProps) => void` \cr }
#' \item {\bold{ onKeyDown }} {`(ev: React.KeyboardEvent<HTMLButtonElement>) => void` \cr }
#' \item {\bold{ onMouseEnter }} {`(ev: React.MouseEvent<HTMLButtonElement>) => boolean` \cr Mouse enter handler. Returns true if the event should be processed, false otherwise.}
#' \item {\bold{ onMouseLeave }} {`(ev: React.MouseEvent<HTMLButtonElement>) => void` \cr }
#' \item {\bold{ onMouseMove }} {`(ev: React.MouseEvent<HTMLButtonElement>) => boolean` \cr Mouse move handler. Returns true if the event should be processed, false otherwise.}
#' \item {\bold{ onWheel }} {`(ev: React.MouseEvent<HTMLButtonElement>) => void` \cr }
#' \item {\bold{ selected }} {`boolean` \cr Whether this cell is currently selected}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IColorPickerGridCellStyleProps, IColorPickerGridCellStyles>` \cr Custom styles for the component.}
#' \item {\bold{ theme }} {`ITheme` \cr The theme object to use for styling.}
#' \item {\bold{ width }} {`number` \cr Width of the cell, in pixels}
#' \item {\bold{ ariaPosInSet }} {`number` \cr Position this grid is in the parent set (index in a parent menu, for example)}
#' \item {\bold{ ariaSetSize }} {`number` \cr Size of the parent set (size of parent menu, for example)}
#' \item {\bold{ cellBorderWidth }} {`number` \cr Width of the border indicating a hovered/selected cell, in pixels}
#' \item {\bold{ cellHeight }} {`number` \cr Height of an individual cell, in pixels}
#' \item {\bold{ cellMargin }} {`number` \cr The distance between cells, in pixels}
#' \item {\bold{ cellShape }} {`'circle' | 'square'` \cr The shape of the color cells.  @default 'circle'}
#' \item {\bold{ cellWidth }} {`number` \cr Width of an individual cell, in pixels}
#' \item {\bold{ className }} {`string` \cr Additional class name to provide on the root element}
#' \item {\bold{ colorCells }} {`IColorCellProps[]` \cr The color cells that will be made available to the user.
#'
#' Note: When the reference to this prop changes, regardless of how many color cells change, all of the color cells will be re-rendered (potentially bad perf) because we memoize based on this prop's reference.}
#' \item {\bold{ columnCount }} {`number` \cr Number of columns for the swatch color picker}
#' \item {\bold{ disabled }} {`boolean` \cr Whether the control is disabled.}
#' \item {\bold{ doNotContainWithinFocusZone }} {`boolean` \cr If false (the default), the grid is contained inside a FocusZone. If true, a FocusZone is not used.  @default false}
#' \item {\bold{ focusOnHover }} {`boolean` \cr Whether to update focus when a cell is hovered.}
#' \item {\bold{ getColorGridCellStyles }} {`IStyleFunctionOrObject<IColorPickerGridCellStyleProps, IColorPickerGridCellStyles>` \cr Styles for the grid cells.}
#' \item {\bold{ id }} {`string` \cr ID for the swatch color picker's root element. Also used as a prefix for the IDs of color cells.}
#' \item {\bold{ isControlled }} {`boolean` \cr Indicates whether the SwatchColorPicker is fully controlled. When true, the component will not set its internal state to track the selected color. Instead, the parent component will be responsible for handling state in the callbacks like `onColorChanged`.
#'
#' NOTE: This property is a temporary workaround to force the component to be fully controllable without breaking existing behavior}
#' \item {\bold{ mouseLeaveParentSelector }} {`string | undefined` \cr Selector to focus on mouse leave. Should only be used in conjunction with `focusOnHover`.}
#' \item {\bold{ onCellFocused }} {`(id?: string, color?: string) => void` \cr Callback for when the user focuses a color cell. If `id` and `color` are unspecified, cells are no longer being focused.}
#' \item {\bold{ onCellHovered }} {`(id?: string, color?: string) => void` \cr Callback for when the user hovers over a color cell. If `id` and `color` are unspecified, cells are no longer being hovered.}
#' \item {\bold{ onColorChanged }} {`(id?: string, color?: string) => void` \cr Callback for when the user changes the color. If `id` and `color` are unspecified, there is no selected cell. (e.g. the user executed the currently selected cell to unselect it)}
#' \item {\bold{ positionInSet }} {`number` \cr }
#' \item {\bold{ selectedId }} {`string` \cr The ID of color cell that is currently selected}
#' \item {\bold{ setSize }} {`number` \cr }
#' \item {\bold{ shouldFocusCircularNavigate }} {`boolean` \cr Whether focus should cycle back to the beginning once the user navigates past the end (and vice versa). Only relevant if `doNotContainWithinFocusZone` is not true.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ISwatchColorPickerStyleProps, ISwatchColorPickerStyles>` \cr Styles for the component.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme to apply to the component.}
#' }
#'
#' @md
#' @name SwatchColorPicker
NULL

#' TeachingBubble
#'
#' @description
#' A teaching bubble (`TeachingBubble`) brings attention to a new or important feature, with the goal of increasing engagement with the feature. A teaching bubble typically follows a coach mark.
#'
#' Use teaching bubbles sparingly. Consider how frequently people will see it, and how many they’ll see across their entire experience.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/TeachingBubble).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Teaching bubbles can be used in sequence to walk people through complex, multistep interactions only. And only show one teaching bubble at a time.
#' - A maximum of no more than 3 sequenced teaching bubbles should be used in a single experience.
#' - Sequenced teaching bubbles should have “x of y” text to indicate progress through the sequence. For example, the first teaching bubble in a sequence might be “1 of 3”.)
#' - Always place the primary button on the left, the secondary button just to the right of it.
#' - Show only one primary button that inherits theme color at rest state. In the event there are more than two buttons with equal priority, all buttons should have neutral backgrounds.
#'
#' ### Content
#'
#' A teaching bubble should include:
#'
#' #### Title
#'
#' You have 25 characters (including spaces) to draw people in and get them interested. Limit to one line of text, and use sentence casing (capitalize only the first word and any proper nouns) with no punctuation.
#'
#' #### Body copy
#'
#' Lead with why the feature is useful rather than describe what it is. What does it make possible? Keep it within 120 characters (including spaces).
#'
#' #### Action buttons
#'
#' Limit button labels to 15 characters (including spaces). Provide people with an explicit action to dismiss the teaching bubble, such as “Got it”. Include a secondary button to give people the option to take action, such as “Show me” or “Edit settings”. When two buttons are needed, make the call-to-action button the primary button and the dismissal button (such as “No thanks”) the secondary button. Use sentence casing (capitalize only the first word and any proper nouns) with no punctuation. On a sequenced teaching bubble, use "Next" for the action button label and "Got it" for the final sequenced teaching bubble action button with text that closes the experience.
#'
#' #### Link (Optional)
#'
#' If there are additional steps people need to know about, or helpful information they may want to read, consider linking to a help article. Typically, these links are labeled “Learn more” with no punctuation at the end.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaDescribedBy }} {`string` \cr Defines the element id referencing the element containing the description for the TeachingBubble.}
#' \item {\bold{ ariaLabelledBy }} {`string` \cr Defines the element id referencing the element containing label text for TeachingBubble.}
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr Properties to pass through for Callout, reference detail properties in ICalloutProps}
#' \item {\bold{ componentRef }} {`IRefObject<ITeachingBubble>` \cr Optional callback to access the ITeachingBubble interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ focusTrapZoneProps }} {`IFocusTrapZoneProps` \cr Properties to pass through for FocusTrapZone, reference detail properties in IFocusTrapZoneProps}
#' \item {\bold{ footerContent }} {`string | JSX.Element` \cr Text that will be rendered in the footer of the TeachingBubble. May be rendered alongside primary and secondary buttons.}
#' \item {\bold{ hasCloseButton }} {`boolean` \cr Whether the TeachingBubble renders close button in the top right corner.}
#' \item {\bold{ hasCloseIcon }} {`boolean` \cr }
#' \item {\bold{ hasCondensedHeadline }} {`boolean` \cr A variation with smaller bold headline and no margins.}
#' \item {\bold{ hasSmallHeadline }} {`boolean` \cr A variation with smaller bold headline and margins to the body. (`hasCondensedHeadline` takes precedence if it is also set to true.)}
#' \item {\bold{ headline }} {`string` \cr A headline for the Teaching Bubble.}
#' \item {\bold{ illustrationImage }} {`IImageProps` \cr An Image for the TeachingBubble.}
#' \item {\bold{ isWide }} {`boolean` \cr Whether or not the TeachingBubble is wide, with image on the left side.}
#' \item {\bold{ onDismiss }} {`(ev?: any) => void` \cr Callback when the TeachingBubble tries to close.}
#' \item {\bold{ primaryButtonProps }} {`IButtonProps` \cr The Primary interaction button}
#' \item {\bold{ secondaryButtonProps }} {`IButtonProps` \cr The Secondary interaction button}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ITeachingBubbleStyleProps, ITeachingBubbleStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ target }} {`Target` \cr Element, MouseEvent, Point, or querySelector string that the TeachingBubble should anchor to.}
#' \item {\bold{ targetElement }} {`HTMLElement` \cr }
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by High-Order Component.}
#' }
#'
#' @md
#' @name TeachingBubble
NULL

#' Text
#'
#' @description
#' Text is a component for displaying text. You can use Text to standardize text across your web app.
#'
#' You can specify the `variant` prop to apply font styles to Text. This variant pulls from the Fluent UI React theme loaded on the page. If you do not specify the `variant` prop, by default, Text applies the styling from specifying the `variant` value to `medium`.
#'
#' The Text control is inline wrap by default. You can specify `block` to enable block and `nowrap` to enable `nowrap`. For ellipsis on overflow to work properly, `block` and `nowrap` should be manually set to `true`.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Text).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ as }} {`React.ElementType<React.HTMLAttributes<HTMLElement>>` \cr Optionally render the component as another component type or primitive.}
#' \item {\bold{ block }} {`boolean` \cr Whether the text is displayed as a block element.
#'
#' Note that in order for ellipsis on overflow to work properly, `block` and `nowrap` should be set to true.}
#' \item {\bold{ nowrap }} {`boolean` \cr Whether the text is not wrapped.
#'
#' Note that in order for ellipsis on overflow to work properly, `block` and `nowrap` should be set to true.}
#' \item {\bold{ variant }} {`keyof IFontStyles` \cr Optional font type for Text.}
#' }
#'
#' @md
#' @name Text
NULL

#' TextField
#'
#' @description
#' Text fields (`TextField`) give people a way to enter and edit text. They’re used in forms, modal dialogs, tables, and other surfaces where text input is required.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/TextField).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a multiline text field when long entries are expected.
#' - Don't place a text field in the middle of a sentence, because the sentence structure might not make sense in all languages. For example, "Remind me in `[textfield]` weeks" should instead read, "Remind me in this many weeks: `[textfield]`".
#' - Format the text field for the expected entry. For example, when someone needs to enter a phone number, use an input mask to indicate that three sets of digits should be entered.
#'
#' ### Content
#'
#' - Include a short label above the text field to communicate what information should be entered. Don't use placeholder text instead of a label. Placeholder text poses a variety of accessibility issues (including possible problems with color/contrast, and people thinking the form input is already filled out).
#' - When part of a form, make it clear which fields are required vs. optional. If the input is required, add "(required)" to the label. Don't exclusively use "\*" to indicate required inputs as it is often not read by screen readers. For example, "First name (required)".
#' - Use sentence-style capitalization—only capitalize the first word. For more info, see [Capitalization](https://docs.microsoft.com/style-guide/capitalization) in the Microsoft Writing Style Guide.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr Aria label for the text field.}
#' \item {\bold{ autoAdjustHeight }} {`boolean` \cr For multiline text fields, whether or not to auto adjust text field height.}
#' \item {\bold{ autoComplete }} {`string` \cr Whether the input field should have autocomplete enabled. This tells the browser to display options based on earlier typed values. Common values are 'on' and 'off' but for all possible values see the following links: https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/autocomplete#Values https://html.spec.whatwg.org/multipage/form-control-infrastructure.html#autofill}
#' \item {\bold{ borderless }} {`boolean` \cr Whether or not the text field is borderless.}
#' \item {\bold{ className }} {`string` \cr Optional class name that is added to the container of the component.}
#' \item {\bold{ componentRef }} {`IRefObject<ITextField>` \cr Optional callback to access the ITextField component. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultValue }} {`string` \cr Default value of the text field. Only provide this if the text field is an uncontrolled component; otherwise, use the `value` property.}
#' \item {\bold{ deferredValidationTime }} {`number` \cr Text field will start to validate after users stop typing for `deferredValidationTime` milliseconds. Updates to this prop will not be respected.}
#' \item {\bold{ description }} {`string` \cr Description displayed below the text field to provide additional details about what text to enter.}
#' \item {\bold{ disabled }} {`boolean` \cr Disabled state of the text field.}
#' \item {\bold{ errorMessage }} {`string | JSX.Element` \cr Static error message displayed below the text field. Use `onGetErrorMessage` to dynamically change the error message displayed (if any) based on the current value. `errorMessage` and `onGetErrorMessage` are mutually exclusive (`errorMessage` takes precedence).}
#' \item {\bold{ iconProps }} {`IIconProps` \cr Props for an optional icon, displayed in the far right end of the text field.}
#' \item {\bold{ inputClassName }} {`string` \cr Optional class name that is added specifically to the input/textarea element.}
#' \item {\bold{ label }} {`string` \cr Label displayed above the text field (and read by screen readers).}
#' \item {\bold{ mask }} {`string` \cr Only used by MaskedTextField: The masking string that defines the mask's behavior. A backslash will escape any character. Special format characters are: '9': `[0-9]` 'a': `[a-zA-Z]` '*': `[a-zA-Z0-9]`}
#' \item {\bold{ maskChar }} {`string` \cr Only used by MaskedTextField: The character to show in place of unfilled characters of the mask.}
#' \item {\bold{ maskFormat }} {`{ [key: string]: RegExp; }` \cr Only used by MaskedTextField: An object defining the format characters and corresponding regexp values. Default format characters: \{ '9': /`[0-9]`/, 'a': /`[a-zA-Z]`/, '*': /`[a-zA-Z0-9]`/ \}}
#' \item {\bold{ multiline }} {`boolean` \cr Whether or not the text field is a multiline text field.}
#' \item {\bold{ onChange }} {`(event: React.FormEvent<HTMLInputElement | HTMLTextAreaElement>, newValue?: string) => void` \cr Callback for when the input value changes. This is called on both `input` and `change` events. (In a later version, this will probably only be called for the `change` event.)}
#' \item {\bold{ onGetErrorMessage }} {`(value: string) => string | JSX.Element | PromiseLike<string | JSX.Element> | undefined` \cr Function used to determine whether the input value is valid and get an error message if not. Mutually exclusive with the static string `errorMessage` (it will take precedence over this).
#'
#' When it returns `string | JSX.Element`: - If valid, it returns empty string. - If invalid, it returns the error message and the text field will show a red border and show an error message below the text field.
#'
#' When it returns `Promise<string | JSX.Element>`: - The resolved value is displayed as the error message. - If rejected, the value is thrown away.}
#' \item {\bold{ onNotifyValidationResult }} {`(errorMessage: string | JSX.Element, value: string | undefined) => void` \cr Function called after validation completes.}
#' \item {\bold{ onRenderDescription }} {`IRenderFunction<ITextFieldProps>` \cr Custom renderer for the description.}
#' \item {\bold{ onRenderLabel }} {`IRenderFunction<ITextFieldProps>` \cr Custom renderer for the label. If you don't call defaultRender, ensure that you give your custom-rendered label an id and that you set the textfield's aria-labelledby prop to that id.}
#' \item {\bold{ onRenderPrefix }} {`IRenderFunction<ITextFieldProps>` \cr Custom render function for prefix.}
#' \item {\bold{ onRenderSuffix }} {`IRenderFunction<ITextFieldProps>` \cr Custom render function for suffix.}
#' \item {\bold{ prefix }} {`string` \cr Prefix displayed before the text field contents. This is not included in the value. Ensure a descriptive label is present to assist screen readers, as the value does not include the prefix.}
#' \item {\bold{ readOnly }} {`boolean` \cr If true, the text field is readonly.}
#' \item {\bold{ resizable }} {`boolean` \cr For multiline text fields, whether or not the field is resizable.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ITextFieldStyleProps, ITextFieldStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ suffix }} {`string` \cr Suffix displayed after the text field contents. This is not included in the value. Ensure a descriptive label is present to assist screen readers, as the value does not include the suffix.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme (provided through customization).}
#' \item {\bold{ underlined }} {`boolean` \cr Whether or not the text field is underlined.}
#' \item {\bold{ validateOnFocusIn }} {`boolean` \cr Run validation when focus moves into the input, and **do not** validate on change.
#'
#' (Unless this prop and/or `validateOnFocusOut` is set to true, validation will run on every change.)}
#' \item {\bold{ validateOnFocusOut }} {`boolean` \cr Run validation when focus moves out of the input, and **do not** validate on change.
#'
#' (Unless this prop and/or `validateOnFocusIn` is set to true, validation will run on every change.)}
#' \item {\bold{ validateOnLoad }} {`boolean` \cr Whether validation should run when the input is initially rendered.}
#' \item {\bold{ value }} {`string` \cr Current value of the text field. Only provide this if the text field is a controlled component where you are maintaining its current state; otherwise, use the `defaultValue` property.}
#' }
#'
#' @md
#' @name TextField
NULL

#' Toggle
#'
#' @description
#' A toggle represents a physical switch that allows someone to choose between two mutually exclusive options.  For example, “On/Off”, “Show/Hide”. Choosing an option should produce an immediate result.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Toggle).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - When people need to perform extra steps for changes to take effect, use a check box instead. For example, if they must click a "Submit", "Next", or "OK" button to apply changes, use a check box.
#'
#' ### Content
#'
#' - Only replace the On/Off labels if there are more specific labels for the setting. For example, you might use Show/Hide if the setting is "Show images".
#' - Keep descriptive text short and concise—two to four words; preferably nouns. For example, "Focused inbox" or "WiFi".
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ ariaLabel }} {`string` \cr Text for screen-reader to announce as the name of the toggle.}
#' \item {\bold{ as }} {`IComponentAs<React.HTMLAttributes<HTMLElement>>` \cr Render the root element as another type.}
#' \item {\bold{ checked }} {`boolean` \cr Checked state of the toggle. If you are maintaining state yourself, use this property. Otherwise use `defaultChecked`.}
#' \item {\bold{ componentRef }} {`IRefObject<IToggle>` \cr Optional callback to access the IToggle interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ defaultChecked }} {`boolean` \cr Initial state of the toggle. If you want the toggle to maintain its own state, use this. Otherwise use `checked`.}
#' \item {\bold{ disabled }} {`boolean` \cr Optional disabled flag.}
#' \item {\bold{ inlineLabel }} {`boolean` \cr Whether the label (not the onText/offText) should be positioned inline with the toggle control. Left (right in RTL) side when on/off text provided VS right (left in RTL) side when no on/off text. Caution: when not providing on/off text user may get confused in differentiating the on/off states of the toggle.}
#' \item {\bold{ keytipProps }} {`IKeytipProps` \cr Optional keytip for this toggle}
#' \item {\bold{ label }} {`string | JSX.Element` \cr A label for the toggle.}
#' \item {\bold{ offAriaLabel }} {`string` \cr }
#' \item {\bold{ offText }} {`string` \cr Text to display when toggle is OFF. Caution: when not providing on/off text user may get confused in differentiating the on/off states of the toggle.}
#' \item {\bold{ onAriaLabel }} {`string` \cr }
#' \item {\bold{ onChange }} {`(event: React.MouseEvent<HTMLElement>, checked?: boolean) => void` \cr Callback issued when the value changes.}
#' \item {\bold{ onChanged }} {`(checked: boolean) => void` \cr }
#' \item {\bold{ onText }} {`string` \cr Text to display when toggle is ON. Caution: when not providing on/off text user may get confused in differentiating the on/off states of the toggle.}
#' \item {\bold{ role }} {`'checkbox' | 'switch' | 'menuitemcheckbox'` \cr (Optional) Specify whether to use the "switch" role (ARIA 1.1) or the checkbox role (ARIA 1.0). If unspecified, defaults to "switch".}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<IToggleStyleProps, IToggleStyles>` \cr Optional styles for the component.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by HOC.}
#' }
#'
#' @md
#' @name Toggle
NULL

#' Tooltip
#'
#' @description
#' A good tooltip briefly describes unlabeled controls or provides a bit of additional information about labeled controls, when this is useful. It can also help customers navigate the UI by offering additional—not redundant—information about control labels, icons, and links. A tooltip should always add valuable information; use sparingly.
#'
#' There are two components you can use to display a tooltip:
#'
#' - **Tooltip:** A styled tooltip that you can display on a chosen target.
#' - **TooltipHost:** A wrapper that automatically shows a tooltip when the wrapped element is hovered or focused.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Tooltip).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Content
#'
#' - Don’t use a tooltip to restate a button name that’s already shown in the UI.
#' - When a control or UI element is unlabeled, use a simple, descriptive noun phrase. For example: “Highlighting pen”. Only capitalize the first word (unless a subsequent word is a proper noun), and don’t use a period.
#' - For a disabled control that could use an explanation, provide a brief description of the state in which the control will be enabled. For example: “This feature is available for line charts.”
#' - Only use periods for complete sentences.
#'
#' For a UI label that needs some explanation:
#'
#' - Briefly describe what you can do with the UI element.
#' - Use the imperative verb form. For example, "Find text in this file" (not "Finds text in this file").
#' - Don't include end punctuation unless there is at least one complete sentence.
#'
#' For a truncated label or a label that’s likely to truncate in some languages:
#'
#' - Provide the untruncated label in the tooltip.
#' - Don't provide a tooltip if the untruncated info is provided elsewhere on the page or flow.
#' - Optional: On another line, provide a clarifying description, but only if needed.
#'
#' @details
#'
#' \itemize{
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr Additional properties to pass through for Callout.}
#' \item {\bold{ className }} {`string` \cr Class name to apply to the *tooltip itself*, not the host. To apply a class to the host, use `hostClassName` or `styles.root`.}
#' \item {\bold{ closeDelay }} {`number` \cr Number of milliseconds to delay closing the tooltip, so that the user has time to hover over the tooltip and interact with it. Hovering over the tooltip will count as hovering over the host, so that the tooltip will stay open if the user is actively interacting with it.}
#' \item {\bold{ componentRef }} {`IRefObject<ITooltipHost>` \cr Optional callback to access the ITooltipHost interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ content }} {`string | JSX.Element | JSX.Element[]` \cr Content to display in the Tooltip.}
#' \item {\bold{ delay }} {`TooltipDelay` \cr Length of delay before showing the tooltip on hover.}
#' \item {\bold{ directionalHint }} {`DirectionalHint` \cr How the tooltip should be anchored to its `targetElement`.}
#' \item {\bold{ directionalHintForRTL }} {`DirectionalHint` \cr How the element should be positioned in RTL layouts. If not specified, a mirror of `directionalHint` will be used.}
#' \item {\bold{ hostClassName }} {`string` \cr Class name to apply to tooltip host.}
#' \item {\bold{ id }} {`string` \cr Optional ID to pass through to the tooltip (not used on the host itself). Auto-generated if not provided.}
#' \item {\bold{ onTooltipToggle }} {`onTooltipToggle?(isTooltipVisible: boolean): void;` \cr Notifies when tooltip becomes visible or hidden, whatever the trigger was.}
#' \item {\bold{ overflowMode }} {`TooltipOverflowMode` \cr If this is unset (the default), the tooltip is always shown even if there's no overflow.
#'
#' If set, only show the tooltip if the specified element (`Self` or `Parent`) has overflow. When set to `Parent`, the parent element is also used as the tooltip's target element.
#'
#' Note that even with `Self` mode, the TooltipHost *does not* check whether any children have overflow.}
#' \item {\bold{ setAriaDescribedBy }} {`boolean` \cr Whether or not to mark the TooltipHost root element as described by the tooltip. If not specified, the caller should pass an `id` to the TooltipHost (to be passed through to the Tooltip) and mark the appropriate element as `aria-describedby` the `id`.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ITooltipHostStyleProps, ITooltipHostStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher-order component.}
#' \item {\bold{ tooltipProps }} {`ITooltipProps` \cr Additional properties to pass through for Tooltip.}
#' \item {\bold{ calloutProps }} {`ICalloutProps` \cr Properties to pass through for Callout.}
#' \item {\bold{ componentRef }} {`IRefObject<ITooltip>` \cr Optional callback to access the ITooltip interface. Use this instead of ref for accessing the public methods and properties of the component.}
#' \item {\bold{ content }} {`string | JSX.Element | JSX.Element[]` \cr Content to be passed to the tooltip}
#' \item {\bold{ delay }} {`TooltipDelay` \cr Length of delay. Set to `TooltipDelay.zero` if you do not want a delay.}
#' \item {\bold{ directionalHint }} {`DirectionalHint` \cr How the tooltip should be anchored to its `targetElement`.}
#' \item {\bold{ directionalHintForRTL }} {`DirectionalHint` \cr How the element should be positioned in RTL layouts. If not specified, a mirror of `directionalHint` will be used instead}
#' \item {\bold{ maxWidth }} {`string | null` \cr Max width of tooltip}
#' \item {\bold{ onRenderContent }} {`IRenderFunction<ITooltipProps>` \cr Render function to populate tooltip content.}
#' \item {\bold{ styles }} {`IStyleFunctionOrObject<ITooltipStyleProps, ITooltipStyles>` \cr Call to provide customized styling that will layer on top of the variant rules.}
#' \item {\bold{ targetElement }} {`HTMLElement` \cr Element to anchor the Tooltip to.}
#' \item {\bold{ theme }} {`ITheme` \cr Theme provided by higher-order component.}
#' }
#'
#' @md
#' @name Tooltip
NULL

#' Divider
#'
#' @description
#' A Divider is a line that is used to visually differentiate different parts of a UI. They are commonly used in headers and command bars. This divider automatically center algins itself within the parent container and can be customized to be shown in different heights and colors.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Divider).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' Use a divider component to show a sectional or continuity change in the content between two blocks of information. The spacing around the divider is generally determined by the content surrounding it.
#'
#' There are two recommended divider color combinations:
#'
#' 1. #C8C8C8/neutralTertiaryAlt divider when used within an #F4F4F4/neutralLighter layout
#' 1. #EAEAEA/neutralLight divider when used within an #FFFFFF/white layout
#'
#'
#'
#' @md
#' @name Divider
NULL

#' Keytip
#'
#' @description
#' A Keytip is a small popup near a component that indicates a key sequence that will trigger that component. These are not to be confused with keyboard shortcuts; they are instead key sequences to traverse through levels of UI components. Technically, a Keytip is a wrapper around a Callout where the target element is discovered through a 'data-ktp-target' attribute on that element.
#'
#' To enable Keytips on your page, a developer will add the KeytipLayer component somewhere in their document. It can be added anywhere in your document, but must only be added once. Use the registerKeytip utility helper to add a Keytip. A user will enter and exit keytip mode with a IKeytipTransitionSequence, which is a key with any amount of modifiers (Alt, Shift, etc).
#'
#' By default, the entry and exit sequence is 'Alt-Windows' (Meta) on Windows and 'Option-Control' on macOS. There is also a sequence to 'return' up a level of keytips while traversing. This is by default 'Esc'.
#'
#' Fluent UI React components that have keytips enabled have an optional 'keytipProps' prop which handles registering, unregistering, and rendering of the keytip. The keySequences of the Keytip should be the full sequence to get to that keytip. There is a 'buildKeytipConfigMap' helper which will build a map of ID -> IKeytipProps to assist in defining your keytips.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Keytip).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#'
#'
#' @md
#' @name Keytip
NULL

#' Theme
#'
#' @description
#'
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Theme).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#'
#'
#'
#' @md
#' @name Theme
NULL

#' pickers
#'
#' @description
#' Pickers are used to select one or more items, such as tags or files, from a large list.
#'
#'
#' For more details and examples visit the [official docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/pickers).
#' The R package cannot handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
#'
#' # Best practices
#' ### Layout
#'
#' - Use a picker to quickly search for a few tags or files.
#' - Use a picker to manage a group of tags or files.
#'
#'
#'
#' @md
#' @name Pickers
NULL
