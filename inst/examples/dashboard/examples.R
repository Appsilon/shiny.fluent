# Initially generated automatically based on examples in inst/examples/*.R
# Now needs to be updated manually.

examples <- list()

# ActivityItem

makeActivityItem <- function() {
  ui =
    ActivityItem(
      activityDescription = tagList(
        Link(key = 1, "Philippe Lampros"),
        tags$span(key = 2, " commented")
      ),
      activityIcon = Icon(iconName = "Message"),
      comments = tagList(
        tags$span(key = 1, "Hello! I am making a comment.")
      ),
      timeStamp = "Just now"
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$ActivityItem <- makeActivityItem()


# Announced


makeAnnounced <- function() {
  ui =
    Announced(message = "Screen reader message")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Announced <- makeAnnounced()


# Breadcrumb


makeBreadcrumb <- function() {
  items <- list(
    list(text = "Files", key = "Files", href = "#/page"),
    list(text = "Folder 1", key = "f1", href = "#/page"),
    list(text = "Folder 2", key = "f2", href = "#/page"),
    list(text = "Folder 3", key = "f3", href = "#/page"),
    list(text = "Folder 4 (non-clickable)", key = "f4"),
    list(text = "Folder 5", key = "f5", href = "#/page", isCurrentItem = TRUE)
  )

  ui =
    Breadcrumb(
      items = items,
      maxDisplayedItems = 3,
      ariaLabel = "Breadcrumb with items rendered as links",
      overflowAriaLabel = "More links"
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Breadcrumb <- makeBreadcrumb()


# Button


makeButton <- function() {
  tokens <- list(childrenGap = 20)

  ui =
    div(
      Stack(
        DefaultButton("button1", text = "Default Button", styles = list("background: green")),
        PrimaryButton("button2", text = "Primary Button"),
        CompoundButton("button3", secondaryText = "Compound Button has additional text", text = "Compound Button"),
        ActionButton("button4", iconProps = list("iconName" = "AddFriend"), text = "Action Button"),
        horizontal = TRUE,
        tokens = tokens
      ),
      textOutput("text")
    )
  server = function(input, output, session) {
    clicks <- reactiveVal(0)
    addClick <- function() { clicks(isolate(clicks() + 1)) }

    observeEvent(input$button1, addClick())
    observeEvent(input$button2, addClick())
    observeEvent(input$button3, addClick())
    observeEvent(input$button4, addClick())

    output$text <- renderText({
      paste("Clicks:", clicks())
    })
  }

  list(ui = ui, server = server)
}

examples$Button <- makeButton()


# Calendar


makeCalendar <- function() {
  dayPickerStrings <- jsonlite::fromJSON(
    '{"months":["January","February","March","April","May","June","July","August","September",
    "October","November","December"],"shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul",
    "Aug","Sep","Oct","Nov","Dec"],"days":["Sunday","Monday","Tuesday","Wednesday","Thursday",
    "Friday","Saturday"],"shortDays":["S","M","T","W","T","F","S"],"goToToday":"Go to today",
    "weekNumberFormatString":"Week number {0}","prevMonthAriaLabel":"Previous month",
    "nextMonthAriaLabel":"Next month","prevYearAriaLabel":"Previous year",
    "nextYearAriaLabel":"Next year","prevYearRangeAriaLabel":"Previous year range",
    "nextYearRangeAriaLabel":"Next year range","closeButtonAriaLabel":"Close"}'
  )

  ui =
    div(
      Calendar("calendar", "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
      textOutput("calendarValue")
    )
  server = function(input, output) {
    output$calendarValue <- renderText({
      sprintf("Value: %s", input$calendar)
    })
  }

  list(ui = ui, server = server)
}

examples$Calendar <- makeCalendar()


# Callout


makeCallout <- function() {
  ui = div(
    DefaultButton("toggleCallout", text = "Toggle Callout"),
    reactOutput("callout", height=NULL)
  )
  server = function(input, output) {
    show <- reactiveVal(FALSE)
    observeEvent(input$toggleCallout, {
      show(isolate(!show()))
    })
    output$callout <- renderReact({
      reactWidget(
        if (show()) {
          Callout(
            tags$div(
              style = "margin: 10px",
              "Callout contents"
            )
          )
        }
      )
    })
  }

  list(ui = ui, server = server)
}

examples$Callout <- makeCallout()


# Checkbox


makeCheckbox <- function() {
  ui =
    div(
      Checkbox("checkbox", FALSE),
      textOutput("checkboxValue")
    )
  server = function(input, output) {
    output$checkboxValue <- renderText({
      sprintf("Value: %s", input$checkbox)
    })
  }

  list(ui = ui, server = server)
}

examples$Checkbox <- makeCheckbox()


# ChoiceGroup


makeChoiceGroup <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  ui =
    div(
      ChoiceGroup("choice", "B", options = options),
      textOutput("groupValue")
    )
  server = function(input, output) {
    output$groupValue <- renderText({
      sprintf("Value: %s", input$choice)
    })
  }

  list(ui = ui, server = server)
}

examples$ChoiceGroup <- makeChoiceGroup()


# Coachmark


makeCoachmark <- function() {
  ui =
    div(
      DefaultButton("toggleCoachmark", text = "Toggle Coachmark"),
      reactOutput("coachmark", height=NULL)
    )
  server = function(input, output) {
    showCoachmark <- reactiveVal(FALSE)
    observeEvent(input$toggleCoachmark, {
      showCoachmark(isolate(!showCoachmark()))
    })
    output$coachmark <- renderReact({
      reactWidget(
        if (showCoachmark()) {
          Coachmark(
            target="#toggleCoachmark",
            TeachingBubbleContent(
              headline="Example title",
              hasCloseButton=TRUE,
              primaryButtonProps=list(text="Try it"),
              secondaryButtonProps=list(text="Try it again"),
              onDismiss=JS("function() { Shiny.setInputValue('toggleCoachmark', Math.random()); }"),
              "Welcome to the land of coachmarks!"
            )
          )
        }
      )
    })
  }

  list(ui = ui, server = server)
}

examples$Coachmark <- makeCoachmark()


# ColorPicker


makeColorPicker <- function() {
  ui =
    div(
      ColorPicker("color", "#00FF01"),
      textOutput("colorValue")
    )
  server = function(input, output) {
    output$colorValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  }

  list(ui = ui, server = server)
}

examples$ColorPicker <- makeColorPicker()


# ComboBox


makeComboBox <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  ui =
    div(
      ComboBox("combo", "some text", options = options, allowFreeform = TRUE),
      textOutput("comboValue")
    )
  server = function(input, output) {
    output$comboValue <- renderText({
      v <- input$combo
      sprintf("Value: %s", if (is.character(v)) v else v$key)
    })
  }

  list(ui = ui, server = server)
}

examples$ComboBox <- makeComboBox()


# CommandBar


makeCommandBar <- function() {
  items <- list(
    list(
      key = "newItem",
      text = "New",
      cacheKey = "myCacheKey",
      iconProps = list(iconName = "Add"),
      subMenuProps = list(
        items = list(
          list(
            key = "emailMessage",
            text = "Email message",
            iconProps = list(iconName = "Mail")
          ),
          list(
            key = "calendarEvent",
            text = "Calendar event",
            iconProps = list(iconName = "Calendar")
          )
        )
      )
    ),
    list(
      key = "upload",
      text = "Upload",
      iconProps = list(iconName = "Upload")
    ),
    list(
      key = "share",
      text = "Share",
      iconProps = list(iconName = "Share")
    ),
    list(
      key = "download",
      text = "Download",
      iconProps = list(iconName = "Download")
    )
  )

  farItems <- list(
    list(
      key = "tile",
      text = "Grid view",
      ariaLabel = "Grid view",
      iconOnly = TRUE,
      iconProps = list(iconName = "Tiles")
    ),
    list(
      key = "info",
      text = "Info",
      ariaLabel = "Info",
      iconOnly = TRUE,
      iconProps = list(iconName = "Info")
    )
  )

  ui =
    CommandBar(items = items, farItems = farItems)
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$CommandBar <- makeCommandBar()


# ContextualMenu


makeContextualMenu <- function() {
  ui =
    div(
      DefaultButton("toggleContextualMenu", text = "Toggle menu"),
      reactOutput("contextualMenu", height=NULL)
    )
  server = function(input, output) {
    showContextualMenu <- reactiveVal(FALSE)
    observeEvent(input$toggleContextualMenu, {
      showContextualMenu(isolate(!showContextualMenu()))
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
      ];
      ");

      reactWidget(
        ContextualMenu(
          items=menuItems,
          hidden=!showContextualMenu(),
          target="#toggleContextualMenu",
          onItemClick=JS("function() { Shiny.setInputValue('toggleContextualMenu', Math.random()); }"),
          onDismiss=JS("function() { Shiny.setInputValue('toggleContextualMenu', Math.random()); }")
        )
      )
    })
  }

  list(ui = ui, server = server)
}

examples$ContextualMenu <- makeContextualMenu()


# DatePicker


makeDatePicker <- function() {
  dayPickerStrings <- jsonlite::fromJSON(
    '{"months":["January","February","March","April","May","June","July","August","September",
    "October","November","December"],"shortMonths":["Jan","Feb","Mar","Apr","May","Jun","Jul",
    "Aug","Sep","Oct","Nov","Dec"],"days":["Sunday","Monday","Tuesday","Wednesday","Thursday",
    "Friday","Saturday"],"shortDays":["S","M","T","W","T","F","S"],"goToToday":"Go to today",
    "weekNumberFormatString":"Week number {0}","prevMonthAriaLabel":"Previous month",
    "nextMonthAriaLabel":"Next month","prevYearAriaLabel":"Previous year",
    "nextYearAriaLabel":"Next year","prevYearRangeAriaLabel":"Previous year range",
    "nextYearRangeAriaLabel":"Next year range","closeButtonAriaLabel":"Close"}'
  )

  ui =
    div(
      DatePicker("date", "2020-06-25T22:00:00.000Z", strings = dayPickerStrings),
      textOutput("dateValue")
    )
  server = function(input, output) {
    output$dateValue <- renderText({
      sprintf("Value: %s", input$date)
    })
  }

  list(ui = ui, server = server)
}

