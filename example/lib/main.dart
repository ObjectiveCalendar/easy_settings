import 'package:easy_settings/easy_settings.dart';
import 'package:example/settings.dart';
import 'package:flutter/material.dart';
import 'package:property_change_notifier/property_change_notifier.dart';

void main() async {
  await initializeSettings(settingsCategories);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PropertyChangeProvider<SettingsPropertyChangedNotifier, String>(
        value: settingsPropertyChangedNotifier,
        child: PropertyChangeConsumer<SettingsPropertyChangedNotifier, String>(
            properties: const [isDarkKey],
            builder: (p0, p1, p2) => MaterialApp(
                  title: 'Settings',
                  themeMode: getSettingsPropertyValue<bool>(isDarkKey)
                      ? ThemeMode.dark
                      : ThemeMode.light,
                  theme: ThemeData(brightness: Brightness.light),
                  darkTheme: ThemeData(brightness: Brightness.dark),
                  home: const MyHomePage(),
                )));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: const EasySettingsWidget());
  }
}
