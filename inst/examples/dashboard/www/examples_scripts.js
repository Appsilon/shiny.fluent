// tagPicker
testTags = [
  'black',
  'blue',
  'brown',
  'cyan',
  'green',
  'magenta',
  'mauve',
  'orange',
  'pink',
  'purple',
  'red',
  'rose',
  'violet',
  'white',
  'yellow',
].map(item => ({ key: item, name: item }));

function listContainsTagList(tag, tagList) {
  if (!tagList || !tagList.length || tagList.length === 0) {
    return false;
  }
  return tagList.some(compareTag => compareTag.key === tag.key);
};

function filterSuggestedTags(filterText, tagList) {
  return filterText
    ? testTags.filter(
        tag => tag.name.toLowerCase().indexOf(filterText.toLowerCase()) === 0 && !listContainsTagList(tag, tagList),
      )
    : [];
};

// Keytips
const btnExecute = (el) => {
  console.log(el);
  el.click();
};

const keytipConfig = {
  keytips: [
    // Button example
    {
      id: 'Button',
      content: '1A',
      optionalProps: {
        onExecute: btnExecute,
      },
    },
    {
      id: 'CompoundButton',
      content: '1B',
      optionalProps: {
        onExecute: btnExecute,
      },
    },
    {
      id: 'ButtonWithMenu',
      content: '2A',
      optionalProps: {
        onExecute: btnExecute,
      },
      children: [
        {
          id: 'ButtonMenuItem1',
          content: 'E',
          optionalProps: {
            onExecute: btnExecute,
          },
        },
        {
          id: 'ButtonMenuItem2',
          content: '8',
          optionalProps: {
            onExecute: btnExecute,
          },
        },
      ],
    }
  ],
};

keytipMap = jsmodule['@fluentui/react'].buildKeytipConfigMap(keytipConfig);

const buttonProps = {
  items: [
    {
      key: 'buttonMenuItem1',
      text: 'Menu Item 1',
      keytipProps: keytipMap.ButtonMenuItem1,
      onClick: () => Shiny.setInputValue('button3', Math.random())
    },
    {
      key: 'buttonMenuItem2',
      text: 'Menu Item 2',
      keytipProps: keytipMap.ButtonMenuItem2,
      onClick: () => Shiny.setInputValue('button3', Math.random())
    },
  ],
};

// Marquee
const React = jsmodule['react'];
const Fluent = jsmodule['@fluentui/react'];

const theme = Fluent.getTheme();
const styles = Fluent.mergeStyleSets({
  photoList: {
    display: 'inline-block',
    border: '1px solid ' + theme.palette.neutralTertiary,
    margin: 0,
    padding: 10,
    overflow: 'hidden',
    userSelect: 'none',
  },

  photoCell: {
    position: 'relative',
    display: 'inline-block',
    margin: 2,
    boxSizing: 'border-box',
    background: theme.palette.neutralLighter,
    lineHeight: 100,
    verticalAlign: 'middle',
    textAlign: 'center',
    selectors: {
      '&.is-selected': {
        background: theme.palette.themeLighter,
        border: '1px solid ' + theme.palette.themePrimary,
      },
    },
  },
  checkbox: {
    margin: '10px 0',
  },
});

const useForceUpdate = () => {
  const [, setIt] = React.useState(false);
  return () => setIt(it => !it);
};

jsmodule.exampleApp = {}
jsmodule.exampleApp.MarqueeSelectionExample = function(params) {
  const forceUpdate = useForceUpdate();
  const name = params['name'];
  const photos = params['photos'];

  if(window.selection === undefined) {
    window.selection = new Fluent.Selection({
      items: photos,
      onSelectionChanged: function() {
        Shiny.setInputValue(name, window.selection.getSelectedIndices());
        forceUpdate();
      }
    });
  }

  const items = photos.map((photo, index) => {
    return React.createElement('div',
      {
        key: index,
        'data-is-focusable': true,
        className: Fluent.css(styles.photoCell, window.selection.isIndexSelected(index) && 'is-selected'),
        'data-selection-index': index,
        style: { width: photo.width, height: photo.height }
      }, index)
    });

  return React.createElement(
    Fluent.MarqueeSelection,
    { selection: window.selection, isEnabled: true },
    React.createElement('ul', { className: styles.photoList }, items)
  );
};
