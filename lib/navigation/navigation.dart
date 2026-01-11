import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:go_router/go_router.dart';
// import 'package:photo_reminder/services/notification_tap_handler.dart';

// Declare the RouteObserver globally
final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

class NavigationConfig {
  final List<Map<String, dynamic>> stackNavigation;

  NavigationConfig({required this.stackNavigation});

  List<GetPage> get getPages => buildGetPages(stackNavigation);
  List<GetPage> buildGetPages(List<Map<String, dynamic>> routeConfig) {
    return routeConfig.map<GetPage>((route) {
      final String name = route['name'];
      final Widget Function() component = route['component'];
      final List<GetMiddleware> middleware = route['middleware'] ?? [];

      return GetPage(
        name: name,
        page: component,
        middlewares: middleware,
        transition: Transition.rightToLeft, // slide from right
        transitionDuration: const Duration(milliseconds: 400),
      );
    }).toList();
  }
}
