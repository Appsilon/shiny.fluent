import * as Fluent from '@fluentui/react';
import { ButtonAdapter, InputAdapter, debounce } from '@/shiny.react';
import { useState } from 'react';

function handleMultiSelect(option, selectedKeys, propsOptions) {
  const options = new Set(propsOptions.map((item) => item.key));
  let currentSelectedOptionKeys = (Array.isArray(selectedKeys) ? selectedKeys : [selectedKeys])
    .filter((key) => options.has(key)); // Some options might have been removed.
  // If option doesn't have selected property it comes from freeform, so it's selected by default.
  const selected = option.selected ?? true;
  currentSelectedOptionKeys = selected
    ? [...currentSelectedOptionKeys, option.key]
    : currentSelectedOptionKeys.filter((key) => key !== option.key);
  return currentSelectedOptionKeys;
}

function getSelectedOptionText(options, value, delimiter = ', ') {
  const selectedKeys = new Set(value);
  return options
    .filter((option) => selectedKeys.has(option.key))
    .map((option) => option?.text)
    .join(delimiter);
}

export const ActionButton = ButtonAdapter(Fluent.ActionButton);
export const CommandBarButton = ButtonAdapter(Fluent.CommandBarButton);
export const CommandButton = ButtonAdapter(Fluent.CommandButton);
export const CompoundButton = ButtonAdapter(Fluent.CompoundButton);
export const DefaultButton = ButtonAdapter(Fluent.DefaultButton);
export const IconButton = ButtonAdapter(Fluent.IconButton);
export const PrimaryButton = ButtonAdapter(Fluent.PrimaryButton);

export const Calendar = InputAdapter(Fluent.Calendar, (value, setValue) => ({
  value: value ? new Date(value) : new Date(),
  onSelectDate: setValue,
}));

export const Checkbox = InputAdapter(Fluent.Checkbox, (value, setValue) => ({
  checked: value,
  onChange: (e, v) => setValue(v),
}));

export const ChoiceGroup = InputAdapter(Fluent.ChoiceGroup, (value, setValue) => ({
  selectedKey: value,
  onChange: (e, v) => setValue(v.key),
}));

export const ColorPicker = InputAdapter(Fluent.ColorPicker, (value, setValue) => ({
  color: value,
  onChange: (e, v) => setValue(v.str),
}), { policy: debounce, delay: 250 });

export const ComboBox = InputAdapter(Fluent.ComboBox, (value, setValue, props) => {
  const [options, setOptions] = useState(props.options);
  return ({
    selectedKey: value,
    text: (typeof value === 'string') ? value : getSelectedOptionText(options, value, props.multiSelectDelimiter || ', '),
    options,
    onChange: (_event, option, _index, text) => {
      let key = option?.key || text;
      const newOption = option || { key, text };
      // Add new option if freeform is allowed
      if (props?.allowFreeform && !option && text) {
        setOptions((prevOptions) => [...prevOptions, newOption]);
      }
      if (props.multiSelect) {
        key = handleMultiSelect(newOption, value, options);
      }
      setValue(key);
    },
  })
}, { policy: debounce, delay: 250 });


export const DatePicker = InputAdapter(Fluent.DatePicker, (value, setValue) => ({
  value: value ? new Date(value) : undefined,
  onSelectDate: setValue,
}));

export const Dropdown = InputAdapter(Fluent.Dropdown, (value, setValue, props) => ({
  selectedKeys: value,
  selectedKey: value,
  onChange: (e, v) => {
    if (props.multiSelect) {
      setValue(handleMultiSelect(v, value, props.options));
    } else {
      setValue(v.key);
    }
  },
}));

export const NormalPeoplePicker = InputAdapter(
  Fluent.NormalPeoplePicker,
  (value, setValue, props) => ({
    onResolveSuggestions: (text, selectedItems) => props.options.filter((item) => (
      !selectedItems.includes(item)
        && item.text.toLowerCase().startsWith(text.toLowerCase())
    )),
    onEmptyInputFocus: (selectedItems) => props.options.filter((item) => (
      !selectedItems.includes(item)
    )),
    getTextFromItem: (item) => item.text,
    onChange: (selectedItems) => setValue(selectedItems.map((item) => item.key)),
  }),
);

export const Rating = InputAdapter(Fluent.Rating, (value, setValue) => ({
  rating: value,
  onChange: (e, v) => setValue(v),
}));

export const SearchBox = InputAdapter(Fluent.SearchBox, (value, setValue) => ({
  value,
  onChange: (e, v) => setValue(v),
}), { policy: debounce, delay: 250 });

export const Slider = InputAdapter(Fluent.Slider, (value, setValue) => ({
  value,
  onChange: setValue,
}), { policy: debounce, delay: 250 });

export const SpinButton = InputAdapter(Fluent.SpinButton, (value, setValue) => ({
  value,
  onChange: (e, v) => v && setValue(Number(v)),
}), { policy: debounce, delay: 250 });

export const SwatchColorPicker = InputAdapter(Fluent.SwatchColorPicker, (value, setValue) => ({
  selectedId: value,
  onChange: (e, v) => setValue(v),
}));

export const TextField = InputAdapter(Fluent.TextField, (value, setValue) => ({
  value,
  onChange: (e, v) => setValue(v),
}), { policy: debounce, delay: 250 });

export const Toggle = InputAdapter(Fluent.Toggle, (value, setValue) => ({
  checked: value,
  onChange: (e, v) => setValue(v),
}));
