import * as React from 'react';
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

export const ComboBox = InputAdapter(Fluent.ComboBox, (value, setValue) => ({
  selectedKey: value.key || value,
  text: value.text || value,
  onChange: (e, option, i, text) => setValue(option || (text ? { text } : null)),
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

// Safari-compatible file upload button
export const FileUploadButton = InputAdapter(
  ({
    value,
    onChange,
    buttonType = 'default',
    icon,
    text,
    accept,
    multiple,
    ...otherProps
  }) => {
    const fileInputRef = React.useRef(null);

    const handleClick = () => {
      if (fileInputRef.current) {
        fileInputRef.current.click();
      }
    };

    const handleFileChange = (event) => {
      const { files } = event.target;
      if (files && files.length > 0) {
        // Convert FileList to format Shiny expects
        const fileData = Array.from(files).map((file) => ({
          name: file.name,
          size: file.size,
          type: file.type,
          lastModified: file.lastModified,
        }));
        onChange(multiple ? fileData : fileData[0]);
      }
    };

    // Select the appropriate button component
    let ButtonComponent;
    if (buttonType === 'primary') {
      ButtonComponent = Fluent.PrimaryButton;
    } else if (buttonType === 'compound') {
      ButtonComponent = Fluent.CompoundButton;
    } else if (buttonType === 'action') {
      ButtonComponent = Fluent.ActionButton;
    } else if (buttonType === 'command') {
      ButtonComponent = Fluent.CommandButton;
    } else if (buttonType === 'commandBar') {
      ButtonComponent = Fluent.CommandBarButton;
    } else if (buttonType === 'icon') {
      ButtonComponent = Fluent.IconButton;
    } else {
      ButtonComponent = Fluent.DefaultButton;
    }

    return (
      <div>
        <ButtonComponent
          onClick={handleClick}
          text={text}
          iconProps={icon ? { iconName: icon } : undefined}
          disabled={otherProps.disabled}
          className={otherProps.className}
          style={otherProps.style}
        />
        <input
          ref={fileInputRef}
          type="file"
          accept={accept}
          multiple={multiple}
          onChange={handleFileChange}
          style={{ display: 'none' }}
        />
      </div>
    );
  },
  (value, setValue) => ({
    value,
    onChange: setValue,
  }),
);
