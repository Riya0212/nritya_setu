import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:nritya_setu/navigation/app_navigation.dart';
import 'package:nritya_setu/navigation/navigation.dart';
import 'package:nritya_setu/services/theme_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/src/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final themeProvider = ThemeProvider();
  themeProvider.loadTheme();

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => themeProvider)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final routeConfig = NavigationConfig(stackNavigation);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ScreenUtilInit(
      minTextAdapt: false,
      ensureScreenSize: true,
      splitScreenMode: true,
      rebuildFactor: RebuildFactors.none,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "PhotoReminder",
          theme: ThemeData(brightness: Brightness.light).copyWith(
            scaffoldBackgroundColor: Color(0xff5E1621).withOpacity(0.1),
          ),
          darkTheme: ThemeData(brightness: Brightness.dark).copyWith(
            scaffoldBackgroundColor: Color(0xff5E1621).withOpacity(0.1),
          ),
          themeMode: themeProvider.currentThemeMode,
          restorationScopeId: 'app',
          routerConfig: routeConfig.router,
        );
      },
    );
  }
}
