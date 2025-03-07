import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_management_app/presentation/ui/screens/main_screen/s_main.dart';

final GoRouter router = GoRouter(
  // 초기 위치
  initialLocation: '/main',
  routes: <RouteBase>[
    GoRoute(
      path: '/main',
      builder: (BuildContext context, GoRouterState state) {
        return const MainScreen();
      },
    ),
  ],
);
