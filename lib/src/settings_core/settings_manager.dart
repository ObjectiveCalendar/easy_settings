import 'package:collection/collection.dart';
import 'package:easy_settings/src/settings_elements/settings_category.dart';
import 'package:easy_settings/src/settings_elements/bool_settings_property.dart';
import 'package:easy_settings/src/settings_elements/double_settings_property.dart';
import 'package:easy_settings/src/settings_elements/enum_settings_property.dart';
import 'package:easy_settings/src/settings_elements/int_settings_property.dart';
import 'package:easy_settings/src/settings_elements/settings_property_interface.dart';
import 'package:easy_settings/src/settings_elements/string_settings_property.dart';
import 'package:easy_settings/src/settings_core/settings_property_changed_notifier.dart';
import 'package:easy_settings/src/settings_core/shared_preferences.dart';
import 'package:property_change_notifier/property_change_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SettingsManager _settingsManager;
SettingsManager get settingsManager => _settingsManager;

late final SharedPreferencesManager _sharedPreferencesManager;

bool _isSettingsManageredInitialized = false;

/// Provides method to interact with settings
class SettingsManager extends PropertyChangeNotifier {
  SettingsManager(this.settingsCategories) {
    // Store properties to find them easily later.
    settingsProperties = settingsCategories
        .map((settingsCategory) => settingsCategory.settingsSections)
        .expand((x) => x)
        .map((settingsSection) =>
            settingsSection.settingsElements.whereType<ISettingsProperty>())
        .expand((x) => x);
    _loadPropertiesValue();
  }

  final SettingsPropertyChangedNotifier settingsPropertyChangedNotifier =
      SettingsPropertyChangedNotifier();

  final Iterable<SettingsCategory> settingsCategories;

  late final Iterable<ISettingsProperty> settingsProperties;

  /// Initialize [SharedPreferences] and create an instance of [SettingsManager].
  static Future<void> initializeSettings(
      Iterable<SettingsCategory> settingsCategories) async {
    if (!_isSettingsManageredInitialized) {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      _sharedPreferencesManager = SharedPreferencesManager(sharedPreferences);
      _settingsManager = SettingsManager(settingsCategories);
      _isSettingsManageredInitialized = true;
    }
  }

  Object getPropertyValue(String key) {
    var settingsProperty =
        settingsProperties.firstWhereOrNull((element) => element.key == key);
    if (settingsProperty != null) {
      return settingsProperty.value;
    } else {
      throw Exception("Cannot find a settings property with key $key");
    }
  }

  void updatePropertyValue(String key, Object newValue) {
    var settingsProperty =
        settingsProperties.firstWhereOrNull((element) => element.key == key);
    if (settingsProperty == null) {
      throw Exception("Cannot find a settings property with key $key");
    }
    if (newValue == settingsProperty.value) {
      return;
    }
    if (settingsProperty is BoolSettingsProperty) {
      settingsProperty.value = newValue as bool;
    } else if (settingsProperty is EnumSettingsProperty) {
      settingsProperty.value = newValue as int;
    } else if (settingsProperty is StringSettingsProperty) {
      settingsProperty.value = newValue as String;
    } else if (settingsProperty is IntSettingsProperty) {
      settingsProperty.value = newValue as int;
    } else if (settingsProperty is DoubleSettingsProperty) {
      settingsProperty.value = newValue as double;
    }
    _sharedPreferencesManager.savePropertyValue(settingsProperty);
    settingsPropertyChangedNotifier.notifyListeners(settingsProperty.key);
  }

  void resetSettings() {
    for (var settingsProperty in settingsProperties) {
      updatePropertyValue(settingsProperty.key, settingsProperty.defaultValue);
    }
    notifyListeners();
  }

  void _loadPropertiesValue() {
    for (var settingsProperty in settingsProperties) {
      if (settingsProperty is BoolSettingsProperty) {
        settingsProperty.value = _sharedPreferencesManager
                .getPropertyValue<bool>(settingsProperty.key) ??
            settingsProperty.defaultValue;
      } else if (settingsProperty is EnumSettingsProperty) {
        settingsProperty.value = _sharedPreferencesManager
                .getPropertyValue<int>(settingsProperty.key) ??
            settingsProperty.defaultValue;
      } else if (settingsProperty is StringSettingsProperty) {
        settingsProperty.value = _sharedPreferencesManager
                .getPropertyValue<String>(settingsProperty.key) ??
            settingsProperty.defaultValue;
      } else if (settingsProperty is IntSettingsProperty) {
        settingsProperty.value = _sharedPreferencesManager
                .getPropertyValue<int>(settingsProperty.key) ??
            settingsProperty.defaultValue;
      } else if (settingsProperty is DoubleSettingsProperty) {
        settingsProperty.value = _sharedPreferencesManager
                .getPropertyValue<double>(settingsProperty.key) ??
            settingsProperty.defaultValue;
      }
    }
  }
}
