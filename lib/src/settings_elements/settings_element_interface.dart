import 'package:flutter/material.dart';

/// Contains the minimum requirements for a settings.
abstract class ISettingsElement {
  String get title;

  String? get subtitle;

  IconData get iconData;
}
