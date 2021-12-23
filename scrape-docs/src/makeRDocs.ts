const fs = require('fs');
const _ = require('lodash');
const Mustache = require('mustache');

Mustache.escape = (str) => str;

function prepareView(docs) {
  const view = {
    pages: docs && preparePages(docs.pages),
  };
  return view;
}

function preparePages(pages: any) {
  const pagesArray = objectToArray('name')(pages);
  for (const page of pagesArray) {
    if (page.props) {
      for (const prop of page.props) {
        prop.type = prepareDocString(prop.type, true);
        prop.description = prepareDocString(prop.description);
      }
    }
    if (page.docs) {
      page.docs = _.mapValues(page.docs, (str: string) => prepareDocString(str));
    }
  }
  return pagesArray;
}

function prepareDocString(docString: string, oneLine = false) {
  let str = docString.trim().replace(/\r/g, '');
  if (oneLine) {
    str = str.replace(/\s+/g, ' ');
  } else {
    str = str.replace(/\n/g, "\n#' ");
  }
  return str;
}

function objectToArray(keyName: string, valueName = undefined, valueMap = (x) => x) {
  return (object: any) => Object.entries(object).map(
    valueName === undefined
      ? ([k, v]) => ({ [keyName]: k, ...valueMap(v) })
      : ([k, v]) => ({ [keyName]: k, [valueName]: valueMap(v) }),
  );
}

function makeDocs(scrapedDocsPath: string, docsTemplatePath: string, docsPath: string) {
  const docs = JSON.parse(fs.readFileSync(scrapedDocsPath));
  const view = prepareView(docs);
  const template = fs.readFileSync(docsTemplatePath, 'utf-8');
  const rendered = Mustache.render(template, view).replace(/\s+$/gm, "");
  fs.writeFileSync(docsPath, rendered, 'utf-8');
}

export default makeDocs;
