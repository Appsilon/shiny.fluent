describe("recursiveModify", {
  it("should apply modify function to all elements meeting 'when' condition", {
    # Arrange
    makeItem <- function(...) {
      structure(
        list(...),
        class = "item"
      )
    }
    data <- list(
      makeItem(
        x = 1,
        subItems = list(
          makeItem(x = 1),
          makeItem(x = 2)
        )
      ),
      makeItem(
        x = 2,
        subItems = list(
          makeItem(x = 1),
          makeItem(x = 2)
        )
      ),
      makeItem(
        x = 3,
        subItems = list(
          makeItem(x = 1),
          makeItem(x = 2)
        )
      )
    )
    modify_spy <- mockery::mock()
    modify <- function(x) {
      modify_spy()
      x
    }

    # Act
    result <- recursiveModify(data, modify = modify, when = function(x) inherits(x, "item"))

    # Assert
    mockery::expect_called(modify_spy, n = 9)
  })
})
