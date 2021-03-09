# ---- libraries ----
library(shiny)
library(shiny.fluent)
library(shiny.router)
library(sass)
library(leaflet)
library(ggplot2)
library(plotly)
library(glue)
library(dplyr)

# ---- debug-mode ----
shiny.react::enable_react_debug_mode()

# ---- pages ----

makePage <- function (title, subtitle, contents) {
  tagList(div(
    class = "page-title",
    span(title, class = "ms-fontSize-32 ms-fontWeight-semibold", style =
           "color: #323130"),
    span(subtitle, class = "ms-fontSize-14 ms-fontWeight-regular", style =
           "color: #605E5C; margin: 14px;")
  ),
  contents)
}

# ---- cards ----
makeCard <- function(title, content, size = 12, style = "") {
  div(class = glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
      style = style,
      Stack(
        tokens = list(childrenGap = 5),
        Text(variant = "large", title, block = TRUE),
        content
      ))
}

HorizontalStack <- function(...) {
  Stack(
    horizontal = TRUE,
    tokens = list(childrenGap = 10),
    ...
  )
}


#### HEADER
header <- tagList(
  img(src = "appsilon-logo.png", class = "logo"),
  div(Text(variant = "xLarge", "Sales Reps Analysis"), class = "title"),
  CommandBar(
    items = list(
      CommandBarItem("New", "Add", subitems = list(
        CommandBarItem("Email message", "Mail", key = "emailMessage", href = "mailto:me@example.com"),
        CommandBarItem("Calendar event", "Calendar", key = "calendarEvent")
      )),
      CommandBarItem("Upload sales plan", "Upload"),
      CommandBarItem("Share analysis", "Share"),
      CommandBarItem("Download report", "Download")
    ),
    farItems = list(
      CommandBarItem("Grid view", "Tiles", iconOnly = TRUE),
      CommandBarItem("Info", "Info", iconOnly = TRUE)
    ),
    style = list(width = "100%")))


#### NAVIGATION

navigation <- Nav(
  groups = list(
    list(links = list(
      list(name = 'Home', url = '#!/', key = 'home', icon = 'Home'),
      list(name = 'Analysis', url = '#!/other', key = 'analysis', icon = 'AnalyticsReport'),
      list(name = 'shiny.fluent', url = 'http://github.com/Appsilon/shiny.fluent', key = 'repo', icon = 'GitGraph'),
      list(name = 'shiny.react', url = 'http://github.com/Appsilon/shiny.react', key = 'shinyreact', icon = 'GitGraph'),
      list(name = 'Appsilon', url = 'http://appsilon.com', key = 'appsilon', icon = 'WebAppBuilderFragment')
    ))
  ),
  initialSelectedKey = 'home',
  styles = list(
    root = list(
      height = '100%',
      boxSizing = 'border-box',
      border = '1px solid #eee',
      overflowY = 'auto'
    )
  )
)


#### FOOTER

footer <- Stack(
  horizontal = TRUE,
  horizontalAlign = 'space-between',
  tokens = list(childrenGap = 20),
  Text(variant = "medium", "Built with ❤ by Appsilon", block=TRUE),
  Text(variant = "medium", nowrap = FALSE, "If you'd like to learn more, reach out to us at hello@appsilon.com"),
  Text(variant = "medium", nowrap = FALSE, "All rights reserved.")
)


#### LAYOUT

layout <- function(mainUI){
  div(class = "grid-container",
      div(class = "header", header),
      div(class = "sidenav", navigation),
      div(class = "main", mainUI),
      div(class = "footer", footer)
  )
}

# Add shiny.router dependencies manually: they are not picked up because they're added in a non-standard way.
shiny::addResourcePath("shiny.router", system.file("www", package = "shiny.router"))
shiny_router_js_src <- file.path("shiny.router", "shiny.router.js")
shiny_router_script_tag <- shiny::tags$script(type = "text/javascript", src = shiny_router_js_src)



#### HOME PAGE

card1 <- makeCard(
  "Welcome to shiny.fluent demo!",
  div(
    Text("shiny.fluent is a package that allows you to build Shiny apps using Microsoft's Fluent UI."),
    Text("Use the menu on the left to explore live demos of all available components.")
  ))

