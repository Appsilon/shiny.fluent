#!/bin/bash
# This script extracts initialization, ui and server code from component examples.
# It requires very specific formatting of the examples, so if the app does not work, check
# the formatting of examples.
#
# 1. Initialization code has to be in lines between ^if and shinyApp
# 2. UI code has to be in lines between withReact and ^    ),
# 3. Server code has to be in lines between ^    server and ^    }
# 4. Input and output ids have to be unique across all examples.
set -eu

OUT='examples.R'
EXAMPLES=$(cd .. && ls *.R)

echo "# Generated automatically based on examples in inst/examples/*.R" > $OUT
echo -e "\nexamples <- list()" >> $OUT

for FILENAME in $EXAMPLES ; do
  COMPONENT="${FILENAME%.*}"
  EXAMPLE_PATH="../$FILENAME"

  if [[ $FILENAME != broken* ]]; then
    echo "Processing $FILENAME..."

    echo -e "\n\n# $COMPONENT" >> $OUT
    echo -e "\n\nmake${COMPONENT} <- function() {" >> $OUT
    sed -e '/^if/,/shinyApp/!d;//d' < $EXAMPLE_PATH >> $OUT

    echo -e "  ui =" >> $OUT
    sed -e '/withReact/,/^    [)],/!d;//d' -e 's/^  //' < $EXAMPLE_PATH >> $OUT

    sed -e '/^    server/,/^    }/!d' -e 's/^  //' < $EXAMPLE_PATH >> $OUT
    echo -e "\n  list(ui = ui, server = server)\n}" >> $OUT
    echo -e "\nexamples\$${COMPONENT} <- make${COMPONENT}()" >> $OUT
  else
    echo "Omitting $FILENAME"
  fi
done
