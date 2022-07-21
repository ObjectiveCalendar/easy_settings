import 'package:property_change_notifier/property_change_notifier.dart';

class SettingsPropertyChangedNotifier extends StringPropertyChangeNotifier {
  void notifySettingsPropertyChanged(String key) {
    notifyListeners(key);
  }
}
