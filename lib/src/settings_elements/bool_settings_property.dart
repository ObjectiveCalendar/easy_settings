import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:flutter/material.dart';

/// Represents a settings property with two states.
class BoolSettingsProperty implements ISettingsProperty {
  BoolSettingsProperty(
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
  late bool value;

  @override
  final bool defaultValue;

  @override
  final IconData iconData;
}
