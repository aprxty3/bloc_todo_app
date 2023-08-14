import 'package:flutter/material.dart';

import '../../core/screen_config.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  static const screenConfig = ScreenConfig(
      icon: Icons.work_history, name: 'overview', child: OverviewScreen());

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red,);
  }
}
