library(shiny)
library(shiny.fluent)

makeScript <- function(js) {
  tagList(
    shiny.react::reactDependency(),
    htmltools::htmlDependency(
      name = "KeytipsExample",
      version = "0", # Not used.
      src = c(href = ""), # Not used.
      head = paste0("<script>", js, "</script>")
    )
  )
}

ui <- function(id) {
  ns <- NS(id)
  tagList(
    makeScript(paste0("setTimeout(() => {
      const btnExecute = (el) => {
        el.click();
      };

      const keytipConfig = {
        keytips: [
          // Button example
          {
            id: 'Button',
            content: '1A',
            optionalProps: {
              onExecute: btnExecute,
            },
          },
          {
            id: 'CompoundButton',
            content: '1B',
            optionalProps: {
              onExecute: btnExecute,
            },
          },
          {
            id: 'ButtonWithMenu',
            content: '2A',
            optionalProps: {
              onExecute: btnExecute,
            },
            children: [
              {
                id: 'ButtonMenuItem1',
                content: 'E',
                optionalProps: {
                  onExecute: btnExecute,
                },
              },
              {
                id: 'ButtonMenuItem2',
                content: '8',
                optionalProps: {
                  onExecute: btnExecute,
                },
              },
            ],
          }
        ],
      };

      keytipMap = jsmodule['@fluentui/react'].buildKeytipConfigMap(keytipConfig);

      window.buttonProps = {
        items: [
          {
            key: 'buttonMenuItem1',
            text: 'Menu Item 1',
            keytipProps: keytipMap.ButtonMenuItem1,
            onClick: () => Shiny.setInputValue('", ns("button3"), "', Math.random())
          },
          {
            key: 'buttonMenuItem2',
            text: 'Menu Item 2',
            keytipProps: keytipMap.ButtonMenuItem2,
            onClick: () => Shiny.setInputValue('", ns("button3"), "', Math.random())
          },
        ],
      };
    })")),
    textOutput(ns("keytipsResult")),
    div(
      Label(
        paste0(
          "To open keytips, hit 'Alt-Windows' on Windows/Linux and 'Option-Control' on macOS.",
          "Keytips will appear. Type what you see, e.g. 1 and then A to 'click' the first button."
        )
      ),
      Label(
        paste0(
          "When multiple Keytips start with the same character,",
          "typing that character will filter the visible keytips."
        )
      ),
      KeytipLayer(),
      Stack(horizontal = TRUE, tokens = list(childrenGap = 20),
        DefaultButton.shinyInput(
          ns("button1"),
          keytipProps = JS("keytipMap.Button"),
          text = "Button"
        ),
        CompoundButton.shinyInput(
          ns("button2"),
          style = list(marginBottom = 28),
          keytipProps = JS("keytipMap.CompoundButton"),
          text = "Compound Button",
          secondaryText = 'With a Keytip'
        ),
        DefaultButton.shinyInput(
          ns("button3"),
          keytipProps = JS("keytipMap.ButtonWithMenu"),
          text = "Button with Menu",
          menuProps = JS("buttonProps")
        )
      )
    )
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    clicks <- reactiveVal(0)
    addClick <- function() clicks(clicks() + 1)
    output$keytipsResult <- renderText(paste("Buttons clicked: ", clicks()))
    observeEvent(input$button1, addClick())
    observeEvent(input$button2, addClick())
    observeEvent(input$button3, addClick())
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
