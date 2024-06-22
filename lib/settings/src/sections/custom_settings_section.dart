import 'package:babikiss/settings/src/sections/abstract_settings_section.dart';
import 'package:flutter/material.dart';

class CustomSettingsSection extends AbstractSettingsSection {
  const CustomSettingsSection({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
