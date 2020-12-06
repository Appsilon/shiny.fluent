#!/bin/bash
set -eu

# Install the JavaScript dependencies
yarn

# Bundle the JavaScript code into a single file
yarn webpack

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'
