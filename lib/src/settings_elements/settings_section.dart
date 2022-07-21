import 'package:easy_settings/src/settings_elements/settings_element_interface.dart';

/// Stores many [ISettingsElement].
class SettingsSection {
  SettingsSection({this.title, required this.settingsElements});
  final String? title;
  final List<ISettingsElement> settingsElements;
}
