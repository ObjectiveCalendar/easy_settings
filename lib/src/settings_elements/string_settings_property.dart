import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:flutter/material.dart';

/// Represents a settings property with a [String] value.
class StringSettingsProperty implements ISettingsProperty {
  StringSettingsProperty(
      {required this.key,
      required this.title,
      this.subtitle,
      required this.defaultValue,
      required this.iconData});
  @override
  final String key;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  final String defaultValue;

  @override
  late String value;

  @override
  final IconData iconData;
}
