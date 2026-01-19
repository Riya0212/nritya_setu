import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/utils.dart';
import 'package:nritya_setu/packages/motion_tab_bar/MotionTabBar.dart';
import 'package:nritya_setu/packages/motion_tab_bar/MotionTabBarController.dart';
import 'package:nritya_setu/screens/home/index.dart';
import 'package:nritya_setu/screens/riyaaz/index.dart';
import 'package:nritya_setu/screens/settings/index.dart';
import 'package:nritya_setu/screens/study/index.dart';
import 'package:nritya_setu/screens/videos/index.dart';

import '../../Constants/metrics.dart' hide Metrics;
import '../../constants/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 0,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            colors.isDarkMode
                ? Brightness.light
                : Brightness.dark, // Or .dark depending on your image
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      backgroundColor: colors.colorWhite,
      bottomNavigationBar: MotionTabBar(
        controller: _motionTabBarController,
        initialSelectedTab: "Home",
        useSafeArea: true,
        labels: ["Home", "Study", "Riyaaz", "Learning", "Settings"],
        icons: [
          Images.homeIcon,
          Images.syllabusIcon,
          Images.lehraIcon,
          Images.learningIcon,
          Images.settingsIcon,
        ],
        tabSize: Metrics.height(context) * 0.04,
        tabBarHeight: Metrics.height(context) * 0.06,
        textStyle: TextStyle(
          fontSize:
              Metrics.isTablet(context)
                  ? Metrics.getFontSize(context, 14)
                  : Metrics.getFontSize(context, 12),
          color: colors.marronColor,
          fontWeight: FontWeight.w500,
        ),
        tabIconColor: colors.bottomTabGrey,
        tabIconSize:
            Metrics.isTablet(context)
                ? Metrics.height(context) * 0.03
                : Metrics.height(context) * 0.03,
        tabIconSelectedSize:
            Metrics.isTablet(context)
                ? Metrics.height(context) * 0.03
                : Metrics.height(context) * 0.03,
        tabSelectedColor: colors.marronColor,
        tabBarColor: colors.colorWhite,
        onTabItemSelected: (int value) {
          setState(() {
            pageIndex = value;
            _motionTabBarController!.index = value;
          });

          // tabLoadingController.changeTab(value);
        },
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _motionTabBarController,
        children: [
          HomeScreen(),
          StudyScreen(),
          RiyaazScreen(),
          VideoScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}
