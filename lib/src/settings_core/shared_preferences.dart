import 'package:easy_settings/src/settings_elements/bool_settings_property.dart';
import 'package:easy_settings/src/settings_elements/double_settings_property.dart';
import 'package:easy_settings/src/settings_elements/enum_settings_property.dart';
import 'package:easy_settings/src/settings_elements/int_settings_property.dart';
import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:easy_settings/src/settings_elements/string_settings_property.dart';
import 'package:easy_settings/src/settings_core/settings_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Provides methods to save and get settings through [SharedPreferences].
class SharedPreferencesManager {
  SharedPreferencesManager(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  void savePropertyValue(ISettingsProperty settingsProperty) {
    if (settingsProperty is BoolSettingsProperty) {
      sharedPreferences.setBool(settingsProperty.key, settingsProperty.value);
    } else if (settingsProperty is EnumSettingsProperty) {
      sharedPreferences.setInt(settingsProperty.key, settingsProperty.value);
    } else if (settingsProperty is StringSettingsProperty) {
      sharedPreferences.setString(settingsProperty.key, settingsProperty.value);
    } else if (settingsProperty is IntSettingsProperty) {
      sharedPreferences.setInt(settingsProperty.key, settingsProperty.value);
    } else if (settingsProperty is DoubleSettingsProperty) {
      sharedPreferences.setDouble(settingsProperty.key, settingsProperty.value);
    }
  }

  void saveAllPropertiesValue() {
    for (var settingsProperty in settingsManager.settingsProperties) {
      savePropertyValue(settingsProperty);
    }
  }

  T? getPropertyValue<T>(String key) {
    if (T == bool) {
      return sharedPreferences.getBool(key) as T?;
    } else if (T == String) {
      return sharedPreferences.getString(key) as T?;
    } else if (T == int) {
      return sharedPreferences.getInt(key) as T?;
    } else if (T == double) {
      return sharedPreferences.getDouble(key) as T?;
    }
    return null;
  }
}
