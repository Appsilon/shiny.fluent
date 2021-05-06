# Initially generated automatically based on examples in inst/examples/*.R
# Now needs to be updated manually.

examples <- list()

# ActivityItem

makeActivityItem <- function() {
  list(
    ui = ActivityItem(
      activityDescription = tagList(
        Link(key = 1, "Philippe Lampros"),
        tags$span(key = 2, " commented")
      ),
      activityIcon = Icon(iconName = "Message"),
      comments = tagList(
        tags$span(key = 1, "Hello! I am making a comment.")
      ),
      timeStamp = "Just now"
    ),
    server = function(input, output) {}
  )
}

examples$ActivityItem <- makeActivityItem()


# Announced


makeAnnounced <- function() {
  list(
    ui = Announced(message = "Screen reader message"),
    server = function(input, output) {}
  )
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

  list(
    ui = Breadcrumb(
      items = items,
      maxDisplayedItems = 3,
      ariaLabel = "Breadcrumb with items rendered as links",
      overflowAriaLabel = "More links"
    ),
    server = function(input, output) {}
  )
}

examples$Breadcrumb <- makeBreadcrumb()


# Button


makeButton <- function() {
  tokens <- list(childrenGap = 20)

  list(
    ui = div(
        Stack(
        DefaultButton.shinyInput("button1", text = "Default Button", styles = list("background: green")),
        PrimaryButton.shinyInput("button2", text = "Primary Button"),
        CompoundButton.shinyInput("button3", secondaryText = "Compound Button has additional text", text = "Compound Button"),
        ActionButton.shinyInput("button4", iconProps = list("iconName" = "AddFriend"), text = "Action Button"),
        horizontal = TRUE,
        tokens = tokens
      ),
      textOutput("text")
    ),
    server = function(input, output) {
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
  )
}

examples$Button <- makeButton()


# Calendar


makeCalendar <- function() {
  list(
    ui = div(
      Calendar.shinyInput("calendar", "2020-06-25T22:00:00.000Z"),
      textOutput("calendarValue")
    ),
    server = function(input, output) {
      output$calendarValue <- renderText({
        sprintf("Value: %s", input$calendar)
      })
    }
  )
}

examples$Calendar <- makeCalendar()


# Callout


makeCallout <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("toggleCallout", text = "Toggle Callout"),
      reactOutput("callout")
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleCallout, show(!show()))
      output$callout <- renderReact({
        if (show()) {
          Callout(
            tags$div(
              style = "margin: 10px",
              "Callout contents"
            )
          )
        }
      })
    }
  )
}

examples$Callout <- makeCallout()


# Checkbox


makeCheckbox <- function() {
  list(
    ui = div(
      Checkbox.shinyInput("checkbox", value = FALSE),
      textOutput("checkboxValue")
    ),
    server = function(input, output) {
      output$checkboxValue <- renderText({
        sprintf("Value: %s", input$checkbox)
      })
    }
  )
}

examples$Checkbox <- makeCheckbox()


# ChoiceGroup


makeChoiceGroup <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  list(
    ui = div(
      ChoiceGroup.shinyInput("choice", value = "B", options = options),
      textOutput("groupValue")
    ),
    server = function(input, output) {
      output$groupValue <- renderText({
        sprintf("Value: %s", input$choice)
      })
    }
  )
}

examples$ChoiceGroup <- makeChoiceGroup()


# Coachmark


makeCoachmark <- function() {
  list(
    ui = tagList(
      uiOutput("coachmark"),
      DefaultButton.shinyInput("toggleCoachmark",
        id = "target", text = "Toggle coachmark"
      )
    ),
    server = function(input, output) {
      coachmarkVisible <- reactiveVal(FALSE)
      observeEvent(input$toggleCoachmark, coachmarkVisible(!coachmarkVisible()))
      observeEvent(input$hideCoachmark, coachmarkVisible(FALSE))
      output$coachmark <- renderUI({
        if (coachmarkVisible()) Coachmark(
          target = "#target",
          TeachingBubbleContent(
            hasCloseButton = TRUE,
            onDismiss = triggerEvent("hideCoachmark"),
            headline = "Example title",
            primaryButtonProps = list(text = "Try it"),
            secondaryButtonProps = list(text = "Try it again"),
            "Welcome to the land of coachmarks!"
          )
        )
      })
    }
  )
}

