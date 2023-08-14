import 'package:bloc_todo_app/application/core/app_routes_observer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final routes = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/home/start',
  observers: [GoRouterObserver()],
  routes: [
    GoRoute(
      path: '/home/settings',
      builder: (context, state) {
        return Container(
          color: Colors.amber,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/home/start'),
                child: const Text('Go Back'),
              ),
              TextButton(
                onPressed: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/home/start');
                  }
                },
                child: const Text('Go Back'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: '/home/start',
      builder: (context, state) {
        return Container(
          color: Colors.blue,
          child: ElevatedButton(
            onPressed: () => context.go('/home/settings'),
            child: const Text('Go to Settings'),
          ),
        );
      },
    ),
  ],
);
