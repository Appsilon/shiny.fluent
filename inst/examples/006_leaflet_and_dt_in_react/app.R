library(shiny.fluent)
library(leaflet)
library(DT)

ui <- fluidPage(
  titlePanel("Leaflet - a custom output inside React"),
  div(style = "display: none", leafletOutput("elo")),
  Stack(
    div(
      h3("Leaflet output"),
      PrimaryButton.shinyInput("recalc", text = "Refresh points"),
      p(),
      p("Leaflet output works inside JSX context"),
      leafletOutput("mymap"),
      h3("Pivot"),
      p("And inside a Pivot"),
      Pivot(
        PivotItem(headerText = "Tab 1",
          Label("Hello 1")
        ),
        PivotItem(headerText = "Leaflet inside a Pivot",
          leafletOutput("mymap3")
        ),
        PivotItem(headerText = "DT inside a Pivot",
          DTOutput("my_dt"),
          uiOutput("dt_interaction_output")
        ),
        PivotItem(headerText = "Shiny input",
          textInput("shinyinput", label = "Shiny input test", value = "initial"),
          textOutput("shinyoutput")
        ),
        PivotItem(headerText = "Shiny inputs initially hidden",
          textInput("shinyinput2", label = "Shiny input test"),
          textOutput("shinyoutput2")
        ),
        PivotItem(headerText = "Tab 2",
          Label("Hello 2")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  points <- eventReactive(input$recalc, {
    cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
  }, ignoreNULL = FALSE)

  output$mymap <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points())
  })

  output$mymap3 <- renderLeaflet({
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points())
  })

  output$shinyoutput <- renderText({
    input$shinyinput
  })

  output$shinyoutput2 <- renderText({
    input$shinyinput2
  })

  output$my_dt <- renderDT(iris, options = list(lengthChange = FALSE))

  output$dt_interaction_output <- renderUI({
    div(
      h3("Communication from DT back to Shiny works as well!"),
      h5(paste("Rows selected:", paste(input$my_dt_rows_selected, collapse = ", ")))
    )
  })
}

shinyApp(ui, server)
