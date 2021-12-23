import scrapeDocs from './src/scrapeDocs';
import makeDocs from './src/makeRDocs';

const SCRAPED_DOCS_PATH = './fluent-docs.json';
const DOCS_TEMPLATE_PATH = './documentation_template.R';
const DOCS_PATH = '../R/documentation.R';

async function main() {
  await scrapeDocs(SCRAPED_DOCS_PATH);
  makeDocs(SCRAPED_DOCS_PATH, DOCS_TEMPLATE_PATH, DOCS_PATH);
}

main();
