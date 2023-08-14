import 'package:bloc_todo_app/application/core/screen_config.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const screenConfig = ScreenConfig(
      icon: Icons.dashboard, name: 'dashboard', child: DashboardScreen());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
    );
  }
}
