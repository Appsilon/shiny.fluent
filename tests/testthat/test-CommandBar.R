init_driver <- function(app) {
  shinytest2::AppDriver$new(app, variant = shinytest2::platform_variant())
}

items <- function() {
  list(
    CommandBarItem(
      id = "new_item",
      key = "new_item_value",
      text = "New",
      cacheKey = "myCacheKey",
      split = TRUE,
      iconProps = list(iconName = "Add"),
      subMenuProps = list(
        items = list(
          CommandBarItem(
            key = "email_message_value",
            id = "email_message",
            text = "Email message",
            iconProps = list(iconName = "Mail")
          )
        )
      )
    ),
    CommandBarItem(
      key = "download_value",
      id = "download",
      text = "Download",
      iconProps = list(iconName = "Download")
    )
  )
}

far_items <- function() {
  list(
    CommandBarItem(
      key = "tile_value",
      id = "tile",
      text = "Grid view",
      ariaLabel = "Grid view",
      iconOnly = TRUE,
      iconProps = list(iconName = "Tiles")
    )
  )
}

describe("CommandBar", {
  it("should set input after clicking on a CommandBarItem", {
    skip_on_cran()

    # Arrange
    app <- init_driver(shiny::shinyApp(
      ui = shiny::tagList(
        CommandBar(
          items = items(),
          farItems = far_items()
        )
      ),
      server = function(input, output) { }
    ))
    withr::defer(app$stop())

    # Act
    app$click(selector = "#download")
    value <- app$get_value(input = "download_value")

    # Assert
    expect_equal(value, 0)
  })
})


describe("CommandBar.shinyInput", {
  test_app <- function() {
    shiny::shinyApp(
      ui = shiny::tagList(
        CommandBar.shinyInput(
          inputId = "commandBar",
          items = items(),
          farItems = far_items()
        )
      ),
      server = function(input, output) { }
    )
  }

  it("should yield NULL input value on startup", {
    skip_on_cran()

    # Arrange
    app <- init_driver(test_app())
    withr::defer(app$stop())

    # Act
    value <- app$get_value(input = "commandBar")

    # Assert
    expect_null(value)
  })

  it("should set input after clicking on CommandBarItem with with `key` value of clicked item", {
    skip_on_cran()

    # Arrange
    app <- init_driver(test_app())
    withr::defer(app$stop())

    # Act
    app$click(selector = "#download")
    value <- app$get_value(input = "commandBar")

    # Assert
    expect_equal(value, "download_value")
  })

  it("should set input after clicking on nested CommandBarItem with `key` value of clicked item", {
    skip_on_cran()

    # Arrange
    app <- init_driver(test_app())
    withr::defer(app$stop())

    # Act
    # Click dropdown button which is a sibling of #new_item when using split = TRUE
    app$click(selector = "#new_item + button")
    app$click(selector = "#email_message")
    value <- app$get_value(input = "commandBar")

    # Assert
    expect_equal(value, "email_message_value")
  })

  it("should work with only `items` added to CommandBar", {
    skip_on_cran()

    # Arrange
    app <- init_driver(shiny::shinyApp(
      ui = shiny::tagList(
        CommandBar.shinyInput(
          inputId = "commandBar",
          items = items()
        )
      ),
      server = function(input, output) { }
    ))
    withr::defer(app$stop())

    # Act
    app$click(selector = "#download")
    value <- app$get_value(input = "commandBar")

    # Assert
    expect_equal(value, "download_value")
  })

  it("should work with only `farItems` added to CommandBar", {
    skip_on_cran()

    # Arrange
    app <- init_driver(shiny::shinyApp(
      ui = shiny::tagList(
        CommandBar.shinyInput(
          inputId = "commandBar",
          farItems = far_items()
        )
      ),
      server = function(input, output) { }
    ))
    withr::defer(app$stop())

    # Act
    app$click(selector = "#tile")
    value <- app$get_value(input = "commandBar")

    # Assert
    expect_equal(value, "tile_value")
  })
})
