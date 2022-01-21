describe("ThemeProvider", {
  it("should read a theme from JSON file if `theme` argument is a string ending with `.json`", {
    withr::with_tempdir({
      themeFile <- "theme.json"
      cat("{\n\"themePrimary\":\"black\"}", file = themeFile)
      mockReadTheme <- mockery::mock()
      mockery::stub(ThemeProvider, "readTheme", mockReadTheme)
      
      ThemeProvider(theme = themeFile)
      
      mockery::expect_called(mockReadTheme, 1)
      mockery::expect_args(mockReadTheme, 1, theme = themeFile)
    })
  })
})
