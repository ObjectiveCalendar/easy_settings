import 'package:easy_settings/src/settings_elements/settings_category.dart';
import 'package:easy_settings/src/settings_core/settings_manager.dart';
import 'package:easy_settings/src/settings_core/settings_property_changed_notifier.dart';

/// Notifies listeners every time a settings value changed.
///
/// The notification message is the [ISettingsProperty.key] of the property that changed.
/// It is possible to register to this notifier to run a callback when a [ISettingsProperty] changed.
SettingsPropertyChangedNotifier get settingsPropertyChangedNotifier =>
    settingsManager.settingsPropertyChangedNotifier;

/// Initializes and loads the settings.
///
/// Must be called once in [main] function in order to get everything working.
Future<void> initializeSettings(
    Iterable<SettingsCategory> settingsCategories) async {
  await SettingsManager.initializeSettings(settingsCategories);
}

/// Returns the value of the [ISettingsProperty] with key [key] as type [T].
T getSettingsPropertyValue<T>(String key) {
  return settingsManager.getPropertyValue(key) as T;
}

/// Updates the [ISettingsProperty] with key [key] to set its value to [newValue].
void updateSettingsPropertyValue(String key, Object newValue) {
  settingsManager.updatePropertyValue(key, newValue);
}

/// Sets [ISettingsProperty.value] to [ISettingsProperty.defaultValue] for all properties.
void resetSettings() {
  settingsManager.resetSettings();
}
