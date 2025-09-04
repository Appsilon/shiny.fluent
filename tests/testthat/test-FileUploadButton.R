describe("FileUploadButton.shinyInput", {
  it("creates a valid shiny.tag object", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload File")

    # Assert
    expect_s3_class(result, "shiny.tag")
    expect_equal(result$name, "div")
    expect_true("react-container" %in% result$attribs$class)
  })

  it("passes inputId correctly", {
    # Act
    result <- FileUploadButton.shinyInput("test_upload", text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$inputId, "test_upload")
  })

  it("handles all button types correctly", {
    button_types <- c("primary", "default", "compound", "action", "command", "commandBar", "icon")

    for (type in button_types) {
      # Act
      result <- FileUploadButton.shinyInput("test", text = "Test", buttonType = type)

      # Assert
      expect_s3_class(result, "shiny.tag")
      # Check that buttonType is passed in props
      react_data <- attr(result, "reactData")
      expect_equal(react_data$props$value$buttonType, type)
    }
  })

  it("passes text prop correctly", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload Files")

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$text, "Upload Files")
  })

  it("passes icon prop when provided", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload", icon = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$icon, "Upload")
  })

  it("excludes icon prop when not provided", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    expect_null(react_data$props$value$icon)
  })

  it("passes file input parameters correctly", {
    # Act
    result <- FileUploadButton.shinyInput("test",
      text = "Upload",
      accept = ".xlsx,.csv",
      multiple = TRUE
    )

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$accept, ".xlsx,.csv")
    expect_true(react_data$props$value$multiple)
  })

  it("defaults multiple to FALSE when not specified", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    # multiple should either be FALSE or not present (NULL)
    expect_true(is.null(react_data$props$value$multiple) || react_data$props$value$multiple == FALSE)
  })

  it("defaults buttonType to 'default' when not specified", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    # buttonType should either be "default" or not present (will default to "default" in React)
    expect_true(is.null(react_data$props$value$buttonType) || react_data$props$value$buttonType == "default")
  })

  it("includes shinyFluentDependency", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload")

    # Assert
    deps <- htmltools::findDependencies(result)
    dep_names <- sapply(deps, function(x) x$name)
    expect_true("shiny.fluent" %in% dep_names)
  })

  it("uses @/shiny.fluent module", {
    # Act
    result <- FileUploadButton.shinyInput("test", text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$module, "@/shiny.fluent")
    expect_equal(react_data$name, "FileUploadButton")
  })

  it("works with Shiny module namespacing", {
    # Arrange
    ns <- shiny::NS("module")

    # Act
    result <- FileUploadButton.shinyInput(ns("upload"), text = "Upload")

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$inputId, "module-upload")
  })

  it("passes additional props correctly", {
    # Act
    result <- FileUploadButton.shinyInput("test",
      text = "Upload",
      disabled = TRUE,
      className = "custom-class"
    )

    # Assert
    react_data <- attr(result, "reactData")
    expect_true(react_data$props$value$disabled)
    expect_equal(react_data$props$value$className, "custom-class")
  })

  it("handles style prop correctly", {
    # Act
    result <- FileUploadButton.shinyInput("test",
      text = "Upload",
      style = "margin: 10px;"
    )

    # Assert
    react_data <- attr(result, "reactData")
    expect_equal(react_data$props$value$style, "margin: 10px;")
  })
})

describe("updateFileUploadButton.shinyInput", {
  it("is available as update function", {
    # Assert
    expect_true(exists("updateFileUploadButton.shinyInput"))
    expect_equal(updateFileUploadButton.shinyInput, shiny.react::updateReactInput)
  })
})
