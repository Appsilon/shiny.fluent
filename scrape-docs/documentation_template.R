{{#pages}}
#' {{name}}
#'
#' @description
#' {{docs.overview}}
#'
#'
{{#link}}
#' For more details and examples visit the [official docs]({{.}}).
#' The R package cannot handle each and every case, so for advanced use cases
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
{{#props}}
#' * \bold{ {{name}} } `{{type}}` \cr {{description}}
{{/props}}
#'
#' @md
#' @name {{name}}
NULL

{{/pages}}