examples$Coachmark <- makeCoachmark()


# ColorPicker


makeColorPicker <- function() {
  list(
    ui = div(
      ColorPicker.shinyInput("color", value = "#00FF01"),
      textOutput("colorValue")
    ),
    server = function(input, output) {
      output$colorValue <- renderText({
        sprintf("Value: %s", input$color)
      })
    }
  )
}

examples$ColorPicker <- makeColorPicker()


# ComboBox


makeComboBox <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  list(
    ui = div(
      ComboBox.shinyInput("combo", value = list(text = "some text"),
        options = options, allowFreeform = TRUE
      ),
      textOutput("comboValue")
    ),
    server = function(input, output) {
      output$comboValue <- renderText({
        sprintf("Value: %s", input$combo$text)
      })
    }
  )
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

  list(
    ui = CommandBar(items = items, farItems = farItems),
    server = function(input, output) {}
  )
}

examples$CommandBar <- makeCommandBar()


# ContextualMenu


makeContextualMenu <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("toggleContextualMenu", id = "target", text = "Toggle menu"),
      reactOutput("contextualMenu")
    ),
    server = function(input, output) {
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
          onItemClick = JS("function() { Shiny.setInputValue('toggleContextualMenu', Math.random()); }"),
          onDismiss = JS("function() { Shiny.setInputValue('toggleContextualMenu', Math.random()); }")
        )
      })
    }
  )
}

examples$ContextualMenu <- makeContextualMenu()


# DatePicker


makeDatePicker <- function() {
  list(
    ui = div(
      DatePicker.shinyInput("date", value = "2020-06-25T22:00:00.000Z"),
      textOutput("dateValue")
    ),
    server = function(input, output) {
      output$dateValue <- renderText({
        sprintf("Value: %s", input$date)
      })
    }
  )
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

  list(
    ui = DetailsList(items = items, columns = columns),
    server = function(input, output) {}
  )
}

examples$DetailsList <- makeDetailsList()


# Dialog


makeDialog <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("showDialog", text = "Open dialog"),
      reactOutput("reactDialog")
    ),
    server = function(input, output) {
      isDialogOpen <- reactiveVal(FALSE)
      output$reactDialog <- renderReact({
        dialogContentProps <- list(
          type=0,
          title='Missing Subject',
          closeButtonAriaLabel='Close',
          subText='Do you want to send this message without a subject?'
        )
        Dialog(
          hidden = !isDialogOpen(),
          onDismiss = JS("function() { Shiny.setInputValue('hideDialog', Math.random()); }"),
          dialogContentProps = dialogContentProps,
          modalProps = list(),
          DialogFooter(
            PrimaryButton.shinyInput("dialogSend", text = "Send"),
            DefaultButton.shinyInput("dialogDontSend", text = "Don't send")
          )
        )
      })

      observeEvent(input$showDialog, isDialogOpen(TRUE))
      observeEvent(input$hideDialog, isDialogOpen(FALSE))
      observeEvent(input$dialogSend, isDialogOpen(FALSE))
      observeEvent(input$dialogDontSend, isDialogOpen(FALSE))
    }
  )
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

  list(
    ui = DocumentCard(
      DocumentCardPreview(previewImages = previewImages),
      DocumentCardTitle(
        title = title,
        shouldTruncate = TRUE
      ),
      DocumentCardActivity(
        activity = "Created a few minutes ago",
        people = list(list(name = "Annie Lindqvist"))
      )
    ),
    server = function(input, output) {}
  )
}

examples$DocumentCard <- makeDocumentCard()


# Dropdown


makeDropdown <- function() {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )

  list(
    ui = div(
      Dropdown.shinyInput("dropdown", value = "A", options = options),
      textOutput("dropdownValue")
    ),
    server = function(input, output) {
      output$dropdownValue <- renderText({
        sprintf("Value: %s", input$dropdown)
      })
    }
  )
}

