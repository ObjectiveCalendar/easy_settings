import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:flutter/material.dart';

/// Represents a settings property with many states, like an [Enum].
/// Consider using a [BoolSettingsProperty] if there are only two states.
class EnumSettingsProperty implements ISettingsProperty {
  EnumSettingsProperty(
      {required this.key,
      required this.title,
      this.subtitle,
      required this.defaultValue,
      required this.iconData,
      required this.choices});

  @override
  final String key;

  @override
  final String title;

  @override
  final String? subtitle;

  @override
  late int value;

  @override
  final int defaultValue;

  @override
  final IconData iconData;

  /// Stores the [String] representation of each states.
  final List<String> choices;
}
