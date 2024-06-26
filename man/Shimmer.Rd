% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/components.R, R/documentation.R, R/examples.R
\name{Shimmer}
\alias{Shimmer}
\alias{ShimmerElementsGroup}
\alias{ShimmeredDetailsList}
\title{Shimmer}
\usage{
Shimmer(...)

ShimmerElementsGroup(...)

ShimmeredDetailsList(...)
}
\arguments{
\item{...}{Props to pass to the component.
The allowed props are listed below in the \bold{Details} section.}
}
\value{
Object with \code{shiny.tag} class suitable for use in the UI of a Shiny app.
}
\description{
Shimmer is a temporary animation placeholder for when a service call takes time to return data and we don't want to block rendering the rest of the UI.

If a smooth transition from Shimmer to content is desired, wrap the content node with a Shimmer element and use the \code{isDataLoaded} prop to trigger the transition. In cases where the content node is not wrapped in a Shimmer, use the \code{shimmerElements} or \code{customElementsGroup} props, and once data arrives, manually replace the Shimmer UI with the intended content. See the examples below for reference.

For more details and examples visit the \href{https://developer.microsoft.com/en-us/fluentui#/controls/web/Shimmer}{official docs}.
The R package cannot handle each and every case, so for advanced use cases
you need to work using the original docs to achieve the desired result.
}
\details{
\itemize{
\item \bold{ borderStyle } \code{IRawStyle} \cr Use to set custom styling of the shimmerCircle borders.
\item \bold{ componentRef } \verb{IRefObject<IShimmerCircle>} \cr Optional callback to access the IShimmerCircle interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ height } \code{number} \cr Sets the height of the circle.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IShimmerCircleStyleProps, IShimmerCircleStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ backgroundColor } \code{string} \cr Defines the background color of the space in between and around shimmer elements.
\item \bold{ componentRef } \verb{IRefObject<IShimmerElementsGroup>} \cr Optional callback to access the IShimmerElementsGroup interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ flexWrap } \code{boolean} \cr Optional boolean for enabling flexWrap of the container containing the shimmerElements.
\item \bold{ rowHeight } \code{number} \cr Optional maximum row height of the shimmerElements container.
\item \bold{ shimmerElements } \code{IShimmerElement[]} \cr Elements to render in one group of the Shimmer.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IShimmerElementsGroupStyleProps, IShimmerElementsGroupStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ width } \code{string} \cr Optional width for ShimmerElements container.
\item \bold{ borderStyle } \code{IRawStyle} \cr Use to set custom styling of the shimmerGap borders.
\item \bold{ componentRef } \verb{IRefObject<IShimmerGap>} \cr Optional callback to access the IShimmerGap interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ height } \code{number} \cr Sets the height of the gap.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IShimmerGapStyleProps, IShimmerGapStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ width } \code{number | string} \cr Sets width value of the gap.
\item \bold{ borderStyle } \code{IRawStyle} \cr Use to set custom styling of the shimmerLine borders.
\item \bold{ componentRef } \verb{IRefObject<IShimmerLine>} \cr Optional callback to access the IShimmerLine interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ height } \code{number} \cr Sets the height of the rectangle.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IShimmerLineStyleProps, IShimmerLineStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ width } \code{number | string} \cr Sets width value of the line.
\item \bold{ ariaLabel } \code{string} \cr Localized string of the status label for screen reader
\item \bold{ className } \code{string} \cr Additional CSS class(es) to apply to the Shimmer container.
\item \bold{ componentRef } \verb{IRefObject<IShimmer>} \cr Optional callback to access the IShimmer interface. Use this instead of ref for accessing the public methods and properties of the component.
\item \bold{ customElementsGroup } \code{React.ReactNode} \cr Custom elements when necessary to build complex placeholder skeletons.
\item \bold{ isDataLoaded } \code{boolean} \cr Controls when the shimmer is swapped with actual data through an animated transition.
\item \bold{ shimmerColors } \code{IShimmerColors} \cr Defines an object with possible colors to pass for Shimmer customization used on different backgrounds.
\item \bold{ shimmerElements } \code{IShimmerElement[]} \cr Elements to render in one line of the Shimmer.
\item \bold{ styles } \verb{IStyleFunctionOrObject<IShimmerStyleProps, IShimmerStyles>} \cr Call to provide customized styling that will layer on top of the variant rules.
\item \bold{ theme } \code{ITheme} \cr Theme provided by High-Order Component.
\item \bold{ width } \code{number | string} \cr Sets the width value of the shimmer wave wrapper.
}
}
\examples{
library(shiny)
library(shiny.fluent)

ui <- function(id) {
  ns <- NS(id)
  tagList(
    div(
      p("Basic Shimmer with no elements provided. It defaults to a line of 16px height."),
      Shimmer(),
      Shimmer(width = "75\%"),
      Shimmer(width = "50\%")
    ),
    tags$head(tags$style(
      ".ms-Shimmer-container { margin: 10px 0 }"
    ))
  )
}

server <- function(id) {
  moduleServer(id, function(input, output, session) {})
}

if (interactive()) {
  shinyApp(ui("app"), function(input, output) server("app"))
}
}