examples$Dropdown <- makeDropdown()


# Facepile


makeFacepile <- function() {
  personas <- list(
    list(personaName = "Adams Baker"),
    list(personaName = "Clark Davis"),
    list(personaName = "Evans Frank")
  )

  list(
    ui = Facepile(personas = personas),
    server = function(input, output) {}
  )
}

examples$Facepile <- makeFacepile()


# FocusTrapZone


makeFocusTrapZone <- function() {
  list(
    ui = reactOutput("focusTrapZone"),
    server = function(input, output) {
      output$focusTrapZone <- renderReact({
        useTrapZone <- isTRUE(input$useTrapZone)
        stackStyles <- list(root = list(
          border = if (useTrapZone) '2px solid #ababab' else 'transparent',
          padding = 10
        ))
        textFieldStyles <- list(root = list(width = 300));
        stackTokens = list(childrenGap = 8);

        div(
          FocusTrapZone(
            disabled = !useTrapZone,
            Stack(
              horizontalAlign = "start",
              tokens = stackTokens,
              styles = stackStyles,
              Toggle.shinyInput("useTrapZone",
                value = FALSE,
                label = "Use trap zone",
                onText = "On (toggle to exit)",
                offText = "Off (toggle to trap focus)"
              ),
              TextField.shinyInput("textInput", label = "Input inside trap zone", styles = textFieldStyles),
              Link(href = "https://bing.com", target = "_blank", "Hyperlink inside trap zone")
            )
          ),
          Link(href="https://bing.com", target="_blank", "Hyperlink outside trap zone")
        )
      })
    }
  )
}

examples$FocusTrapZone <- makeFocusTrapZone()


# FocusZone


makeFocusZone <- function() {
  tokens <- list(childrenGap = 20)

  list(
    ui = Stack(
      tokens = tokens,
      horizontalAlign = "start",
      FocusZone(
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Enabled FocusZone:"),
          DefaultButton(text = "Button 1"),
          DefaultButton(text = "Button 2"),
          TextField(placeholder = "FocusZone TextField"),
          DefaultButton(text = "Button 3")
        )
      ),
      DefaultButton(text = "Tabbable Element 1"),
      FocusZone(
        disabled = TRUE,
        Stack(
          tokens = tokens,
          horizontal = TRUE,
          verticalAlign = "center",
          tags$span("Disabled FocusZone:"),
          DefaultButton(text = "Button 1"),
          DefaultButton(text = "Button 2")
        )
      ),
      TextField(placeholder = "Tabbable Element 2")
    ),
    server = function(input, output) {}
  )
}

examples$FocusZone <- makeFocusZone()


# GroupedList


makeGroupedList <- function() {
  list(
    ui = GroupedList(
      items = list("Item A", "Item B", "Item C", "Item D", "Item E"),
      groups = list(
        list(key = "g1", name = "Some items", startIndex = 0, count = 2),
        list(key = "g2", name = "More items", startIndex = 2, count = 3)
      ),
      selectionMode = 0,
      onRenderCell = JS("(depth, item) => (
        jsmodule['react'].createElement('span', { style: { paddingLeft: 49 } }, item)
      )")
    ),
    server = function(input, output) {}
  )
}

examples$GroupedList <- makeGroupedList()


# HoverCard


makeHoverCard <- function() {
  list(
    ui = HoverCard(
      type = "PlainCard",
      plainCardProps = JS("{
        onRenderPlainCard: (a, b, c) => 'HoverCard contents',
        style: { margin: 10 }
      }"),
      "Hover over me"
    ),
    server = function(input, output) {}
  )
}

examples$HoverCard <- makeHoverCard()


# Icon


makeIcon <- function() {
  style <- list(fontSize = 50, margin = 10)
  list(
    ui = tags$div(
      FontIcon(iconName = "CompassNW", style = style),
      FontIcon(iconName = "Dictionary", style = style),
      FontIcon(iconName = "TrainSolid", style = style)
    ),
    server = function(input, output) {}
  )
}

