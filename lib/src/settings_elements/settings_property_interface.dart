import 'package:easy_settings/src/settings_elements/settings_element_interface.dart';

/// Represents a settings with a [value] that can be stored and gotten from its [key].
abstract class ISettingsProperty implements ISettingsElement {
  /// A [String] that identifies the property. Should be unique.
  String get key;

  /// The value of the [ISettingsProperty].
  Object get value;

  /// The default value of the [ISettingsProperty].
  Object get defaultValue;
}
