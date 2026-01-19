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
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: Material(
            // Ensures the global scaffoldBackgroundColor is applied
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Theme(
              data: Theme.of(context), // propagate theme properly
              child: component(context, state),
            ),
          ),
        );
      },
    );
  }).toList();
}


  // List<GoRoute> _buildRoutes(List<Map<String, dynamic>> routesConfig) {
  //   return routesConfig.map((route) {
  //     final name = route["name"];
  //     final path = route["options"]["path"];
  //     final component = route['component'];

  //     return GoRoute(
  //       name: name,
  //       path: path,
  //       pageBuilder: (context, state) {
  //         return CustomTransitionPage<dynamic>(
  //           key: state.pageKey,
  //           child: Theme(
  //             data: Theme.of(context), // propagate theme properly
  //             child: component(context, state),
  //           ),
  //           transitionsBuilder: (
  //             context,
  //             animation,
  //             secondaryAnimation,
  //             child,
  //           ) {
  //             return SlideTransition(
  //               position: Tween<Offset>(
  //                 begin: const Offset(1.0, 0.0),
  //                 end: Offset.zero,
  //               ).animate(animation),
  //               child: FadeTransition(opacity: animation, child: child),
  //             );
  //           },
  //           transitionDuration: const Duration(milliseconds: 300),
  //         );
  //       },
  //     );
  //   }).toList();
  // }


}
