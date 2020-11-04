# shiny.fluent: Microsoft Fluent UI for Shiny apps

This is a Shiny package based on [shiny.react](https://github.com/Appsilon/shiny.react).

![shinyfluentapp](https://user-images.githubusercontent.com/1421503/97004706-bc396b00-153d-11eb-8fb1-3856e8536f92.gif)

## Getting started

These packages are now private. You need a Github account with access to their repos. Install them from GitHub:

```R
devtools::install_git("ssh://git@github.com/Appsilon/shiny.react.git", subdir = "shiny.react")
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
