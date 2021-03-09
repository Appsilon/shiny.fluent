# Contributing to shiny.fluent

We welcome contributions to shiny.fluent and shiny.react!

### Fixing typos

You're welcome to make small fixes in the documentation without discussing it - simply please go ahead and open a pull request with a change. If this is about R help, make sure to edit the `.R` file, not the processed docs in `.Rmd`

### Issues

Before you make a bigger pull request, please open an issue and make sure one of the maintainers agrees that this is a problem and with the proposed solution. If you've found a
bug, please create a bug report issue and illustrate the bug with a minimal
[reprex](https://www.tidyverse.org/help/#reprex).

### Pull request process

*  New code should follow the tidyverse [style guide](http://style.tidyverse.org).
*  We use [roxygen2](https://cran.r-project.org/package=roxygen2) for documentation, with a preference for
[Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html).
*  We use [testthat](https://cran.r-project.org/package=testthat). Please make sure to include tests in your PR.
*  For user-facing changes, add a bullet to the top of `NEWS.md` below the current
development version header describing the changes made followed by your GitHub
username, and links to relevant issue(s)/PR(s).
