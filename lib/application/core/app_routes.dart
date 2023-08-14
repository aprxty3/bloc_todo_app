import 'package:bloc_todo_app/application/core/app_routes_observer.dart';
import 'package:bloc_todo_app/application/screen/home/home_screen.dart';
import 'package:bloc_todo_app/application/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routes = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/home/dashboard',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/home/settings',
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
    ShellRoute(
      navigatorKey: shellKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/home/:tab',
          builder: (context, state) => HomeScreen(
            key: state.pageKey,
            tab: state.pathParameters['tab']!,
          ),
        )
      ],
    ),
  ],
);
