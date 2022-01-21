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
  {
    regex: /@name pickers/gm,
    replacement: '@name Pickers',
  },
];

async function main() {
  await scrapeDocs(SCRAPED_DOCS_PATH);
  makeDocs(SCRAPED_DOCS_PATH, DOCS_TEMPLATE_PATH, DOCS_PATH, REPLACE_MAP);
}

main();
