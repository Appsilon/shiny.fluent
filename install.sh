#!/bin/bash
set -eu

# Install the JavaScript dependencies
(cd node && yarn)

# Bundle the JavaScript code into a single file
(cd node && yarn webpack)

# Generate the NAMESPACE file and documentation
Rscript -e 'devtools::document()'

# Install the package
Rscript -e 'devtools::install()'
