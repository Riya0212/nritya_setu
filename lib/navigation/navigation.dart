import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Declare the RouteObserver globally
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class NavigationConfig {
  final List<Map<String, dynamic>> stackNavigation;

  // ✅ 1. Declare a final field to hold the router instance.
  late final GoRouter router;

  // ✅ 2. Initialize the router in the constructor.
  NavigationConfig(this.stackNavigation) {
    router = GoRouter(
      routes: _buildRoutes(stackNavigation),
      // navigatorKey: NotificationTapHandler.navigatorKey,
      observers: [routeObserver],
    );
  }

  // This method is now used by the constructor to build the routes list.
  List<GoRoute> _buildRoutes(List<Map<String, dynamic>> routesConfig) {
    return routesConfig.map((route) {
      final name = route["name"];
      final path = route["options"]["path"];
      final component = route['component'];

      return GoRoute(
        name: name,
        path: path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            MaterialPage<dynamic>(child: component(context, state)),
      );
    }).toList();
  }
}