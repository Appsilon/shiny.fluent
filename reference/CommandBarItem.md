# Command bar item

Helper function for constructing items for `CommandBar` and
`CommandBar.shinyInput`.

## Usage

``` r
CommandBarItem(
  key,
  text,
  onClick = setInputValue(inputId = key, value = 0, event = TRUE),
  ...
)
```

## Arguments

- key:

  Key of the item.

- text:

  Text to be displayed on the menu.

- onClick:

  A JS function that runs on item click. By default it sends input value
  to `input[[key]]`. If used within `CommandBar.shinyInput`, it will
  send the value to the input ID specified in `inputId` argument of
  `CommandBar.shinyInput`.

- ...:

  Additional props to pass to CommandBarItem.

## Value

Item suitable for use in the `CommandBar` and `CommandBar.shinyInput`.

## See also

CommandBar
