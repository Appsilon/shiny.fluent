const fs = require('fs').promises;
const path = require('path');
const recursiveReadDir = require('recursive-readdir');

const OFFICIAL_DOCS_URL = 'https://developer.microsoft.com/en-us/fluentui#/controls/web/';

// Directory with Markdown docs and examples.
const DOCS_PATH = 'node_modules/office-ui-fabric-react/src/components';

// Directory with .page.json files used to fill the "Implementation" sections
// of the official docs.
const API_DOCS_PATH = 'node_modules/@uifabric/api-docs/lib/pages/office-ui-fabric-react';

// Some components are only found in the examples and would require AST manipulation
// to extract their names; it's easier to just list them.
const customComponentPages = {
  MaskedTextField: 'TextField',
  VirtualizedComboBox: 'ComboBox',
  CommandButton: 'Button',
  FocusTrapCallout: 'FocusTrapZone',
  LayerHost: 'Layer',
  Sticky: 'ScrollablePane',
  TeachingBubbleContent: 'TeachingBubble',
  VerticalDivider: 'Divider',
  NormalPeoplePicker: 'PeoplePicker',
  CompactPeoplePicker: 'PeoplePicker',
  TagPicker: 'Pickers',
  BasePickerListBelow: 'Pickers',
  KeytipLayer: 'Keytips',
};

const ignoredPages = [
  'ExtendedPeoplePicker', // Empty page.
  'ExtendedPicker', // Empty page.
  'FloatingPeoplePicker', // Empty page.
  'Popup', // Not implemented.
  'SelectedItemsList', // Empty page.
  'SelectedPeopleList', // Not implemented.
];

async function scrapeDocs(outputFile) {
  const docs = await getDocs(DOCS_PATH);
  const apiDocs = await getApiDocs(API_DOCS_PATH);
  const output = prepareOutput(docs, apiDocs);
  const json = `${JSON.stringify(output, null, 2)}\n`;
  await fs.writeFile(outputFile, json);
}

async function getDocs(docsPath) {
  const files = await recursiveReadDir(docsPath);
  const docs = [];
  for await (const file of files) {
    const doc: any = parseDocPath(file);
    if (doc) {
      doc.contents = await fs.readFile(file, 'utf8');
      docs.push(doc);
    }
  }
  return docs;
}

function parseDocPath(docPath) {
  const p = docPath.split(path.sep);
  if (p.length >= 3) {
    const pageName = p[p.length - 3];
    const docType = p[p.length - 2];
    const fileName = p[p.length - 1];
    let docName;
    if (docType === 'docs') {
      docName = fileName.substring(
        pageName.length, fileName.length - '.md'.length,
      );
      docName = docName[0].toLowerCase() + docName.substr(1);
    } else if (docType === 'examples') {
      docName = fileName.substring(
        pageName.length + '.'.length, fileName.length - '.Example.tsx'.length,
      );
    }
    if (docName) {
      return { page: pageName, type: docType, name: docName };
    }
  }
  return null;
}

// Returns an array of objects parsed from all `.page.json` files in the `pagesPath`.
async function getApiDocs(apiDocsPath) {
  const files = await fs.readdir(apiDocsPath);
  const apiDocs = [];
  for await (const file of files) {
    const raw = await fs.readFile(path.join(apiDocsPath, file));
    apiDocs.push(JSON.parse(raw));
  }
  return apiDocs;
}

function prepareOutput(docs, apiDocs) {
  const pages = {};
  for (const apiDoc of apiDocs) {
    const page = setDefault(pages, apiDoc.name, {});
    page.props = getProps(apiDoc);
  }
  for (const doc of docs) {
    const page = setDefault(pages, doc.page, {});
    const section = setDefault(page, doc.type, {});
    section[doc.name] = doc.contents;
  }
  for (const name of ignoredPages) {
    delete pages[name];
  }
  for (const [name, page] of Object.entries(pages)) {
    (page as any).link = OFFICIAL_DOCS_URL + name;
  }
  const componentsMap = { ...getComponentsMap(apiDocs), ...customComponentPages };
  return { pages, componentsMap };
}

function setDefault(object, property, defaultValue) {
  const value = object[property];
  if (value === undefined) {
    object[property] = defaultValue; // eslint-disable-line no-param-reassign
    return defaultValue;
  }
  return value;
}

// Returns a list of all properties from a single page of API docs.
function getProps(apiDoc) {
  const props = [];
  for (const table of apiDoc.tables) {
    if (isProps(table.name) && table.members) {
      for (const prop of table.members) {
        props.push({
          name: prop.name,
          type: prop.typeTokens.map((token) => token.text).join(''),
          description: prop.description || '',
        });
      }
    }
  }
  return props;
}

// Returns a (component name => page name) mapping.
function getComponentsMap(apiDocs) {
  const components = {};
  for (const page of apiDocs) {
    for (const table of page.tables) {
      const component = getComponent(table);
      if (component) {
        components[component.name] = page.name;
      }
    }
  }
  return components;
}

function isProps(name) {
  return name.endsWith('Props') && !name.endsWith('StyleProps');
}

function getComponent(table) {
  return getClassComponent(table) || getFunctionComponent(table);
}

// Returns the component name and its props interface
// if `table` represents a class component and null otherwise.
function getClassComponent(table) {
  if (table.kind === 'class' && table.extendsTokens
      && table.extendsTokens[0].text === 'React.Component<') {
    return { name: table.name, propsName: table.extendsTokens[1].text };
  }
  return null;
}

// Returns the component name and its props interface
// if `table` represents function component props and null otherwise.
function getFunctionComponent(table) {
  if (table.kind === 'interface' && isProps(table.name)) {
    return {
      // Strip leading 'I' and trailing 'Props'.
      name: table.name.substring(1, table.name.length - 5),
      propsName: table.name,
    };
  }
  return null;
}

export default scrapeDocs;
