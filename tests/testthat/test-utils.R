describe("readTheme", {
  it("should throw an error if theme file doesn't exist", {
    withr::with_tempdir({
      expect_error(
        readTheme("theme.json") 
      )
    })
  })

  it("should read the theme json and return a list", {
    withr::with_tempdir({
      cat("{\n\"themePrimary\":\"black\"}", file = "theme.json")
      expect_equal(
        readTheme("theme.json"),
        list(
          palette = list(
            themePrimary = "black"
          )
        )
      )
    })
  })
})