examples$Icon <- makeIcon()


# Image


makeImage <- function() {
  list(
    ui = Image(src = "http://placehold.it/350x150"),
    server = function(input, output) {}
  )
}

examples$Image <- makeImage()


# Keytips


makeKeytips <- function() {
  list(
    ui = tagList(
      textOutput("keytipsResult"),
      div(
        Label("To open keytips, hit 'Alt-Windows' on Windows/Linux and 'Option-Control' on macOS. Keytips will appear. Type what you see, e.g. 1 and then A to 'click' the first button."),
        Label("When multiple Keytips start with the same character, typing that character will filter the visible keytips."),
        KeytipLayer(),
        Stack(horizontal = TRUE, tokens = list(childrenGap = 20),
          DefaultButton.shinyInput("button1", keytipProps = JS("keytipMap.Button"), text = "Button"),
          CompoundButton.shinyInput("button2",
            style = list(marginBottom = 28),
            keytipProps = JS("keytipMap.CompoundButton"),
            text = "Compound Button",
            secondaryText = 'With a Keytip'
          ),
          DefaultButton.shinyInput("button3",
            keytipProps = JS("keytipMap.ButtonWithMenu"),
            text = "Button with Menu",
            menuProps = JS("buttonProps")
          )
        )
      )
    ),
    server = function(input, output) {
      clicks <- reactiveVal(0)
      addClick <- function() clicks(clicks() + 1)
      output$keytipsResult <- renderText(paste("Buttons clicked: ", clicks()))
      observeEvent(input$button1, addClick())
      observeEvent(input$button2, addClick())
      observeEvent(input$button3, addClick())
    }
  )
}

examples$Keytips <- makeKeytips()


# Label


makeLabel <- function() {
  list(
    ui = Label("Required label", required = TRUE),
    server = function(input, output) {}
  )
}

examples$Label <- makeLabel()


# LayerHost


makeLayerHost <- function() {
  list(
    ui = div(
      LayerHost(id = "host", style = list(border = "1px dashed", padding = 10)),
      "Layer children are rendered in the LayerHost",
      Layer(hostId = "host", "Content")
    ),
    server = function(input, output) {}
  )
}

examples$LayerHost <- makeLayerHost()


# Layer


makeLayer <- function() {
  list(
    ui = div(
      style = "margin-top: 60px; border: 1px solid navy; padding: 10px; background: #eee;",
      Checkbox.shinyInput("useLayer", value = FALSE, label = "Display a message in a layer"),
      reactOutput("layer")
    ),
    server = function(input, output) {
      output$layer <- renderReact({
        box <- div(
          style = "background-color: #60C7FF; margin: 10px; padding: 10px",
          "Hello!"
        )
        if (isTRUE(input$useLayer)) Layer(box)
      })
    }
  )
}

examples$Layer <- makeLayer()


# Link


makeLink <- function() {
  list(
    ui = Link(href = "https://appsilon.com", "Appsilon"),
    server = function(input, output) {}
  )
}

examples$Link <- makeLink()


# List


makeList <- function() {
  items <- do.call(paste0, replicate(20, sample(LETTERS, 200, TRUE), FALSE))
  list(
    ui = div(
      style = "overflow: auto; max-height: 400px",
      List(
        items = items,
        onRenderCell = JS("(item, index) => `${index} ${item}`")
      )
    ),
    server = function(input, output) {}
  )
}

examples$List <- makeList()


# MarqueeSelection
makeMarqueeSelection <- function() {
  MarqueeSelectionExample <- function(...) shiny.react::reactElement(
    module = "exampleApp", name = "MarqueeSelectionExample",
    props = shiny.react::asProps(...),
  )

  list(
    ui = tagList(
      div(
        textOutput("marqueeResult"),
        Label("Drag a rectangle around the items below to select them"), # Make sure Fluent dependency is loaded.
        reactOutput("marqueeSelection")
      )
    ),
    server = function(input, output) {
      photos <- lapply(1:50, function(index) {
        randomWidth <- 50 + sample.int(150, 1)
        list(
          key = index,
          url = paste0('http://placehold.it/', randomWidth, 'x100'),
          width = randomWidth,
          height = 100
        )
      })

      output$marqueeResult <- renderText({
        paste("You have selected: ", paste(input$selectedIndices, collapse = ", "))
      })

      output$marqueeSelection <- renderReact({
        MarqueeSelectionExample(
          name = "selectedIndices",
          photos = photos
        )
      })
    }
  )
}

