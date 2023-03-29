# Contributing to shiny.fluent

We welcome contributions to shiny.fluent and shiny.react!

### Fixing typos

You're welcome to make small fixes in the documentation without discussing it - simply please go ahead and open a pull request with a change. If this is about R help, make sure to edit the `.R` file, not the processed docs in `.Rmd`

### Issues

Before you make a bigger pull request, please open an issue and make sure one of the maintainers agrees that this is a problem and with the proposed solution. If you've found a
bug, please create a bug report issue and illustrate the bug with a minimal
[reprex](https://www.tidyverse.org/help/#reprex).

### Bug reports

Please provide a code example of the bug you're encountering.
A good code example should meet the following criteria:

1. **Minimal**: Only include the essential code needed to illustrate the problem.
Remove any extraneous code that isn't directly related to the issue at hand.
2. **Complete**: Include everything that someone else would need to run the example,
such as the full contents of the app.R file.
3. **Reproducible**: Ensure that the problem actually appears in the example.
Include information like the R and package version, operating system, and browser.
4. **Readable**: Use individual [Markdown code blocks](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#quoting-code) for each file or code snippet.
Use proper indentation, comments, and descriptive names.

Check out [Reprex do's and don'ts](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html) for even more great tips.
Providing a good code example is crucial for us to reproduce and understand the bug.
It increases the likelihood of addressing the issue quickly and effectively.

### Pull request process

*  New code should follow the tidyverse [style guide](http://style.tidyverse.org).
*  We use [roxygen2](https://cran.r-project.org/package=roxygen2) for documentation, with a preference for
[Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html).
*  We use [testthat](https://cran.r-project.org/package=testthat). Please make sure to include tests in your PR.
*  For user-facing changes, add a bullet to the top of `NEWS.md` below the current
development version header describing the changes made followed by your GitHub
username, and links to relevant issue(s)/PR(s).
