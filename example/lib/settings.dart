import 'package:easy_settings/easy_settings.dart';
import 'package:flutter/material.dart';

const String isDarkKey = "isDark";

List<SettingsCategory> settingsCategories = [
  SettingsCategory(
      title: "Category 1",
      iconData: Icons.settings,
      topChild: const Center(child: Text("I have one section with no title")),
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
              title: "Reset settings",
              subtitle: "I ask for confirmation.",
              iconData: Icons.power_input,
              onClick: (BuildContext context) => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text("Reset settings"),
                        content: Builder(
                          builder: (context) {
                            return const Text(
                                "Do you want to reset settings ?");
                          },
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text('Yes'),
                            onPressed: () {
                              resetSettings();
                              Navigator.of(context).pop();
                            },
                          ),
                        ]);
                  })),
          ButtonSettingsElement(
              title: "Quick reset settings",
              subtitle: "I don't ask for confirmation.",
              iconData: Icons.restore,
              onClick: (BuildContext context) => resetSettings())
        ])
      ]),
  SettingsCategory(
      title: "Category 2",
      topChild: const Center(child: Text("I have two sections with titles")),
      iconData: Icons.admin_panel_settings,
      settingsSections: [
        SettingsSection(title: "Section 1", settingsElements: [
          BoolSettingsProperty(
              key: "bool1",
              title: "I am a boolean settings",
              defaultValue: false,
              iconData: Icons.youtube_searched_for)
        ]),
        SettingsSection(title: "Section 2", settingsElements: [
          BoolSettingsProperty(
              key: "bool2",
              title: "I am another boolean settings",
              subtitle: "Can you click on me ?",
              defaultValue: false,
              iconData: Icons.no_accounts)
        ])
      ])
];
