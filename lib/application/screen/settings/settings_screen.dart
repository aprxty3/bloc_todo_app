
import 'package:flutter/material.dart';

import '../../core/screen_config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});


  static const screenConfig = ScreenConfig(
      icon: Icons.settings, name: 'settings', child: SettingsScreen());

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
