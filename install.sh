#!/bin/bash
set +eu

# Install the JavaScript dependencies
(cd js && yarn)

# Bundle the JavaScript code into a single file
(cd js && yarn webpack)

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'

# prevent terminal close
printf "\n"
read -p "Press enter to continue..."
