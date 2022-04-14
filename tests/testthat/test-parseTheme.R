describe("parseTheme", {
  it("should read the theme json and return a list", {
    jsonString <- "{\n\"themePrimary\":\"black\"}"
    expect_equal(
      parseTheme(jsonString),
      list(
        palette = list(
          themePrimary = "black"
        )
      )
    )
  })

  it("should throw an error if invalid JSON is passed to the function", {
    jsonString <- "{\n\"themePrimary\":}"
    expect_error(parseTheme(jsonString))
  })

  it("should throw an error if theme JSON doesn't exist", {
    expect_error(parseTheme("theme.json"))
  })

  it("should read the theme json and return a list", {
    withr::with_tempdir({
      cat("{\n\"themePrimary\":\"black\"}", file = "theme.json")
      expect_equal(
        parseTheme("theme.json"),
        list(
          palette = list(
            themePrimary = "black"
          )
        )
      )
    })
  })
})
