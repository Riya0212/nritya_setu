
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nritya_setu/screens/adminScreens/AddStudentsForm/index.dart';
import 'package:nritya_setu/screens/dashboard/index.dart';
import 'package:nritya_setu/screens/login/index.dart';
import 'package:nritya_setu/screens/study/syllabus/index.dart';

class NAVIGATION {
  static const String dashboard = '/';
  static const String login = '/login';
  static const String addStudents = '/addStudents';
  static const String syllabusScreen = '/syllabusScreen';



}

List<Map<String, dynamic>> stackNavigation = [
  {
    "name": NAVIGATION.login,
    "component": (BuildContext context, GoRouterState state) =>
        const LoginScreen(),
    "options": {"path": NAVIGATION.login}
  },
   {
    "name": NAVIGATION.dashboard,
    "component": (BuildContext context, GoRouterState state) =>
        const DashboardScreen(),
    "options": {"path": NAVIGATION.dashboard}
  },
  {
    "name": NAVIGATION.addStudents,
    "component": (BuildContext context, GoRouterState state) =>
        const AddStudentsForm(),
    "options": {"path": NAVIGATION.addStudents}
  },

   {
    "name": NAVIGATION.syllabusScreen,
    "component": (BuildContext context, GoRouterState state) =>
        const SyllabusScreen(),
    "options": {"path": NAVIGATION.syllabusScreen}
  },
];