import 'package:kaizen_elecon/screens/HomeScreen/index.dart';
import 'package:kaizen_elecon/screens/Kaizen/Register/index.dart';
import 'package:kaizen_elecon/screens/Kaizen/View/view_kaizen.dart';
import 'package:kaizen_elecon/screens/LoginScreen/index.dart';
import 'package:kaizen_elecon/screens/OPL/Register/index.dart';
import 'package:kaizen_elecon/screens/OPL/View/index.dart';
import 'package:kaizen_elecon/screens/PDFModule/parent.dart';
import 'package:kaizen_elecon/screens/SplashScreen/index.dart';

class NAVIGATION {
  static const String home = '/home';
  static const String splash = '/splash';

  static const String login = '/login';
  static const String registerOPL = '/registerOPL';
  static const String registerKaizen = '/registerKaizen';
  static const String viewKaizen = '/viewKaizen';
  static const String viewOPL = '/viewOPL';
  static const String viewPDF = '/viewPDF';

}

List<Map<String, dynamic>> stackNavigation = [
  {
    "name": NAVIGATION.home,
    "component": () => const HomeScreen(),
    "options": {"path": NAVIGATION.home},
  },
  {
    "name": NAVIGATION.splash,
    "component": () => const SplashScreen(),
    "options": {"path": NAVIGATION.splash},
  },
  {
    "name": NAVIGATION.registerKaizen,
    "component": () => const RegisterKaizen(),
    "options": {"path": NAVIGATION.registerKaizen},
  },
  {
    "name": NAVIGATION.login,
    "component": () => const LoginScreen(),
    "options": {"path": NAVIGATION.login},
  },
  {
    "name": NAVIGATION.registerOPL,
    "component": () => const RegisterOPL(),
    "options": {"path": NAVIGATION.registerOPL},
  },
  {
    "name": NAVIGATION.viewKaizen,
    "component": () => const ViewKaizen(),
    "options": {"path": NAVIGATION.viewKaizen},
  },
  {
    "name": NAVIGATION.viewOPL,
    "component": () => const ViewOPL(),
    "options": {"path": NAVIGATION.viewOPL},
  },
  {
    "name": NAVIGATION.viewPDF,
    "component": () => const PDFViewerScreen(),
    "options": {"path": NAVIGATION.viewPDF},
  },
];
