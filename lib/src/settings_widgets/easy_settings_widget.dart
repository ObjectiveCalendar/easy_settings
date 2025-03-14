import 'package:easy_settings/src/settings_core/settings_manager.dart';
import 'package:easy_settings/src/settings_widgets/settings_tab.dart';
import 'package:flutter/material.dart';

/// Displays the settings got from [initializeSettings].
///
/// It will use a [DefaultTabController] if there are two or more [SettingsCategory].
/// Each tab displays a [SettingsCategory] with [SettingsCategory.topChild] if not null, then the section's title and the settings elements for each section in [SettingsCategory.settingsSections].
/// Sections' title can be customized with [sectionStyle].
/// Space between sections can be customized with [spaceBetweenSections]
class EasySettingsWidget extends StatefulWidget {
  const EasySettingsWidget(
      {super.key, this.sectionStyle, this.spaceBetweenSections = 20});

  final TextStyle? sectionStyle;

  final double spaceBetweenSections;

  @override
  State<StatefulWidget> createState() => _EasySettings();
}

class _EasySettings extends State<EasySettingsWidget> {
  void onSettingsManagerNotification() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    settingsManager.addListener(onSettingsManagerNotification);
  }

  @override
  void dispose() {
    settingsManager.removeListener(onSettingsManagerNotification);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: settingsManager.settingsCategories.length == 1
            ? SettingsTab(
                sectionStyle: widget.sectionStyle,
                spaceBetweenSections: widget.spaceBetweenSections,
                settingsCategory: settingsManager.settingsCategories.first)
            : DefaultTabController(
                length: settingsManager.settingsCategories.length,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  TabBar(
                      labelColor: Theme.of(context).iconTheme.color,
                      tabs: settingsManager.settingsCategories
                          .map((settingsCategory) => Tab(
                              text: settingsCategory.title,
                              icon: Icon(
                                settingsCategory.iconData,
                              )))
                          .toList()),
                  Expanded(
                      child: TabBarView(
                          children: settingsManager.settingsCategories
                              .map((settingsCategory) => SettingsTab(
                                  sectionStyle: widget.sectionStyle,
                                  spaceBetweenSections:
                                      widget.spaceBetweenSections,
                                  settingsCategory: settingsCategory))
                              .toList()))
                ])));
  }
}
