describe("parseTheme", {
  it("throws an error if both 'path' and 'json' are supplied", {
    expect_error(
      parseTheme(path = "theme.json", json = "{}"),
      regexp = "Only one 'path' or 'json' argument must be used'"
    )
  })

  it("throws an error if neither 'path' nor 'json' is supplied", {
    expect_error(parseTheme(), regexp = "Provide 'path' or 'json' argument")
  })

  it("throws an error if an invalid JSON is passed to the function", {
    json <- '{\n"themePrimary":}'
    expect_error(parseTheme(json = json))
  })

  it("throws an error if theme JSON doesn't exist", {
    expect_error(suppressWarnings(parseTheme(path = "theme.json")))
  })

  it("reads the theme json and return a list", {
    json <- '{\n"themePrimary":"black"}'
    expect_equal(
      parseTheme(json = json),
      list(
        palette = list(
          themePrimary = "black"
        )
      )
    )
  })

  it("reads the theme json and return a list", {
    withr::with_tempdir({
      cat('{\n"themePrimary":"black"}', file = "theme.json")
      expect_equal(
        parseTheme(path = "theme.json"),
        list(
          palette = list(
            themePrimary = "black"
          )
        )
      )
    })
  })
})
