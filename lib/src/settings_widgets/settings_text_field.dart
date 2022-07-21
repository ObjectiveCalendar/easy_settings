import 'package:easy_settings/src/settings_core/settings_manager.dart';
import 'package:flutter/material.dart';

/// A TextField that updates the [ISettingsProperty] with key [settingsPropertyKey] every time it losts focus.
class SettingsTextField<T> extends StatefulWidget {
  const SettingsTextField({Key? key, required this.settingsPropertyKey})
      : super(key: key);

  final String settingsPropertyKey;

  @override
  State<StatefulWidget> createState() => _SettingsTextField<T>();
}

class _SettingsTextField<T> extends State<SettingsTextField> {
  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  void onFocusChanged() {
    if (!focusNode.hasFocus) {
      Object? newValue;
      if (T == int) {
        newValue = int.tryParse(textEditingController.text);
      } else if (T == double) {
        newValue = double.tryParse(textEditingController.text);
      } else if (T == String) {
        newValue = textEditingController.text;
      }
      if (newValue != null) {
        settingsManager.updatePropertyValue(
            widget.settingsPropertyKey, newValue);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    focusNode.addListener(onFocusChanged);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    textEditingController.text =
        settingsManager.getPropertyValue(widget.settingsPropertyKey).toString();
    return TextField(
        focusNode: focusNode,
        controller: textEditingController,
        decoration: const InputDecoration(border: InputBorder.none));
  }
}