examples$MarqueeSelection <- makeMarqueeSelection()


# MessageBar


makeMessageBar <- function() {
  list(
    ui = MessageBar("Message"),
    server = function(input, output) {}
  )
}

examples$MessageBar <- makeMessageBar()


# Modal


makeModal <- function() {
  list(
    ui = tagList(
      reactOutput("modal"),
      PrimaryButton.shinyInput("showModal", text = "Show modal"),
    ),
    server = function(input, output) {
      modalVisible <- reactiveVal(FALSE)
      observeEvent(input$showModal, modalVisible(TRUE))
      observeEvent(input$hideModal, modalVisible(FALSE))
      output$modal <- renderReact({
        Modal(isOpen = modalVisible(),
          Stack(tokens = list(padding = "15px", childrenGap = "10px"),
            div(style = list(display = "flex"),
              Text("Title", variant = "large"),
              div(style = list(flexGrow = 1)),
              IconButton.shinyInput("hideModal", iconProps = list(iconName = "Cancel")),
            ),
            div(
              p("A paragraph of text."),
              p("Another paragraph.")
            )
          )
        )
      })
    }
  )
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

  list(
    ui = Nav(
      groups = link_groups,
      selectedKey = "key1",
      styles = navigation_styles
    ),
    server = function(input, output) {}
  )
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
    jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
      role: 'menuitem',
      iconProps: { iconName: item.icon },
      styles: {
        root: { padding: '10px' }
      }
    })
  ")
  onRenderOverflowButton <- JS("overflowItems =>
    jsmodule['react'].createElement(jsmodule['@fluentui/react'].CommandBarButton, {
      role: 'menuitem',
      title: 'More items',
      styles: {
        root: { padding: '10px' }
      },
      menuIconProps: { iconName: 'More' },
      menuProps: { items: overflowItems }
    })
  ")

  list(
    ui = OverflowSet(
      vertical = TRUE,
      items = items,
      overflowItems = overflowItems,
      onRenderItem = onRenderItem,
      onRenderOverflowButton = onRenderOverflowButton
    ),
    server = function(input, output) {}
  )
}

examples$OverflowSet <- makeOverflowSet()


# Overlay


makeOverlay <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("toggleOverlay", text = "Open Overlay"),
      reactOutput("overlay")
    ),
    server = function(input, output) {
      show <- reactiveVal(FALSE)
      observeEvent(input$toggleOverlay, show(!show()))
      output$overlay <- renderReact({
        if (show()) {
          Overlay(
            onClick = JS("function() { Shiny.setInputValue('toggleOverlay', Math.random()); }"),
            isDarkThemed = TRUE,
            div(
              style="background: white; width: 50vw; height: 20rem; margin: auto;",
              div(
                style = "padding: 2rem;",
                h1("Inside Overlay"),
                p("Click anywhere to hide.")
              )
            )
          )
        }
      })
    }
  )
}

examples$Overlay <- makeOverlay()


# Panel


