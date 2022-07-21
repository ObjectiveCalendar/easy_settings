import 'package:easy_settings/src/settings_elements/settings_element_interface.dart';
import 'package:flutter/material.dart';

/// Represents a clickable settings that can run a method [onClick].
class ButtonSettingsElement implements ISettingsElement {
  ButtonSettingsElement(
      {required this.title,
      this.subtitle,
      required this.iconData,
      required this.onClick});

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final IconData iconData;

  /// Takes a [BuildContext] parameter to allow to show [AlertDialog].
  ///
  /// Can be used to ask for confirmation before doing something for example.
  final Function(BuildContext context) onClick;
}
