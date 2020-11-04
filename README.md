# shiny.fluent

This is a Shiny package based on [shiny.react](https://github.com/Appsilon/shiny.react).

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
Rscript -e 'devtools::install_cran("git2r", force=TRUE)'
```

## Examples

To run usage examples, use `shiny.fluent::run_example("example_name")` from R or `echo 'shiny.fluent::run_example("example_name")' | R --interactive` from command line.
For a list of available examples, use `shiny.fluent::run_example()`.
