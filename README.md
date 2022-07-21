<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A package that helps to manage and display settings.

## Features

* An API to manage your settings without difficulty.
* A widget to display your settings easily.

 ![Image](https://i.postimg.cc/5tSGGM40/easy-settings1.png)
 ![Image](https://i.postimg.cc/DZfD3Y0c/easy-settings2.png)

## Getting started

Add the following line to `pubspec.yaml`:

```yaml
dependencies:
  easy_settings: ^1.0.0
```

## Usage

```dart
import 'package:easy_settings/easy_settings.dart';
import 'package:flutter/material.dart';

List<SettingsCategory> settingsCategories = [
  SettingsCategory(
      title: "Category 1",
      iconData: Icons.settings,
      settingsSections: [
        SettingsSection(settingsElements: [
          StringSettingsProperty(
              key: "str",
              title: "This is a String settings",
              defaultValue: "Test",
              iconData: Icons.text_fields),
          IntSettingsProperty(
              key: "integer",
              title: "This is an int settings",
              defaultValue: 3,
              iconData: Icons.numbers),
          DoubleSettingsProperty(
              key: "double",
              title: "This is a double settings",
              defaultValue: 3.14,
              iconData: Icons.double_arrow),
          BoolSettingsProperty(
              key: isDarkKey,
              title: "Dark Theme",
              subtitle: "Do you want to use dark theme ?",
              defaultValue: false,
              iconData: Icons.dark_mode),
          EnumSettingsProperty(
              key: "language",
              title: "Language",
              subtitle: "This is an enum settings",
              defaultValue: 0,
              iconData: Icons.language,
              choices: ["English", "Espanol", "Français"]),
          ButtonSettingsElement(
              title: "Quick reset settings",
              subtitle: "I don't ask for confirmation.",
              iconData: Icons.restore,
              onClick: (BuildContext context) => resetSettings())
        ])
      ])
];

void main() async {
  await initializeSettings(settingsCategories);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
                  title: 'Settings',
                  home: const MyHomePage());
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

```

Make sure to check out [example](https://github.com/ObjectiveCalendar/easy_settings/tree/main/example/lib) for more details.
