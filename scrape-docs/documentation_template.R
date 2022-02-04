{{#pages}}
#' {{name}}
#'
#' @param ... Props to pass to \code{shiny.react::reactElement}. See allowed props listed below in \bold{Details} section
#'
#' @description
#' {{docs.overview}}
#'
#'
{{#link}}
#' For more details and examples visit the official [docs]({{.}}).
#' The R package can not handle each and every case, so for advanced use cases
#' you need to work using the original docs to achieve the desired result.
{{/link}}
#'
{{#docs.bestPractices}}
#' # Best practices
#' {{.}}
{{/docs.bestPractices}}
#'
#' @details
#' 
#' \itemize{
{{#props}}
#' \item {\bold{ {{name}} }} {`{{type}}` \cr {{description}}}
{{/props}}
#' }
#' 
#' @md
#' @name {{name}}
NULL

{{/pages}}


#' Input docs template
#' 
#' @param inputId Id of the component
#' @param value Value 
#' @param session Session
#' @param ... Props to be passed
#' @name inputDoc
NULL