makePanel <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("showPanel", text = "Open panel"),
      reactOutput("reactPanel")
    ),
    server = function(input, output) {
      isPanelOpen <- reactiveVal(FALSE)
      output$reactPanel <- renderReact({
        Panel(
          headerText = "Sample panel",
          isOpen = isPanelOpen(),
          "Content goes here.",
          onDismiss = JS("function() { Shiny.setInputValue('hidePanel', Math.random()); }")
        )
      })
      observeEvent(input$showPanel, isPanelOpen(TRUE))
      observeEvent(input$hidePanel, isPanelOpen(FALSE))
    }
  )
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

  list(
    ui = tagList(
      textOutput("selectedPeople"),
      NormalPeoplePicker.shinyInput(
        "selectedPeople",
        options = people,
        pickerSuggestionsProps = list(
          suggestionsHeaderText = 'Matching people',
          mostRecentlyUsedHeaderText = 'Sales reps',
          noResultsFoundText = 'No results found',
          showRemoveButtons = TRUE
        )
      )
    ),
    server = function(input, output) {
      output$selectedPeople <- renderText({
        if (length(input$selectedPeople) == 0) {
          "Select recipients below:"
        } else {
          selectedPeople <- dplyr::filter(people, key %in% input$selectedPeople)
          paste("You have selected:", paste(selectedPeople$text, collapse=", "))
        }
      })
    }
  )
}

examples$PeoplePicker <- makePeoplePicker()


# Persona


makePersona <- function() {
  list(
    ui = Persona(
      imageInitials = "AL",
      text = "Annie Lindqvist",
      secondaryText = "Software Engineer",
      presence = 4
    ),
    server = function(input, output) {}
  )
}

examples$Persona <- makePersona()


# Pivot


makePivot <- function() {
  list(
    ui = Pivot(
      PivotItem(headerText = "Tab 1", Label("Hello 1")),
      PivotItem(headerText = "Tab 2", Label("Hello 2"))
    ),
    server = function(input, output) {}
  )
}

examples$Pivot <- makePivot()


# ProgressIndicator


makeProgressIndicator <- function() {
  list(
    ui = ProgressIndicator(
      label = "Example title",
      description = "Example description"
    ),
    server = function(input, output) {}
  )
}

examples$ProgressIndicator <- makeProgressIndicator()


# Rating


makeRating <- function() {
  list(
    ui = div(
      Rating.shinyInput("rating", value = 2),
      textOutput("ratingValue")
    ),
    server = function(input, output) {
      output$ratingValue <- renderText({
        sprintf("Value: %s", input$rating)
      })
    }
  )
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
      jsmodule['react'].createElement('div',
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
  list(
    ui = div(
      p("Resize the browser to see how the elements are hidden when they do not fit:"),
      ResizeGroup(
        data = data,
        onRenderData = onRenderData,
        onReduceData = onReduceData
      )
    ),
    server = function(input, output) {}
  )
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
      stringi::stri_rand_lipsum(paragraphs)
    )
  )
  list(
    ui = ScrollablePane(
      styles = list(
        root = list(position = "relative", height = "500px", width = "400px")
      ),
      pane("Some text", 3),
      pane("A lot of text", 5),
      pane("Just a short ending", 1)
    ),
    server = function(input, output) {}
  )
}

examples$ScrollablePane <- makeScrollablePane()


# SearchBox


makeSearchBox <- function() {
  list(
    ui = div(
      SearchBox.shinyInput("search", placeholder = "Search"),
      textOutput("searchValue")
    ),
    server = function(input, output) {
      output$searchValue <- renderText({
        sprintf("Value: %s", input$search)
      })
    }
  )
}

examples$SearchBox <- makeSearchBox()


# Separator


makeSeparator <- function() {
  list(
    ui = Separator("Text"),
    server = function(input, output) {}
  )
}

examples$Separator <- makeSeparator()


# Shimmer


makeShimmer <- function() {
  list(
    ui = tagList(
      div(
        p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
        Shimmer(),
        Shimmer(width = "75%"),
        Shimmer(width = "50%")
      ),
      tags$head(tags$style(
        ".ms-Shimmer-container { margin: 10px 0 }"
      ))
    ),
    server = function(input, output) {}
  )
}

examples$Shimmer <- makeShimmer()


# Slider


makeSlider <- function() {
  list(
    ui = div(
      Slider.shinyInput("slider", value = 42, min = -100, max = 100),
      textOutput("sliderValue")
    ),
    server = function(input, output) {
      output$sliderValue <- renderText({
        sprintf("Value: %s", input$slider)
      })
    }
  )
}

examples$Slider <- makeSlider()


# SpinButton