examples$DatePicker <- makeDatePicker()


# DetailsList


makeDetailsList <- function() {
  items <- list(
    list(key = "1", name = "Mark", surname = "Swanson"),
    list(key = "2", name = "Josh", surname = "Johnson")
  )

  columns <- list(
    list(key = "name", fieldName = "name", name = "Name"),
    list(key = "surname", fieldName = "surname", name = "Surname")
  )

  ui =
    DetailsList(items = items, columns = columns)
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$DetailsList <- makeDetailsList()


# Dialog


makeDialog <- function() {
  ui =
    div(
      DefaultButton("showDialog", text = "Open dialog"),
      reactOutput("reactDialog", height=NULL)
    )
  server = function(input, output) {
    isDialogOpen <- reactiveVal(FALSE)
    output$reactDialog <- renderReact({
      dialogContentProps <- list(
        type=0,
        title='Missing Subject',
        closeButtonAriaLabel='Close',
        subText='Do you want to send this message without a subject?'
      )

      reactWidget(
        Dialog(
          hidden=!isDialogOpen(),
          onDismiss=JS("function() { Shiny.setInputValue('hideDialog', Math.random()); }"),
          dialogContentProps=dialogContentProps,
          modalProps=list(),
          ShinyComponentWrapper(
            DialogFooter(
              PrimaryButton("dialogSend", text="Send"),
              DefaultButton("dialogDontSend", text="Don't send")
            )
          )
        )
      )
    })

    observeEvent(input$showDialog, isDialogOpen(TRUE))
    observeEvent(input$hideDialog, isDialogOpen(FALSE))
    observeEvent(input$dialogSend, isDialogOpen(FALSE))
    observeEvent(input$dialogDontSend, isDialogOpen(FALSE))
  }

  list(ui = ui, server = server)
}

examples$Dialog <- makeDialog()


# DocumentCard


makeDocumentCard <- function() {
  title <- "Long_file_name_with_underscores_used_to_separate_all_of_the_words"
  previewImages <- list(
    list(
      previewImageSrc = "https://picsum.photos/318/196",
      width = 318,
      height = 196
    )
  )

  ui =
    DocumentCard(
      DocumentCardPreview(previewImages = previewImages),
      DocumentCardTitle(
        title = title,
        shouldTruncate = TRUE
      ),
      DocumentCardActivity(
        activity = "Created a few minutes ago",
        people = list(list(name = "Annie Lindqvist"))
      )
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$DocumentCard <- makeDocumentCard()


# Dropdown


makeDropdown <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  ui =
    div(
      Dropdown("dropdown", "A", options = options),
      textOutput("dropdownValue")
    )
  server = function(input, output) {
    output$dropdownValue <- renderText({
      sprintf("Value: %s", input$dropdown)
    })
  }

  list(ui = ui, server = server)
}

examples$Dropdown <- makeDropdown()


# Facepile


makeFacepile <- function() {
  personas <- list(
    list(personaName = "Adams Baker"),
    list(personaName = "Clark Davis"),
    list(personaName = "Evans Frank")
  )

  ui =
    Facepile(personas = personas)
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Facepile <- makeFacepile()


# FocusTrapZone


makeFocusTrapZone <- function() {
  ui =
    reactOutput("focusTrapZone", height=NULL)
  server = function(input, output) {
    output$focusTrapZone <- renderReact({
      useTrapZone <- !is.null(input$useTrapZone) && input$useTrapZone
      stackStyles <- list(root = list(border = if(useTrapZone) '2px solid #ababab' else 'transparent', padding = 10))
      textFieldStyles <- list(root = list(width = 300));
      stackTokens = list(childrenGap = 8);

      reactWidget({
        div(
          FocusTrapZone(
            disabled=!useTrapZone,
            Stack(
              horizontalAlign="start",
              tokens=stackTokens,
              styles=stackStyles,
              Toggle(
                "useTrapZone",
                value=input$useTrapZone,
                label="Use trap zone",
                onText="On (toggle to exit)",
                offText="Off (toggle to trap focus)"
              ),
              TextField("textInput", label="Input inside trap zone", styles=textFieldStyles),
              Link(href="https://bing.com", target="_blank", "Hyperlink inside trap zone")
            )),
          Link(href="https://bing.com", target="_blank", "Hyperlink outside trap zone")
        )
        }
      )
    })
  }

  list(ui = ui, server = server)
}

examples$FocusTrapZone <- makeFocusTrapZone()


# FocusZone


makeFocusZone <- function() {
  tokens <- list(childrenGap = 20)

  ui =
    Stack(
      tokens = tokens,
      horizontalAlign = "start",
      FocusZone(
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Enabled FocusZone:"),
          DefaultButton("input1", text = "Button 1"),
          DefaultButton("input2", text = "Button 2"),
          TextField("input3", placeholder = "FocusZone TextField"),
          DefaultButton("input4", text = "Button 3")
        )
      ),
      DefaultButton("input5", text = "Tabbable Element 1"),
      FocusZone(
        disabled = TRUE,
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Disabled FocusZone:"),
          DefaultButton("input6", text = "Button 1"),
          DefaultButton("input7", text = "Button 2")
        )
      ),
      TextField("input8", placeholder = "Tabbable Element 2")
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$FocusZone <- makeFocusZone()


# GroupedList


makeGroupedList <- function() {
  ui =
    GroupedList(
      items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
      groups = list(
        list(key = "g1", name = "Some items", startIndex = 0, count = 2),
        list(key = "g2", name = "More items", startIndex = 2, count = 3)
      ),
      selectionMode = 0,
      onRenderCell = JS("(depth, item) =>
        React.createElement('span', { style: { paddingLeft: 49 } }, item)
      ")
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$GroupedList <- makeGroupedList()


# HoverCard


makeHoverCard <- function() {
  ui =
    HoverCard(
      type = "PlainCard",
      plainCardProps = JS("{
        onRenderPlainCard: (a, b, c) => 'HoverCard contents',
        style: { margin: 10 }
      }"),
      "Hover over me"
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$HoverCard <- makeHoverCard()


# Icon


makeIcon <- function() {
  style <- list(fontSize = 50, margin = 10)
  ui =
    tags$div(
      FontIcon(iconName = "CompassNW", style = style),
      FontIcon(iconName = "Dictionary", style = style),
      FontIcon(iconName = "TrainSolid", style = style)
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Icon <- makeIcon()


# Image


makeImage <- function() {
  ui =
    Image(src = "http://placehold.it/350x150")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Image <- makeImage()


# Keytips


makeKeytips <- function() {
    ui = tagList(
      textOutput("keytipsResult"),
      div(
        Label("To open keytips, hit 'Alt-Windows' on Windows/Linux and 'Option-Control' on macOS. Keytips will appear. Type what you see, e.g. 1 and then A to 'click' the first button."),
        Label("When multiple Keytips start with the same character, typing that character will filter the visible keytips."),
        Stack(horizontal=TRUE, tokens=list(childrenGap=20),
          DefaultButton("buttonk1",
                        keytipProps=JS("keytipMap.Button"),
                        text="Button"),
          CompoundButton(
            "buttonk2",
            style=list(marginBottom=28),
            keytipProps=JS("keytipMap.CompoundButton"),
            text="Compound Button",
            secondaryText='With a Keytip'),
          DefaultButton(
            "buttonk3",
            keytipProps=JS("keytipMap.ButtonWithMenu"),
            text="Button with Menu",
            menuProps=JS("buttonProps"))
        ),
        KeytipLayer()
      )
    )
  server = function(input, output) {
    clicks <- reactiveVal(0)
    addClick <- function() { clicks(isolate(clicks() + 1)) }
    output$keytipsResult <- renderText({paste("Buttons clicked: ", clicks())})
    observeEvent(input$buttonk1, addClick())
    observeEvent(input$buttonk2, addClick())
    observeEvent(input$buttonk3, addClick())
  }

  list(ui = ui, server = server)
}

examples$Keytips <- makeKeytips()


# Label


makeLabel <- function() {
  ui =
    Label("Required label", required = TRUE)
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Label <- makeLabel()


# LayerHost


makeLayerHost <- function() {
  ui =
    div(
      LayerHost(id = "host", style = list(border = "1px dashed", padding = 10)),
      "Layer children are rendered in the LayerHost",
      Layer(hostId = "host", "Content")
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$LayerHost <- makeLayerHost()


# Layer


makeLayer <- function() {
  ui = div(
      style="margin-top: 60px; border: 1px solid navy; padding: 10px; background: #eee;",
      Checkbox("useLayer", FALSE, label = "Display a message in a layer"),
      reactOutput("layer", height=NULL)
    )
  server = function(input, output) {
    output$layer <- renderReact({
      box <- div(
        style = "background-color: #60C7FF; margin: 10px; padding: 10px",
        "Hello!"
      )
      reactWidget(
        if (input$useLayer) {
          Layer(box)
        } else {
          NULL
        }
      )
    })
  }

  list(ui = ui, server = server)
}

examples$Layer <- makeLayer()


# Link


makeLink <- function() {
  ui =
    Link(href = "https://appsilon.com", "Appsilon")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Link <- makeLink()


# List


makeList <- function() {
  items <- do.call(paste0, replicate(20, sample(LETTERS, 200, TRUE), FALSE))
  ui =
    div(
      style = "overflow: auto; max-height: 400px",
      List(
        items = items,
        onRenderCell = JS("(item, index) => `${index} ${item}`")
      )
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$List <- makeList()


# MarqueeSelection
makeMarqueeSelection <- function() {
  ui = div(
    textOutput("marqueeResult"),
    Label('Drag a rectangle around the items below to select them'), # Make sure Fluent dependency is loaded.
    reactOutput("marqueeSelection", height=NULL)
  )
  server = function(input, output) {
    MarqueeSelectionExample <- shiny.react::make_output(NULL, 'exampleApp', 'MarqueeSelectionExample')

    photos <- lapply(1:50, function(index) {
      randomWidth <- 50 + sample.int(150, 1)
      list(
        key=index,
        url=paste0('http://placehold.it/', randomWidth, 'x100'),
        width=randomWidth,
        height=100)
    })

    output$marqueeResult <- renderText({
      paste("You have selected: ", paste(input$selectedIndices, collapse=", "))
    })

    output$marqueeSelection <- renderReact({
      reactWidget(
        MarqueeSelectionExample(
          name="selectedIndices",
          photos=photos
        )
      )
    })
  }

  list(ui = ui, server = server)
}

examples$MarqueeSelection <- makeMarqueeSelection()


# MessageBar


makeMessageBar <- function() {
  ui =
    MessageBar("Message")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$MessageBar <- makeMessageBar()


# Modal


makeModal <- function() {
  ui =
    div(
      DefaultButton("showModal", text = "Open modal"),
      reactOutput("reactModal", height=NULL)
    )
  server = function(input, output) {
    isModalOpen <- reactiveVal(FALSE)
    output$reactModal <- renderReact({
      reactWidget(
        Modal(isOpen=isModalOpen(), isBlocking=FALSE, div(
          style = "margin: 20px",
          h1("This is an important message"),
          p("Read this text to learn more."),
          ShinyComponentWrapper(DefaultButton("hideModal", text="Close"))))
      )
    })
    observeEvent(input$showModal, { isModalOpen(TRUE) })
    observeEvent(input$hideModal, { isModalOpen(FALSE) })
  }

  list(ui = ui, server = server)
}

examples$Modal <- makeModal()


# Nav


makeNav <- function() {
  navigation_styles <- list(
    root = list(
      height = "100%",
      boxSizing = "border-box",
      border = "1px solid #eee",
      overflowY = "auto"
    )
  )

  link_groups <- list(
    list(
      links = list(
        list(
          name = "Home",
          expandAriaLabel = "Expand Home section",
          collapseAriaLabel = "Collapse Home section",
          links = list(
            list(
              name = "Activity",
              url = "http://msn.com",
              key = "key1",
              target = "_blank"
            ),
            list(
              name = "MSN",
              url = "http://msn.com",
              disabled = TRUE,
              key = "key2",
              target = "_blank"
            )
          ),
          isExpanded = TRUE
        ),
        list(
          name = "Documents",
          url = "http://example.com",
          key = "key3",
          isExpanded = TRUE
        ),
        list(
          name = "Pages",
          url = "http://msn.com",
          key = "key4"
        ),
        list(
          name = "Notebook",
          url = "http://msn.com",
          key = "key5",
          disabled = TRUE
        ),
        list(
          name = "Communication and Media",
          url = "http://msn.com",
          key = "key6"
        ),
        list(
          name = "News",
          url = "http://cnn.com",
          icon = "News",
          key = "key7",
          target = "_blank",
          iconProps = list(
            iconName = "News",
            styles = list(
              root = list(
                fontSize = 20,
                color = "#106ebe"
              )
            )
          )
        )
      )
    )
  )

  ui =
    Nav(
      groups = link_groups,
      selectedKey = "key1",
      styles = navigation_styles
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Nav <- makeNav()


# OverflowSet


makeOverflowSet <- function() {
  items <- list(
    list(key = "item1", icon = "Add", name = "Link 1"),
    list(key = "item2", icon = "Upload", name = "Link 2"),
    list(key = "item3", icon = "Share", name = "Link 3")
  )
  overflowItems <- list(
    list(key = "item4", icon = "Mail", name = "Overflow Link 1"),
    list(key = "item5", icon = "Calendar", name = "Overflow Link 2")
  )
  onRenderItem <- JS("item =>
    React.createElement(window['shiny.fluent'].CommandBarButton, {
      role: 'menuitem',
      iconProps: { iconName: item.icon },
      styles: {
        root: { padding: '10px' }
      }
    })
  ")
  onRenderOverflowButton <- JS("overflowItems =>
    React.createElement(window['shiny.fluent'].CommandBarButton, {
      role: 'menuitem',
      title: 'More items',
      styles: {
        root: { padding: '10px' }
      },
      menuIconProps: { iconName: 'More' },
      menuProps: { items: overflowItems }
    })
  ")

  ui =
    OverflowSet(
      vertical = TRUE,
      items = items,
      overflowItems = overflowItems,
      onRenderItem = onRenderItem,
      onRenderOverflowButton = onRenderOverflowButton
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$OverflowSet <- makeOverflowSet()


# Overlay


makeOverlay <- function() {
  ui =
    Overlay(
      isDarkThemed = TRUE,
      "Inside Overlay"
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Overlay <- makeOverlay()


# Panel


makePanel <- function() {
  ui =
    div(
      DefaultButton("showPanel", text = "Open panel"),
      reactOutput("reactPanel", height=NULL)
    )
  server = function(input, output) {
    isPanelOpen <- reactiveVal(FALSE)
    output$reactPanel <- renderReact({
      reactWidget(
        Panel(
          headerText = "Sample panel",
          isOpen = isPanelOpen(),
          "Content goes here.",
          onDismiss = JS("function() { Shiny.setInputValue('hidePanel', Math.random()); }")
        )
      )
    })
    observeEvent(input$showPanel, isPanelOpen(TRUE))
    observeEvent(input$hidePanel, isPanelOpen(FALSE))
  }

  list(ui = ui, server = server)
}

examples$Panel <- makePanel()


# PeoplePicker


makePeoplePicker <- function() {
  people <- tibble::tribble(
    ~key, ~imageUrl, ~imageInitials, ~text, ~secondaryText, ~tertiaryText, ~optionalText, ~isValid, ~presence, ~canExpand,
    1, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "PV", "Annie Lindqvist", "Designer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
    2, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AR", "Aaron Reid", "Designer", "In a meeting", "Available at 4:00pm", TRUE, 6, NA,
    3, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "AL", "Alex Lundberg", "Software Developer", "In a meeting", "Available at 4:00pm", TRUE, 4, NA,
    4, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "RK", "Roko Kolar", "Financial Analyst", "In a meeting", "Available at 4:00pm", TRUE, 1, NA,
    5, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "CB", "Christian Bergqvist", "Sr. Designer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
    6, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-female.png", "VL", "Valentina Lovric", "Design Developer", "In a meeting", "Available at 4:00pm", TRUE, 2, NA,
    7, "https://static2.sharepointonline.com/files/fabric/office-ui-fabric-react-assets/persona-male.png", "MS", "Maor Sharett", "UX Designer", "In a meeting", "Available at 4:00pm", TRUE, 3, NA
  )

  suggestionProps <- list(
    suggestionsHeaderText='Suggested People',
    mostRecentlyUsedHeaderText='Suggested Contacts',
    noResultsFoundText='No results found',
    loadingText='Loading',
    showRemoveButtons=TRUE,
    suggestionsAvailableAlertText='People Picker Suggestions available',
    suggestionsContainerAriaLabel='Suggested contacts'
  );

  people_json <- jsonlite::toJSON(people)

  ui = tagList(
    textOutput("selectedPeople"),
    NormalPeoplePicker(
      onResolveSuggestions=JS(paste("function(filterText) { return ", people_json, ".filter(item => item.text.toLowerCase().indexOf(filterText.toLowerCase()) === 0) }")),
      onEmptyInputFocus=JS(paste("function() { return ", people_json, "}")),
      getTextFromItem=JS("function(item) { return item.text }"),
      pickerSuggestionsProps=suggestionProps,
      className="ms-PeoplePicker",
      onChange=JS("function(selection) { Shiny.setInputValue('selectedPeople', JSON.stringify(selection)) }")
    )
  )
  server = function(input, output) {
    output$selectedPeople <- renderText({
      if (is.null(input$selectedPeople)) {
        "Select recipients below:"
      } else {
        paste("You have selected:", paste(jsonlite::fromJSON(input$selectedPeople)$text, collapse=", "))
      }
    })
  }

  list(ui = ui, server = server)
}

examples$PeoplePicker <- makePeoplePicker()


# Persona


makePersona <- function() {
  ui =
    Persona(
      imageInitials = "AL",
      text = "Annie Lindqvist",
      secondaryText = "Software Engineer",
      presence = 4
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Persona <- makePersona()


# Pivot


makePivot <- function() {
  ui =
    Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"))
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Pivot <- makePivot()


# ProgressIndicator


makeProgressIndicator <- function() {
  ui =
    ProgressIndicator(
      label = "Example title",
      description = "Example description"
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$ProgressIndicator <- makeProgressIndicator()


# Rating


makeRating <- function() {
  ui =
    div(
      Rating("rating", 2),
      textOutput("ratingValue")
    )
  server = function(input, output) {
    output$ratingValue <- renderText({
      sprintf("Value: %s", input$rating)
    })
  }

  list(ui = ui, server = server)
}

examples$Rating <- makeRating()


# ResizeGroup


makeResizeGroup <- function() {
  data <- list(
    items = list(
      "many", "strings", "with", "varying", "length", "sometimes", "very", "short",
      "other", "times", "extraordinarily", "long"
    )
  )
  onRenderData <- JS("data =>
    data.items.map(item =>
      React.createElement('div',
        {
          style: {
            display: 'inline-block',
            backgroundColor: 'orange',
            padding: '10px',
            margin: '10px',
            fontSize: '20px',
          }
        },
        item
      )
    )
  ")
  onReduceData <- JS("data => ({ items: data.items.slice(0, -1) })")
  ui =
    div(
      p("Resize the browser to see how the elements are hidden when they do not fit:"),
      ResizeGroup(
        data = data,
        onRenderData = onRenderData,
        onReduceData = onReduceData
      )
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$ResizeGroup <- makeResizeGroup()


# ScrollablePane


makeScrollablePane <- function() {
  pane <- function(header, paragraphs) (
    div(
      Sticky(
        div(
          style = "background-color: #80CAF1; border-top: 1px solid; border-bottom: 1px solid",
          header
        )
      ),
      stri_rand_lipsum(paragraphs)
    )
  )
  ui = div(style="position: relative; height:500px",
    ScrollablePane(
      styles = list(
        root = list(height = "500px", width = "400px")
      ),
      pane("Some text", 3),
      pane("A lot of text", 5),
      pane("Just a short ending", 1)
    ))
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$ScrollablePane <- makeScrollablePane()


# SearchBox


makeSearchBox <- function() {
  ui =
    div(
      SearchBox("search", placeholder = "Search"),
      textOutput("searchValue")
    )
  server = function(input, output) {
    output$searchValue <- renderText({
      sprintf("Value: %s", input$search)
    })
  }

  list(ui = ui, server = server)
}

examples$SearchBox <- makeSearchBox()


# Separator


makeSeparator <- function() {
  ui =
    Separator("Text")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Separator <- makeSeparator()


# Shimmer


makeShimmer <- function() {
  ui <- tagList(
    withReact(
      div(
        p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
        Shimmer(),
        Shimmer(width = "75%"),
        Shimmer(width = "50%")
      )
    ),
    tags$head(tags$style(
      ".ms-Shimmer-container { margin: 10px 0 }"
    ))
  )

  ui =
    div(
      p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
      Shimmer(),
      Shimmer(width = "75%"),
      Shimmer(width = "50%")
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Shimmer <- makeShimmer()


# Slider


makeSlider <- function() {
  ui =
    div(
      Slider("slider", 42, min = -100, max = 100),
      textOutput("sliderValue")
    )
  server = function(input, output) {
    output$sliderValue <- renderText({
      sprintf("Value: %s", input$slider)
    })
  }

  list(ui = ui, server = server)
}

examples$Slider <- makeSlider()


# SpinButton


makeSpinButton <- function() {
  ui =
    div(
      SpinButton("spin", 15, min = 0, max = 50, step = 5),
      textOutput("spinValue")
    )
  server = function(input, output) {
    output$spinValue <- renderText({
      sprintf("Value: %s", input$spin)
    })
  }

  list(ui = ui, server = server)
}

examples$SpinButton <- makeSpinButton()


# Spinner


makeSpinner <- function() {
  ui =
    Spinner(size = 3, label = "Loading, please wait...")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Spinner <- makeSpinner()


# Stack


makeStack <- function() {
  ui =
    div(
      Stack(
        tokens = list(childrenGap = 10),
        reversed = TRUE,
        span("Item One"),
        span("Item Two"),
        span("Item Three")
      )
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Stack <- makeStack()


# SwatchColorPicker


makeSwatchColorPicker <- function() {
  colorCells <- list(
    list(id = "orange", color = "#ca5010"),
    list(id = "cyan", color = "#038387"),
    list(id = "blueMagenta", color = "#8764b8"),
    list(id = "magenta", color = "#881798"),
    list(id = "white", color = "#ffffff")
  )

  ui =
    div(
      SwatchColorPicker("color", "orange", colorCells = colorCells, columnCount = length(colorCells)),
      textOutput("swatchValue")
    )
  server = function(input, output) {
    output$swatchValue <- renderText({
      sprintf("Value: %s", input$color)
    })
  }

  list(ui = ui, server = server)
}

examples$SwatchColorPicker <- makeSwatchColorPicker()


# TagPicker


makeTagPicker <- function() {
    ui = div(
        textOutput("selectedTags"),
        TagPicker(
          onResolveSuggestions=JS("filterSuggestedTags"),
          onEmptyInputFocus=JS("function(tagList) { return testTags.filter(tag => !listContainsTagList(tag, tagList)); }"),
          getTextFromItem=JS("function(item) { return item.text }"),
          pickerSuggestionsProps=list(suggestionsHeaderText='Suggested tags', noResultsFoundText='No color tags found'),
          itemLimit=2,
          onChange=JS("function(selection) { Shiny.setInputValue('selectedTags', JSON.stringify(selection)) }")
        )
      )
  server = function(input, output) {
    output$selectedTags <- renderText({
      if (is.null(input$selectedTags)) {
        "Select up to 2 colors below:"
      } else {
        paste("You have selected:", paste(jsonlite::fromJSON(input$selectedTags)$name, collapse=", "))
      }
    })
  }

  list(ui = ui, server = server)
}

examples$TagPicker <- makeTagPicker()


# TeachingBubble


makeTeachingBubble <- function() {
  ui =
    div(
      DefaultButton("toggleTeachingBubble", text = "Toggle TeachingBubble"),
      reactOutput("teachingBubble", height=NULL)
    )
  server = function(input, output) {
    showBubble <- reactiveVal(FALSE)
    observeEvent(input$toggleTeachingBubble, {
      showBubble(isolate(!showBubble()))
    })
    output$teachingBubble <- renderReact({
        reactWidget(
          if (showBubble()) {
            TeachingBubble(
              target = "#toggleTeachingBubble",
              headline = "Very useful!"
            )
          }
        )
    })
  }

  list(ui = ui, server = server)
}

examples$TeachingBubble <- makeTeachingBubble()


# TextField


makeTextField <- function() {
  ui =
    div(
      TextField("text"),
      textOutput("textValue")
    )
  server = function(input, output) {
    output$textValue <- renderText({
      sprintf("Value: %s", input$text)
    })
  }

  list(ui = ui, server = server)
}

examples$TextField <- makeTextField()


# Text


makeText <- function() {
  ui =
    Text(variant = "xLarge", "Some text with a nice Fluent UI font")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Text <- makeText()


# Themes


makeThemes <- function() {
  ui = Label("Example not available in the dashboard, as it could modify the entire dashboard's look. Please look at the example source code or run individually.")
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Themes <- makeThemes()


# Toggle


makeToggle <- function() {
  ui =
    div(
      Toggle("toggle", TRUE),
      textOutput("toggleValue")
    )
  server = function(input, output) {
    output$toggleValue <- renderText({
      sprintf("Value: %s", input$toggle)
    })
  }

  list(ui = ui, server = server)
}

examples$Toggle <- makeToggle()


# Tooltip


makeTooltip <- function() {
  ui =
    TooltipHost(
      content = "This is the tooltip content",
      delay = 0,
      Text("Hover over me")
    )
  server = function(input, output) {
  }

  list(ui = ui, server = server)
}

examples$Tooltip <- makeTooltip()
