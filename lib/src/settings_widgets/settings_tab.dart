import 'package:easy_settings/src/settings_elements/settings_category.dart';
import 'package:easy_settings/src/settings_widgets/settings_tile.dart';
import 'package:flutter/material.dart';

/// Displays [settingsCategory.topChild] if not null, then sections' title and their settings elements from [settingsCategory.settingsSections].
class SettingsTab extends StatelessWidget {
  const SettingsTab(
      {Key? key,
      required this.settingsCategory,
      required this.spaceBetweenSections,
      this.sectionStyle})
      : super(key: key);

  final SettingsCategory settingsCategory;

  final TextStyle? sectionStyle;

  final double spaceBetweenSections;

  @override
  Widget build(BuildContext context) {
    var settingsSections = settingsCategory.settingsSections.toList();
    int totalIndex = settingsCategory.topChild == null
        ? settingsSections.length
        : settingsSections.length + 1;
    return ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: totalIndex,
        itemBuilder: (BuildContext context, int settingsSectionIndex) {
          if (settingsCategory.topChild != null && settingsSectionIndex == 0) {
            return settingsCategory.topChild!;
          } else {
            var settingsSection = settingsSections[
                settingsSectionIndex - (totalIndex - settingsSections.length)];
            int count = settingsSection.title != null
                ? settingsSection.settingsElements.length + 1
                : settingsSection.settingsElements.length;
            return ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: count,
                itemBuilder: (BuildContext context, int settingsElementIndex) {
                  if (settingsElementIndex == 0 &&
                      settingsSection.title != null) {
                    return Text(
                      settingsSection.title!,
                      style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)
                          .merge(sectionStyle),
                    );
                  } else {
                    return SettingsTile(
                        settingsElement: settingsSection.settingsElements[
                            settingsElementIndex -
                                (count -
                                    settingsSection.settingsElements.length)]);
                  }
                });
          }
        },
        separatorBuilder: (BuildContext context, int index) =>
            (index == 0 && totalIndex > settingsSections.length)
                ? const SizedBox.shrink()
                : SizedBox(height: spaceBetweenSections));
  }
}
