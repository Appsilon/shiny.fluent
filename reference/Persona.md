# Persona

A persona is a visual representation of a person across products,
typically showcasing the image that person has chosen to upload
themselves. The control can also be used to show that person's online
status.

The complete control inclues an individual's avatar (an uploaded image
or a composition of the person’s initials on a background color), their
name or identification, and online status.

The persona control is used in
the `PeoplePicker` and `Facepile` controls.

For more details and examples visit the [official
docs](https://developer.microsoft.com/en-us/fluentui#/controls/web/Persona).
The R package cannot handle each and every case, so for advanced use
cases you need to work using the original docs to achieve the desired
result.

## Usage

``` r
Persona(...)
```

## Arguments

- ...:

  Props to pass to the component. The allowed props are listed below in
  the **Details** section.

## Value

Object with `shiny.tag` class suitable for use in the UI of a Shiny app.

## Details

- **className** `string`  
  Additional css class to apply to the PersonaCoin

- **componentRef** `IRefObject<{}>`  
  Gets the component ref.

- **styles**
  `IStyleFunctionOrObject<IPersonaCoinStyleProps, IPersonaCoinStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **componentRef** `IRefObject<{}>`  
  Gets the component ref.

- **styles**
  `IStyleFunctionOrObject<IPersonaPresenceStyleProps, IPersonaPresenceStyles>`  
  Call to provide customized styling that will layer on top of the
  variant rules

- **className** `string`  
  Additional CSS class(es) to apply to the Persona

- **componentRef** `IRefObject<IPersona>`  
  Optional callback to access the IPersona interface. Use this instead
  of ref for accessing the public methods and properties of the
  component.

- **onRenderOptionalText** `IRenderFunction<IPersonaProps>`  
  Optional custom renderer for the optional text.

- **onRenderPrimaryText** `IRenderFunction<IPersonaProps>`  
  Optional custom renderer for the primary text.

- **onRenderSecondaryText** `IRenderFunction<IPersonaProps>`  
  Optional custom renderer for the secondary text.

- **onRenderTertiaryText** `IRenderFunction<IPersonaProps>`  
  Optional custom renderer for the tertiary text.

- **styles**
  `IStyleFunctionOrObject<IPersonaStyleProps, IPersonaStyles>`  
  Call to provide customized styling that will layer on top of variant
  rules

- **allowPhoneInitials** `boolean`  
  Whether initials are calculated for phone numbers and number
  sequences. Example: Set property to true to get initials for project
  names consisting of numbers only.

- **coinProps** `IPersonaCoinProps`  
  Optional HTML element props for Persona coin.

- **coinSize** `number`  
  Optional custom persona coin size in pixel.

- **hidePersonaDetails** `boolean`  
  Whether to not render persona details, and just render the persona
  image/initials.

- **imageAlt** `string`  
  Alt text for the image to use. Defaults to an empty string.

- **imageInitials** `string`  
  The user's initials to display in the image area when there is no
  image.

- **imageShouldFadeIn** `boolean`  
  If true, adds the css class 'is-fadeIn' to the image.

- **imageShouldStartVisible** `boolean`  
  If true, the image starts as visible and is hidden on error.
  Otherwise, the image is hidden until it is successfully loaded. This
  disables imageShouldFadeIn.

- **imageUrl** `string`  
  Url to the image to use, should be a square aspect ratio and big
  enough to fit in the image area.

- **initialsColor** `PersonaInitialsColor | string`  
  The background color when the user's initials are displayed.

- **isOutOfOffice** `boolean`  
  This flag can be used to signal the persona is out of office. This
  will change the way the presence icon looks for statuses that support
  dual-presence.

- **onPhotoLoadingStateChange**
  `(newImageLoadState: ImageLoadState) => void`  
  Optional callback for when loading state of the photo changes

- **onRenderCoin** `IRenderFunction<IPersonaSharedProps>`  
  Optional custom renderer for the coin

- **onRenderInitials** `IRenderFunction<IPersonaSharedProps>`  
  Optional custom renderer for the initials

- **onRenderPersonaCoin** `IRenderFunction<IPersonaSharedProps>`  
  Optional custom renderer for the coin

- **optionalText** `string`  
  Optional text to display, usually a custom message set. The optional
  text will only be shown when using size100.

- **presence** `PersonaPresence`  
  Presence of the person to display - will not display presence if
  undefined.

- **presenceColors**
  `{ available: string; away: string; busy: string; dnd: string; offline: string; oof: string; background: string; }`  
  The colors to be used for the presence-icon and it's background

- **presenceTitle** `string`  
  Presence title to be shown as a tooltip on hover over the presence
  icon.

- **primaryText** `string`  
  Primary text to display, usually the name of the person.

- **secondaryText** `string`  
  Secondary text to display, usually the role of the user.

- **showInitialsUntilImageLoads** `boolean`  
  If true renders the initials while the image is loading. This only
  applies when an imageUrl is provided.

- **showSecondaryText** `boolean`  

- **showUnknownPersonaCoin** `boolean`  
  If true, show the special coin for unknown persona. It has '?' in
  place of initials, with static font and background colors

- **size** `PersonaSize`  
  Decides the size of the control.

- **tertiaryText** `string`  
  Tertiary text to display, usually the status of the user. The tertiary
  text will only be shown when using size72 or size100.

- **text** `string`  
  Primary text to display, usually the name of the person.

- **theme** `ITheme`  
  Theme provided by High-Order Component.

## Best practices

### Layout

- Use the 24-pixel persona in text fields in read-only mode or in
  experiences like multicolumn lists which need compact persona
  representations.

- Use the 32-pixel persona in text fields in edit mode.

- Use the 32-pixel, 40-pixel, and 48-pixel persona in menus and list
  views.

- Use the 72-pixel and 100-pixel persona in profile cards and views.

### Content

- Change the values of the color swatches in high contrast mode.

## Examples

``` r
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  Persona(
    imageInitials = "AL",
    text = "Annie Lindqvist",
    secondaryText = "Software Engineer",
    presence = 4
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
```
