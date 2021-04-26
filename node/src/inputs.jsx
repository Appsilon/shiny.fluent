import * as Fluent from '@fluentui/react';
import { ButtonAdapter, InputAdapter } from '@/shiny.react';

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
}));

export const ComboBox = InputAdapter(Fluent.ComboBox, (value, setValue) => ({
  selectedKey: value && value.key,
  text: value && value.text,
  onChange: (e, option, i, text) => setValue(option || (text ? { text } : null)),
}));

export const DatePicker = InputAdapter(Fluent.DatePicker, (value, setValue) => ({
  value: value ? new Date(value) : new Date(),
  onSelectDate: setValue,
}));

export const Dropdown = InputAdapter(Fluent.Dropdown, (value, setValue) => ({
  selectedKey: value,
  onChange: (e, v) => setValue(v.key),
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
}));

export const Slider = InputAdapter(Fluent.Slider, (value, setValue) => ({
  value,
  onChange: setValue,
}));

export const SpinButton = InputAdapter(Fluent.SpinButton, (value, setValue) => ({
  value,
  onChange: (e, v) => v && setValue(Number(v)),
}));

export const SwatchColorPicker = InputAdapter(Fluent.SwatchColorPicker, (value, setValue) => ({
  selectedId: value,
  onChange: (e, v) => setValue(v),
}));

export const TextField = InputAdapter(Fluent.TextField, (value, setValue) => ({
  value,
  onChange: (e, v) => setValue(v),
}));

export const Toggle = InputAdapter(Fluent.Toggle, (value, setValue) => ({
  checked: value,
  onChange: (e, v) => setValue(v),
}));
