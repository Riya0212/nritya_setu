
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nritya_setu/screens/login/index.dart';

class NAVIGATION {
  static const String home = '/home';
  static const String login = '/login';

}

List<Map<String, dynamic>> stackNavigation = [
  {
    "name": NAVIGATION.login,
    "component": (BuildContext context, GoRouterState state) =>
        const LoginScreen(),
    "options": {"path": NAVIGATION.login}
  },
];