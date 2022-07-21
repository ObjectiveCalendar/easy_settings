import 'package:easy_settings/src/settings_elements/settings_section.dart';
import 'package:flutter/material.dart';

/// Stores [ISettingsElements] reparted in sections.
/// Can contain an optional [topChild] widget that will be displayed before the sections.
class SettingsCategory {
  SettingsCategory(
      {required this.title,
      required this.iconData,
      this.topChild,
      required this.settingsSections});
  final String title;
  final IconData iconData;
  final Widget? topChild;
  final Iterable<SettingsSection> settingsSections;
}