card2 <- makeCard(
  "shiny.react makes it easy to use React libraries in Shiny apps.",
  div(
    Text("To make a React library convenient to use from Shiny, we need to write an R package that wraps it - for example, a shiny.fluent package for Microsoft's Fluent UI, or shiny.blueprint for Palantir's Blueprint.js."),
    Text("Communication and other issues in integrating Shiny and React are solved and standardized in shiny.react package."),
    Text("shiny.react strives to do as much as possible automatically, but there's no free lunch here, so in all cases except trivial ones you'll need to do some amount of manual work. The more work you put into a wrapper package, the less work your users will have to do while using it.")
  ))

homePage <- makePage(
  "This is a Fluent UI app built in Shiny",
  "shiny.react + Fluent UI = shiny.fluent",
  div(card1, card2)
)


#### ANALYSIS PAGE

filters <- Stack(
  tokens = list(childrenGap = 10),
  HorizontalStack(
    DatePicker("fromDate", value = as.Date('2020/01/01'), label = "From date"),
    DatePicker("toDate", value = as.Date('2020/12/31'), label = "To date")
  ),
  Label("Filter by sales reps", className = "my_class"),
  NormalPeoplePicker(
    "selectedPeople",
    className = "my_class",
    options = fluent_people,
    pickerSuggestionsProps = list(
      suggestionsHeaderText = 'Matching people',
      mostRecentlyUsedHeaderText = 'Sales reps',
      noResultsFoundText = 'No results found',
      showRemoveButtons = TRUE
    )
  ),
  Slider("slider",
         0,
         min = 0,
         max = 1000000,
         label = "Minimum amount",
         step = 100000,
         valueFormat = JS("function(x) { return '$' + x}"),
         snapToStep = TRUE),
  Toggle("closedOnly", value = TRUE, label = "Include closed deals only?")
)

analysisPage <- makePage(
  "Sales representatives",
  "Best performing reps",
  div(
    HorizontalStack(
      makeCard("Filters", filters, size = 4, style = "max-height: 320px"),
      makeCard("Deals count", plotlyOutput("plot"), size = 8, style = "max-height: 320px")
    ),
    uiOutput("filteredSalesReps")
  )
)


#### MAIN UI AND ROUTER

router <- make_router(
  route("/", homePage),
  route("other", analysisPage))

sass(
  sass_file("style.scss"),
  output = "www/style.css"
)

ui <- fluentPage(
  withReact(
    layout(router$ui)
  ),
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    shiny_router_script_tag
  ))


#### SERVER

details_list_columns <- tibble(
  fieldName = c("rep_name", "date", "deal_amount", "client_name", "city", "is_closed"),
  name = c("Sales rep", "Close date", "Amount", "Client", "City", "Is closed?"),
  key = fieldName)

server <- function(input, output, session) {
  router$server(input, output, session)
  
  filteredDeals <- reactive({
    selectedPeopleKeys <- if (!is.null(input$selectedPeople) && input$selectedPeople != "") input$selectedPeople else list()
    if (length(selectedPeopleKeys) == 0) {
      selectedPeopleKeys <- fluent_people$key
    }
    minClosedVal <- if(input$closedOnly == TRUE) 1 else 0
    
    filteredDeals <- fluent_sales_deals %>% filter(
      rep_id %in% selectedPeopleKeys,
      date >= input$fromDate,
      date <= input$toDate,
      deal_amount >= input$slider,
      is_closed >= minClosedVal) %>%
      mutate(is_closed = ifelse(is_closed == 1, "Yes", "No"))
  })
  
  output$map <- renderLeaflet({
    points <- cbind(filteredDeals()$LONGITUDE, filteredDeals()$LATITUDE)
    leaflet() %>%
      addProviderTiles(providers$Stamen.TonerLite, options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(data = points)
  })
  
  output$plot <- renderPlotly({
    p <- ggplot(filteredDeals(), aes(x = rep_name)) +
      geom_bar(fill = unique(filteredDeals()$color)) +
      ylab("Number of deals") +
      xlab("Sales rep") +
      theme_light()
    ggplotly(p, height = 300)
  })
  
  output$filteredSalesReps <- renderUI({
    items_list <- if(nrow(filteredDeals()) > 0){
      DetailsList(items = filteredDeals(), columns = details_list_columns)
    } else {
      p("No matching transactions.")
    }
    
    withReact(
      HorizontalStack(
        makeCard("Top results", div(style="max-height: 500px; overflow: auto", items_list)),
        makeCard("Map", leafletOutput("map"))
      )
    )
  })
}

shinyApp(ui, server)
