# ❯ checking for detritus in the temp directory ... NOTE
# Found the following files/directories:
#   ‘Crashpad’
#
# 0 errors ✔ | 0 warnings ✔ | 1 note ✖
# Error: Error: R CMD check found NOTEs
# Flavors: ubuntu-22.04 (devel), ubuntu-22.04 (release), ubuntu-22.04 (oldrel)

# References (shinytest2 github):
# 1. https://github.com/rstudio/shinytest2/blob/main/cran-comments.md
# 2. https://github.com/rstudio/shinytest2/blob/main/tests/testthat/setup-disable-crashpad.R

# Disable crash reporting on CRAN machines. (Can't get the report anyways)
chromote::set_chrome_args(c(
  # https://peter.sh/experiments/chromium-command-line-switches/#disable-crash-reporter
  #> Disable crash reporter for headless. It is enabled by default in official builds
  "--disable-crash-reporter",
  chromote::default_chrome_args()
))

# Make sure the temp folder is removed when testing is complete
withr::defer(
  {
    # Shut Chrome down gracefully and wait for the process to exit. Chrome removes
    # its own temp dirs only on a clean exit, and a process still alive here would
    # recreate them right after the unlink below.
    if (chromote::has_default_chromote_object()) {
      try(chromote::default_chromote_object()$close(wait = 10), silent = TRUE)
    }

    # Clean up chromote sessions
    gc() # Run R6 finalizer methods
    Sys.sleep(2) # Wait for any supervisors to exit

    # Delete Chrome leftovers: 'Crashpad' and macOS 'com.google.Chrome.*' dirs.
    # R CMD check reports detritus in dirname(tempdir()), which is check-private;
    # outside a check that dir is the shared TMPDIR of a possibly running browser.
    dirs <- if (testthat::is_checking()) {
      c(tempdir(), dirname(tempdir()))
    } else {
      tempdir()
    }
    unlink(
      list.files(
        dirs,
        pattern = "^(Crashpad|com\\.google\\.Chrome)",
        full.names = TRUE
      ),
      recursive = TRUE
    )
  },
  envir = testthat::teardown_env()
)
