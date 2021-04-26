import * as ShinyReact from 'ShinyReact';
import * as Components from '@fluentui/react';

// UI rendering in ShinyReact (particularly `hydrateJsxAndHtmlTags`) expects the components to
// be exposed in window[packageName][componentName], where packageName and componentName
// are provided as arguments in shiny.react::makeOutput calls in the R code.
window['shiny.fluent'] = Components;

import { initializeIcons } from "office-ui-fabric-react/lib/Icons";
initializeIcons();

function makeStandardInput(...args) {
  return ShinyReact.makeStandardInput('shiny.fluent', ...args);
}

function makeButtonInput(...args) {
  return ShinyReact.makeButtonInput('shiny.fluent', ...args)
}

makeStandardInput('Calendar', ({ value, setValue, configuration }) => ({
  value: new Date(value),
  onSelectDate: value => setValue(value),
}));
makeStandardInput('Checkbox', ({ value, setValue, configuration }) => ({
  checked: value,
  onChange: (e, value) => setValue(value),
}));
makeStandardInput('ChoiceGroup', ({ value, setValue, configuration }) => ({
  selectedKey: value,
  onChange: (e, value) => setValue(value.key),
}));
makeStandardInput('ColorPicker', ({ value, setValue, configuration }) => ({
  color: value,
  onChange: (e, v) => setValue(v.str),
}));
makeStandardInput('ComboBox', ({ value, setValue, configuration }) => ({
  selectedKey: typeof value !== "string" ? value.key : undefined,
  text: typeof value === "string" ? value : undefined,
  onChange: (e, opt, idx, val) => setValue(opt || val),
}));
makeStandardInput('DatePicker', ({ value, setValue, configuration }) => ({
  value: new Date(value),
  onSelectDate: value => setValue(value),
}));
makeStandardInput('Dropdown', ({ value, setValue, configuration }) => ({
  selectedKey: value,
  onChange: (e, option) => setValue(option.key),
}));
makeStandardInput('MaskedTextField', ({ value, setValue, configuration }) => ({
}));
makeStandardInput('Rating', ({ value, setValue, configuration }) => ({
  rating: value,
  onChange: (e, value) => setValue(value),
}));
makeStandardInput('SearchBox', ({ value, setValue, configuration }) => ({
  value: value,
  onChange: (e, value) => setValue(value),
}));
makeStandardInput('Slider', ({ value, setValue, configuration }) => ({
  value: value,
  onChange: value => setValue(value),
}));
makeStandardInput('SpinButton', ({ value, setValue, configuration }) => ({
  value: value,
  onIncrement: v => setValue(Math.min(configuration.max || 100, Number(v) + (configuration.step || 1))),
  onDecrement: v => setValue(Math.max(configuration.min || 0, Number(v) - (configuration.step || 1))),
}));
makeStandardInput('SwatchColorPicker', ({ value, setValue, configuration }) => ({
  selectedId: value,
  onColorChanged: (id, color) => setValue(id),
}));
makeStandardInput('TextField', ({ value, setValue, configuration }) => ({
  value: value,
  onChange: (e, value) => setValue(value),
}));
makeStandardInput('Toggle', ({ value, setValue, configuration }) => ({
  checked: value,
  onChange: (e, value) => setValue(value),
}));
makeStandardInput('VirtualizedComboBox', ({ value, setValue, configuration }) => ({
}));
makeStandardInput('NormalPeoplePicker', ({ value, setValue, configuration }) => ({
  onResolveSuggestions: (filterText, currentPersonas) => configuration.options.filter(item => !currentPersonas.includes(item) && item.text.toLowerCase().indexOf(filterText.toLowerCase()) === 0),
  onEmptyInputFocus: (currentPersonas) => configuration.options.filter(item => !currentPersonas.includes(item)),
  getTextFromItem: item => item.text,
  onChange: (selection) => setValue(selection.map(item => item.key)),
}));

makeButtonInput('ActionButton');
makeButtonInput('CommandBarButton');
makeButtonInput('CommandButton');
makeButtonInput('CompoundButton');
makeButtonInput('DefaultButton');
makeButtonInput('IconButton');
makeButtonInput('PrimaryButton');
