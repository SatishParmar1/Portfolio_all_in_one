import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../view/homepage.dart';
import '../view/skill.dart';

final List<GoRoute> appRoutes = [
  GoRoute(
    path: '/',
    builder: (BuildContext context, GoRouterState state) {
      return const Homepage();
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/skills',
        builder: (BuildContext context, GoRouterState state) {
          return const Skillpage();
        },
      ),
    ],
  ),
];
