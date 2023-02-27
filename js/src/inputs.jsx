import * as Fluent from '@fluentui/react';
import { ButtonAdapter, InputAdapter, debounce } from '@/shiny.react';

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

export const ComboBox = InputAdapter(Fluent.ComboBox, (value, setValue, props) => ({
  selectedKey: value && value.key,
  text: value && value.text,
  onChange: (e, option, i, text) => {
    if (props.multiSelect) {
      const options = new Set(props.options.map((item) => item.key));
      let newValue = (Array.isArray(value) ? value : [value])
        .filter((key) => options.has(key)); // Some options might have been removed.
      newValue = option.selected
        ? [...newValue, option.key]
        : newValue.filter((key) => key !== option.key);
      setValue(newValue);
    } else {
      setValue(option || (text ? { text } : null));
    }
  },
}), { policy: debounce, delay: 250 });

export const DatePicker = InputAdapter(Fluent.DatePicker, (value, setValue) => ({
  value: value ? new Date(value) : undefined,
  onSelectDate: setValue,
}));

export const Dropdown = InputAdapter(Fluent.Dropdown, (value, setValue, props) => ({
  selectedKeys: value,
  selectedKey: value,
  onChange: (e, v) => {
    if (props.multiSelect) {
      const options = new Set(props.options.map((item) => item.key));
      let newValue = (Array.isArray(value) ? value : [value])
        .filter((key) => options.has(key)); // Some options might have been removed.
      newValue = v.selected
        ? [...newValue, v.key]
        : newValue.filter((key) => key !== v.key);
      setValue(newValue);
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
