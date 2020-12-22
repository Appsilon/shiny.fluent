# shiny.fluent: Microsoft Fluent UI for Shiny apps

This is a Shiny package based on [shiny.react](https://github.com/Appsilon/shiny.react).

![shinyfluentapp](https://user-images.githubusercontent.com/1421503/97004706-bc396b00-153d-11eb-8fb1-3856e8536f92.gif)

## Getting started

These packages are now private. You need a Github account with access to their repos. Install them from GitHub:

```R
devtools::install_git("ssh://git@github.com/Appsilon/shiny.react.git")
devtools::install_git("ssh://git@github.com/Appsilon/shiny.fluent.git")
```


This should work out of the box, assuming you have SSH keys that authenticate you to GitHub in the standard path. If not, configure Git credentials using `usethis::use_git_credentials` and `git2r::cred_ssh_key` or `git2r::cred_token`.

If you run into errors, try installing SSH dependencies and re-installing git2r

```sh
sudo apt-get install libssh2-1 libssh2-1-dev
Rscript -e 'devtools::install_cran("git2r", force = TRUE)'
```

For Mac OSX use:
```sh
brew install libssh2
brew install libgit2
install.packages("git2r", type = "source", configure.vars = "autobrew=yes")
```

## Examples

For an example of a dashboard built with Fluent UI, run `shiny.fluent::run_example("dashboard")` from R (or `echo 'shiny.fluent::run_example("dashboard")' | R --interactive` from command line.)

To see a list of all available examples, run `shiny.fluent::run_example()`.

## How to use it

Shiny.fluent provides all controls from [Fluent UI](https://developer.microsoft.com/en-us/fluentui#/controls/web). Open that page or start typing `shiny.fluent::` in RStudio to see all available controls. You can also open `shiny.fluent::run_example("dashboard")` for a large number of examples.

All components are documented, so if you run `?shiny.fluent::MyComponentName`, you'll see documentation for this component in RStudio, along with examples. When in doubt, open [Fluent UI docs](https://developer.microsoft.com/en-us/fluentui#/controls/web) for details.

To insert Fluent components inside your Shiny app, wrap them inside a `withReact(...)` call, like so:

```r
  shinyApp(
    ui = withReact(
      div(
        Checkbox("checkbox", FALSE),
        textOutput("checkboxValue")
      )
    ),
    server = function(input, output) {
      output$checkboxValue <- renderText({
        sprintf("Value: %s", input$checkbox)
      })
    }
  )
```

Inside a `withReact` call, you can mix and match React and standard HTML tags. You can also insert other Shiny outputs inside (like a `uiOutput` or `leafletOutput`).

There is a special category of components which are defined as Shiny inputs, like various Buttons, TextField, Toggle, Calendar etc. They all have a companion `updateMyComponent` functions defined. To see a full list of these components, start typing `shiny.fluent::update`.

There is also an alternative to `withReact` available. It is less convenient because it requires you to define an output. However, it is more powerful, because it maintains the interal state of React components. It is needed when inserting e.g. a Modal or Dialog. To use it, insert `reactOutput("myReactOutput")` and then define this output like `output$myReactOutput <- reactOutput(reactWidget({ ... React or HTML tags here }))`. Look at the examples for Modal, Dialog, TeachingBubble for details.

You can pass raw JavaScript code as parameters to components. To do that, use `param = JS("my js code")`. See `008_custom_js` for an example.

A couple of things to remember about:
1. `withReact` currently expects just 1 argument - if you want to pass more tags, use a div or a tagList.
2. It is enough to use a single `withReact` call for each structure of tags. Do not wrap a `withReact` call inside another `withReact` call - this will not work. However, if you have a `withReact(uiOutput("myOutput"))`, then it is perfectly fine to have `output$myOutput <- renderUI(withReact(...))`
2. In some cases Buttons may not work properly out of the box due to Shiny bindings. In this case try wrapping them in a  ShinyComponentWrapper(...) call. Typically, they work without it when when placed high in the UI tree but the wrapper is necessary they are nested for example inside a Pivot page.
3. By default `reactOutput()` creates a div with a size which affects the display (a problem e.g. when using it to render modal). This is the default for HTML widgets. Pass a `reactOutput("myOutput", height=NULL)` to avoid that.
