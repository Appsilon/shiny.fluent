import scrapeDocs from './src/scrapeDocs';
import makeDocs from './src/makeRDocs';

const SCRAPED_DOCS_PATH = './fluent-docs.json';
const DOCS_TEMPLATE_PATH = './documentation_template.R';
const DOCS_PATH = '../R/documentation.R';
const REPLACE_MAP = [
  // Remove trailing whitespaces resulting from scraped docs
  {
    regex: /\s+$/gm,
    replacement: '',
  },
  // Add a whitespace between documentation entries, each ends with "NULL"
  {
    regex: /NULL/gm,
    replacement: 'NULL\n',
  },
  // Replace "pickers" from scraped documentation to "Pickers" to ensure that
  // proper documentation entry shows when fetching "Pickers" help pages in R session
  {
    regex: /@name pickers/gm,
    replacement: '@name Pickers',
  },
  // Quote empty markdown links, e.g. "[Object]" as it throws roxygen warning about missing url
  {
    regex: /(\[(\w+\s?\w+)\])(?!\(.*\))/gm,
    replacement: '`\$1`', // eslint-disable-line
  },
  // Quote regexes in text
  {
    regex: /(\[(0-9|a-zA-Z|a-zA-Z0-9)\])/gm,
    replacement: '`\$1`', // eslint-disable-line
  },
  // Remove empty @details
  {
    regex: /#'\s+@details[\n\s]+#'[\n\s]+#'[\n\s]+\\itemize\{\n#'\s\}/gm,
    replacement: '#\''
  }
];

async function main() {
  await scrapeDocs(SCRAPED_DOCS_PATH);
  makeDocs(SCRAPED_DOCS_PATH, DOCS_TEMPLATE_PATH, DOCS_PATH, REPLACE_MAP);
}

main();
