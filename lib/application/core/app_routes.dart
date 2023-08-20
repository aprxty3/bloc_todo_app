import 'package:bloc_todo_app/application/core/app_routes_observer.dart';
import 'package:bloc_todo_app/application/screen/home/home_screen.dart';
import 'package:bloc_todo_app/application/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screen/dashboard/dashboard_screen.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

const String _basePath = '/home';

final routes = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '$_basePath/${DashboardScreen.screenConfig.name}',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      name: SettingsScreen.screenConfig.name,
      path: '$_basePath/${SettingsScreen.screenConfig.name}',
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
    ShellRoute(
      navigatorKey: shellKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          name: HomeScreen.screenConfig.name,
          path: '$_basePath/:tab',
          builder: (context, state) => HomeScreen(
            key: state.pageKey,
            tab: state.pathParameters['tab']!,
          ),
        )
      ],
    ),
  ],
);
