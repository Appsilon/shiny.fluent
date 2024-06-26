% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components.R, R/documentation.R, R/examples.R
\name{Panel}
\alias{Panel}
\title{Panel}
\usage{
Panel(...)
}
\arguments{
\item{...}{Props to pass to the component.
The allowed props are listed below in the \bold{Details} section.}
}
\value{
Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
}
\description{
Panels are overlays that contain supplementary content and are used for complex creation, edit, or management experiences.  For example, viewing details about an item in a list or editing settings.

For more details and examples visit the \href{https://developer.microsoft.com/en-us/fluentui#/controls/web/Panel}{official docs}.
The R package cannot handle each and every case, so for advanced use cases
you need to work using the original docs to achieve the desired result.
}
\details{
\itemize{
\item \bold{ allowTouchBodyScroll } \code{boolean} \cr Allow body scroll on content and overlay on touch devices. Changing after mounting has no effect.
\item \bold{ className } \code{string} \cr Additional css class to apply to the Panel
\item \bold{ closeButtonAriaLabel } \code{string} \cr Aria label on close button
\item \bold{ componentId } \code{string} \cr Deprecated property. Serves no function.
\item \bold{ componentRef } \verb{IRefObject<IPanel>} \cr Optional callback to access the IPanel interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ customWidth } \code{string} \cr Custom panel width, used only when \code{type} is set to \code{PanelType.custom}.
\item \bold{ elementToFocusOnDismiss } \code{HTMLElement} \cr Sets the HTMLElement to focus on when exiting the FocusTrapZone.
\item \bold{ firstFocusableSelector } \code{string} \cr Indicates the selector for first focusable item. Deprecated, use \code{focusTrapZoneProps}.
\item \bold{ focusTrapZoneProps } \code{IFocusTrapZoneProps} \cr Optional props to pass to the FocusTrapZone component to manage focus in the panel.
\item \bold{ forceFocusInsideTrap } \code{boolean} \cr Indicates whether Panel should force focus inside the focus trap zone. If not explicitly specified, behavior aligns with FocusTrapZone's default behavior. Deprecated, use \code{focusTrapZoneProps}.
\item \bold{ hasCloseButton } \code{boolean} \cr Has the close button visible.
\item \bold{ headerClassName } \code{string} \cr Optional parameter to provider the class name for header text
\item \bold{ headerText } \code{string} \cr Header text for the Panel.
\item \bold{ headerTextProps } \verb{React.HTMLAttributes<HTMLDivElement>} \cr The props for header text container.
\item \bold{ ignoreExternalFocusing } \code{boolean} \cr Indicates if this Panel will ignore keeping track of HTMLElement that activated the Zone. Deprecated, use \code{focusTrapZoneProps}.
\item \bold{ isBlocking } \code{boolean} \cr Whether the panel uses a modal overlay or not
\item \bold{ isFooterAtBottom } \code{boolean} \cr Determines if content should stretch to fill available space putting footer at the bottom of the page
\item \bold{ isHiddenOnDismiss } \code{boolean} \cr Whether the panel is hidden on dismiss, instead of destroyed in the DOM. Protects the contents from being destroyed when the panel is dismissed.
\item \bold{ isLightDismiss } \code{boolean} \cr Whether the panel can be light dismissed.
\item \bold{ isOpen } \code{boolean} \cr Whether the panel is displayed. If true, will cause panel to stay open even if dismissed. If false, will cause panel to stay hidden. If undefined, will allow the panel to control its own visility through open/dismiss methods.
\item \bold{ layerProps } \code{ILayerProps} \cr Optional props to pass to the Layer component hosting the panel.
\item \bold{ onDismiss } \verb{(ev?: React.SyntheticEvent<HTMLElement>) => void} \cr A callback function for when the panel is closed, before the animation completes. If the panel should NOT be dismissed based on some keyboard event, then simply call ev.preventDefault() on it
\item \bold{ onDismissed } \verb{() => void} \cr A callback function which is called \strong{after} the Panel is dismissed and the animation is complete. (If you need to update the Panel's \code{isOpen} prop in response to a dismiss event, use \code{onDismiss} instead.)
\item \bold{ onLightDismissClick } \verb{() => void} \cr Optional custom function to handle clicks outside the panel in lightdismiss mode
\item \bold{ onOpen } \verb{() => void} \cr A callback function for when the Panel is opened, before the animation completes.
\item \bold{ onOpened } \verb{() => void} \cr A callback function for when the Panel is opened, after the animation completes.
\item \bold{ onOuterClick } \verb{() => void} \cr Optional custom function to handle clicks outside this component
\item \bold{ onRenderBody } \verb{IRenderFunction<IPanelProps>} \cr Optional custom renderer for body region. Replaces any children passed into the component.
\item \bold{ onRenderFooter } \verb{IRenderFunction<IPanelProps>} \cr Optional custom renderer for footer region. Replaces sticky footer.
\item \bold{ onRenderFooterContent } \verb{IRenderFunction<IPanelProps>} \cr Custom renderer for content in the sticky footer
\item \bold{ onRenderHeader } \code{IPanelHeaderRenderer} \cr Optional custom renderer for header region. Replaces current title
\item \bold{ onRenderNavigation } \verb{IRenderFunction<IPanelProps>} \cr Optional custom renderer navigation region. Replaces the region that contains the close button.
\item \bold{ onRenderNavigationContent } \verb{IRenderFunction<IPanelProps>} \cr Optional custom renderer for content in the navigation region. Replaces current close button.
\item \bold{ overlayProps } \code{IOverlayProps} \cr Optional props to pass to the Overlay component that the panel uses.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IPanelStyleProps, IPanelStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ type } \code{PanelType} \cr Type of the panel.
}
}
\section{Best practices}{
\subsection{Layout}{
\itemize{
\item Use for self-contained experiences where someone doesn’t need to interact with the app view to complete the task.
\item Consider how the panel and its contained contents will scale across responsive web breakpoints.
}
\subsection{Header}{
\itemize{
\item Include a close button in the top-right corner.
\item Lock the title to the top of the panel.
\item The header can contain a variety of components. Components are stacked under the main title, locked to the top, and push content down.
}
}

\subsection{Body}{
\itemize{
\item The body is a flexible container that can house a wide variety of components, content, and formatting.
\item Content can scroll.
}
}

\subsection{Footer}{
\itemize{
\item Standard footers include primary and secondary buttons to confirm or cancel the changes or task.
\item Read-only panels may contain a single Close button.
\item Lock the footer to the bottom of the panel.
}
}

}

\subsection{Content}{
\subsection{Title}{
\itemize{
\item Titles should explain the panel content in clear, concise, and specific terms.
\item Keep the length of the title to one line, if possible.
\item Use sentence-style capitalization—only capitalize the first word. For more info, see \verb{[Capitalization]} in the Microsoft Writing Style Guide.
\item Don’t put a period at the end of the title.
}

\verb{[capitalization]}: https://docs.microsoft.com/style-guide/capitalization
}

\subsection{Button labels}{
\itemize{
\item Be concise. Limit labels to one or two words. Usually a single verb is best. Include a noun if there’s any room for interpretation about what the verb means. For example, “Save” or “Save settings.”
}
}

}
}

\examples{
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  div(
    DefaultButton.shinyInput(ns("showPanel"), text = "Open panel"),
    reactOutput(ns("reactPanel"))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    isPanelOpen <- reactiveVal(FALSE)
    output$reactPanel <- renderReact({
      Panel(
        headerText = "Sample panel",
        isOpen = isPanelOpen(),
        "Content goes here.",
        onDismiss = JS(paste0(
          "function() {",
          "  Shiny.setInputValue('", ns("hidePanel"), "', Math.random());",
          "}"
        ))
      )
    })
    observeEvent(input$showPanel, isPanelOpen(TRUE))
    observeEvent(input$hidePanel, isPanelOpen(FALSE))
  })
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
}
