import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:flutter/material.dart';

/// Represents a settings property with a [double] value.
class DoubleSettingsProperty implements ISettingsProperty {
  DoubleSettingsProperty(
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
  final double defaultValue;

  @override
  late double value;

  @override
  final IconData iconData;
}
