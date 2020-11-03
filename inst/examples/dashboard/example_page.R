# R help via https://stackoverflow.com/a/8983386
Rd2list <- function(Rd) {
  names(Rd) <- substring(sapply(Rd, attr, "Rd_tag"), 2)
  temp_args <- Rd$arguments

  Rd$arguments <- NULL
  myrd <- lapply(Rd, unlist)
  myrd <- lapply(myrd, paste, collapse = "")

  temp_args <-
    temp_args[sapply(temp_args , attr, "Rd_tag") == "\\item"]
  temp_args <- lapply(temp_args, lapply, paste, collapse = "")
  temp_args <- lapply(temp_args, "names<-", c("arg", "description"))
  myrd$arguments <- temp_args

  myrd
}

getHelpList <- function(...) {
  thefile <- help(...)
  myrd <- utils:::.getHelpFile(thefile)
  Rd2list(myrd)
}

makeExamplePage <- function(name, ui) {
  help <- getHelpList(name)

  makePage(name,
           "Fluent UI component",
           div(
             makeCard("Description", Text(nowrap = FALSE, help$description)),
             makeCard("Usage", pre(help$usage)),
             makeCard("Live example", div(style = "padding: 20px", ui)),
             makeCard("Live example code", pre(help$example))
           ))
}
