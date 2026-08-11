# ActivityItem

An activity item (`ActivityItem`) represents a person's actions, such as
making a comment, mentioning someone with an @mention, editing a
document, or moving a file.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/ActivityItem).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
ActivityItem(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **activityDescription** `React.ReactNode[] | React.ReactNode`  
  An element describing the activity that took place. If no
  activityDescription, activityDescriptionText, or
  onRenderActivityDescription are included, no description of the
  activity is shown.

- **activityDescriptionText** `string`  
  Text describing the activity that occurred and naming the people
  involved in it. Deprecated, use `activityDescription` instead.

- **activityIcon** `React.ReactNode`  
  An element containing an icon shown next to the activity item.

- **activityPersonas** `Array<IPersonaSharedProps>`  
  If activityIcon is not set, then the persona props in this array will
  be used as the icon for this activity item.

- **animateBeaconSignal** `boolean`  
  Enables/Disables the beacon that radiates from the center of the
  center of the activity icon. Signals an activity has started.

- **beaconColorOne** `string`  
  Beacon color one

- **beaconColorTwo** `string`  
  Beacon color two

- **comments** `React.ReactNode[] | React.ReactNode`  
  An element containing the text of comments or \\mention messages. If
  no comments, commentText, or onRenderComments are included, no
  comments are shown.

- **commentText** `string`  
  Text of comments or \\mention messages. Deprecated, use `comments`
  instead.

- **isCompact** `boolean`  
  Indicated if the compact styling should be used.

- **onRenderActivityDescription**
  `IRenderFunction<IActivityItemProps>`  
  A renderer for the description of the current activity.

- **onRenderComments** `IRenderFunction<IActivityItemProps>`  
  A renderer that adds the text of a comment below the activity
  description.

- **onRenderIcon** `IRenderFunction<IActivityItemProps>`  
  A renderer to create the icon next to the activity item.

- **onRenderTimeStamp** `IRenderFunction<IActivityItemProps>`  
  A renderer adds a time stamp. If not included, timeStamp is shown as
  plain text below the activity.

- **styles** `IActivityItemStyles`  
  Optional styling for the elements within the Activity Item.

- **timeStamp** `string | React.ReactNode[] | React.ReactNode`  
  Element shown as a timestamp on this activity. If not included, no
  timestamp is shown.

## Best practices

### Layout

- Use a list of multiple activity items to indicate a history of events
  relating to a single file, folder, person, or other entity.
  Alternatively, use a single activity item to indicate the most recent
  event on an entity.

- Group multiple similar events occurring near the same time into a
  single activity item.

## Examples

``` r
library(shiny)
#> 
#> Attaching package: ‘shiny’
#> The following object is masked from ‘package:shiny.fluent’:
#> 
#>     runExample
library(shiny.fluent)

ui <- function(id) {
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
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