makeSpinButton <- function() {
  list(
    ui = div(
      SpinButton.shinyInput("spin", value = 15, min = 0, max = 50, step = 5),
      textOutput("spinValue")
    ),
    server = function(input, output) {
      output$spinValue <- renderText({
        sprintf("Value: %s", input$spin)
      })
    }
  )
}

examples$SpinButton <- makeSpinButton()


# Spinner


makeSpinner <- function() {
  list(
    ui = Spinner(size = 3, label = "Loading, please wait..."),
    server = function(input, output) {}
  )
}

examples$Spinner <- makeSpinner()


# Stack


makeStack <- function() {
  list(
    ui = Stack(
      tokens = list(childrenGap = 10),
      reversed = TRUE,
      span("Item One"),
      span("Item Two"),
      span("Item Three")
    ),
    server = function(input, output) {}
  )
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

  list(
    ui = div(
      SwatchColorPicker.shinyInput("color", value = "orange",
        colorCells = colorCells, columnCount = length(colorCells)
      ),
      textOutput("swatchValue")
    ),
    server = function(input, output) {
      output$swatchValue <- renderText({
        sprintf("Value: %s", input$color)
      })
    }
  )
}

examples$SwatchColorPicker <- makeSwatchColorPicker()


# TagPicker


makeTagPicker <- function() {
  list(
    ui = tagList(
      textOutput("selectedTags"),
      TagPicker(
        onResolveSuggestions = JS("filterSuggestedTags"),
        onEmptyInputFocus = JS("function(tagList) { return testTags.filter(tag => !listContainsTagList(tag, tagList)); }"),
        getTextFromItem = JS("function(item) { return item.text }"),
        pickerSuggestionsProps = list(suggestionsHeaderText = 'Suggested tags', noResultsFoundText = 'No color tags found'),
        itemLimit = 2,
        onChange = JS("function(selection) { Shiny.setInputValue('selectedTags', JSON.stringify(selection)) }")
      )
    ),
    server = function(input, output) {
      output$selectedTags <- renderText({
        if (is.null(input$selectedTags)) {
          "Select up to 2 colors below:"
        } else {
          paste("You have selected:", paste(jsonlite::fromJSON(input$selectedTags)$name, collapse = ", "))
        }
      })
    }
  )
}

examples$TagPicker <- makeTagPicker()


# TeachingBubble


makeTeachingBubble <- function() {
  list(
    ui = div(
      DefaultButton.shinyInput("toggleTeachingBubble", id = "target", text = "Toggle TeachingBubble"),
      reactOutput("teachingBubble")
    ),
    server = function(input, output) {
      showBubble <- reactiveVal(FALSE)
      observeEvent(input$toggleTeachingBubble, showBubble(!showBubble()))
      output$teachingBubble <- renderReact({
        if (showBubble()) {
          TeachingBubble(
            target = "#target",
            headline = "Very useful!"
          )
        }
      })
    }
  )
}

examples$TeachingBubble <- makeTeachingBubble()


# TextField


makeTextField <- function() {
  list(
    ui = div(
      TextField.shinyInput("text"),
      textOutput("textValue")
    ),
    server = function(input, output) {
      output$textValue <- renderText({
        sprintf("Value: %s", input$text)
      })
    }
  )
}

examples$TextField <- makeTextField()


# Text


makeText <- function() {
  list(
    ui = Text(variant = "xLarge", "Some text with a nice Fluent UI font"),
    server = function(input, output) {}
  )
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
  list(
    ui = div(
      Toggle.shinyInput("toggle", value = TRUE),
      textOutput("toggleValue")
    ),
    server = function(input, output) {
      output$toggleValue <- renderText({
        sprintf("Value: %s", input$toggle)
      })
    }
  )
}

examples$Toggle <- makeToggle()


# Tooltip


makeTooltip <- function() {
  list(
    ui = TooltipHost(
      content = "This is the tooltip content",
      delay = 0,
      Text("Hover over me")
    ),
    server = function(input, output) {}
  )
}

examples$Tooltip <- makeTooltip()
