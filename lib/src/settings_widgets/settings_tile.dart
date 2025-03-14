import 'package:easy_settings/src/settings_elements/bool_settings_property.dart';
import 'package:easy_settings/src/settings_elements/button_settings_element.dart';
import 'package:easy_settings/src/settings_elements/double_settings_property.dart';
import 'package:easy_settings/src/settings_elements/enum_settings_property.dart';
import 'package:easy_settings/src/settings_elements/int_settings_property.dart';
import 'package:easy_settings/src/settings_elements/settings_element_interface.dart';
import 'package:easy_settings/src/settings_elements/string_settings_property.dart';
import 'package:easy_settings/src/settings_core/settings_manager.dart';
import 'package:easy_settings/src/settings_widgets/settings_text_field.dart';
import 'package:flutter/material.dart';

/// Displays [settingsElement] depending on its type.
class SettingsTile extends StatefulWidget {
  const SettingsTile({super.key, required this.settingsElement});

  final ISettingsElement settingsElement;

  @override
  State<StatefulWidget> createState() => _SettingsTile();
}

class _SettingsTile extends State<SettingsTile> {
  @override
  Widget build(BuildContext context) {
    var settingsElement = widget.settingsElement;
    if (settingsElement is BoolSettingsProperty) {
      return SwitchListTile(
          title: Text(settingsElement.title),
          subtitle: settingsElement.subtitle != null
              ? Text(settingsElement.subtitle!)
              : null,
          secondary: Icon(settingsElement.iconData),
          value: settingsElement.value,
          onChanged: (newValue) {
            setState(() {
              settingsManager.updatePropertyValue(
                  settingsElement.key, !settingsElement.value);
            });
          });
    } else if (settingsElement is EnumSettingsProperty) {
      return ListTile(
        title: Text(settingsElement.title),
        subtitle: settingsElement.subtitle != null
            ? Text(settingsElement.subtitle!)
            : null,
        leading: Icon(settingsElement.iconData),
        trailing: DropdownButton<int>(
            underline: const DropdownButtonHideUnderline(
              child: SizedBox.shrink(),
            ),
            value: settingsElement.value,
            onChanged: (newValue) {
              if (newValue != null) {
                setState(() {
                  settingsManager.updatePropertyValue(
                      settingsElement.key, newValue);
                });
              }
            },
            items: settingsElement.choices
                .map((choice) => DropdownMenuItem<int>(
                    value: settingsElement.choices.indexOf(choice),
                    child: Text(choice)))
                .toList()),
      );
    } else if (settingsElement is ButtonSettingsElement) {
      return ListTile(
        title: Text(settingsElement.title),
        subtitle: settingsElement.subtitle != null
            ? Text(settingsElement.subtitle!)
            : null,
        leading: Icon(settingsElement.iconData),
        onTap: () => settingsElement.onClick(context),
      );
    } else if (settingsElement is StringSettingsProperty ||
        settingsElement is IntSettingsProperty ||
        settingsElement is DoubleSettingsProperty) {
      return ListTile(
          title: Text(settingsElement.title),
          subtitle: settingsElement.subtitle != null
              ? Text(settingsElement.subtitle!)
              : null,
          leading: Icon(settingsElement.iconData),
          trailing: SizedBox(
              width: 100,
              child: settingsElement is StringSettingsProperty
                  ? SettingsTextField<String>(
                      settingsPropertyKey: settingsElement.key)
                  : settingsElement is IntSettingsProperty
                      ? SettingsTextField<int>(
                          settingsPropertyKey: settingsElement.key)
                      : settingsElement is DoubleSettingsProperty
                          ? SettingsTextField<double>(
                              settingsPropertyKey: settingsElement.key)
                          : const SizedBox.shrink()));
    } else {
      return const SizedBox.shrink();
    }
  }
}
