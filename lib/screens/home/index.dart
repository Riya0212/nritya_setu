import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:nritya_setu/Constants/index.dart';
import 'package:nritya_setu/components/form_utils.dart';
import 'package:nritya_setu/components/icon/icon_component.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/navigation/app_navigation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> utilities = [
    {"title": "Fees Management", "icon": FontAwesome5.money_bill_wave},
    {"title": "University Management", "icon": FontAwesome5.graduation_cap},
    {"title": "Teacher Management", "icon": FontAwesome5.chalkboard_teacher},
    {"title": "Feedback", "icon": FontAwesome5.comment},
    {"title": "Results", "icon": Icons.description},
  ];

  Widget buildCardTitle({required String title, required IconData icon}) {
    final colors = Theme.of(context).colors;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextComponent(
          text: title,
          style: TextStyle(
            color: colors.colorBlack,
            fontWeight: FontWeight.bold,
            fontSize: Metrics.getFontSize(context, 18),
          ),
        ),

        Icon(
          icon,
          color: colors.marronColor,
          size: Metrics.height(context) * 0.032,
        ),
      ],
    );
  }

  PreferredSizeWidget buildHomeAppbar() {
    final colors = Theme.of(context).colors;
    return buildCustomAppBar(
      context,
      '',
      leadingWidth:
          Metrics.isTablet(context)
              ? Metrics.width(context) * 0.1
              : Metrics.width(context) * 0.03,
      isLeadingClickable: false,
      customLeading: Row(
        children: [SizedBox(width: Metrics.width(context) * 0.02)],
      ),
      hasLeading: true,
      onBackPress: () {},
      actions: [
        Row(
          children: [
            // GestureDetector(
            //   onTap: () {},
            //   child: Padding(
            //     padding: EdgeInsets.only(right: 15.w),
            //     child: badges.Badge(
            //       stackFit: StackFit.loose,
            //       badgeContent: Text(
            //         homeController.notifications.value.toString(),
            //         style: TextStyle(color: colorWhite, fontSize: 8.h),
            //       ),
            //       position: badges.BadgePosition.topEnd(top: -10, end: -6),
            //       badgeAnimation: const badges.BadgeAnimation.scale(
            //         toAnimate: true,
            //         animationDuration: Duration(milliseconds: 250),
            //       ),
            //       badgeStyle: const badges.BadgeStyle(badgeColor: colorRed),
            //       showBadge:
            //           homeController.notifications.value! > 0 ? true : false,
            //       child: const Icon(Icons.notifications, color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
      customTitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextComponent(
            text: 'Namaste, RIYA',
            style: TextStyle(
              color: colors.defaultWhite,
              fontWeight: FontWeight.bold,
              fontSize:
                  Metrics.isTablet(context)
                      ? Metrics.getFontSize(context, 20)
                      : Metrics.getFontSize(context, 16),
            ),
          ),
          TextComponent(
            text: 'अभ्यासेन कौशलम् - Skill comes through practice ',
            style: TextStyle(
              color: colors.appbarColor,
              fontWeight: FontWeight.bold,
              fontSize:
                  Metrics.isTablet(context)
                      ? Metrics.getFontSize(context, 18)
                      : Metrics.getFontSize(context, 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStudentStatsCard({
    required IconData icon,
    required String value,
    required String title,
    required Color mainColor,
  }) {
    final colors = Theme.of(context).colors;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(Metrics.width(context) * 0.02),
        decoration: BoxDecoration(
          color: mainColor.withOpacity(0.15),
          borderRadius: BorderRadius.circular(Metrics.height(context) * 0.01),
        ),
        child: Column(
          children: [
            Icon(icon, color: mainColor, size: Metrics.height(context) * 0.03),

            TextComponent(
              text: value,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.bold,
                fontSize: Metrics.getFontSize(context, 19),
              ),
            ),

            TextComponent(
              text: title,
              style: TextStyle(
                color: mainColor,
                fontWeight: FontWeight.w600,
                fontSize: Metrics.getFontSize(context, 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStudentsOverview() {
    final colors = Theme.of(context).colors;

    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),
      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: Column(
        children: [
          buildCardTitle(title: 'Student Overview', icon: Icons.group_outlined),
          SizedBox(height: Metrics.height(context) * 0.01),
          Row(
            children: [
              buildStudentStatsCard(
                mainColor: colors.appbarColor,
                title: 'Total',
                value: '200',
                icon: Icons.group_outlined,
              ),
              SizedBox(width: Metrics.width(context) * 0.02),
              buildStudentStatsCard(
                mainColor: Colors.lightGreen,
                title: 'Active',
                value: '180',
                icon: Icons.person_add_outlined,
              ),
              SizedBox(width: Metrics.width(context) * 0.02),

              buildStudentStatsCard(
                mainColor: colors.colorRed,
                title: 'Inactive',
                value: '20',
                icon: Icons.person_remove_outlined,
              ),
            ],
          ),

          SizedBox(height: Metrics.height(context) * 0.02),

          Row(
            children: [
              Expanded(
                child: buildChildBtn(
                  width: double.infinity,
                  context: context,
                  title: 'View ALL',
                  backgroundColor: Colors.orange,
                  onTap: () {},
                ),
              ),
              SizedBox(width: Metrics.width(context) * 0.02),
              Expanded(
                child: buildChildBtn(
                  width: double.infinity,
                  backgroundColor: colors.colorGreen,
                  context: context,
                  title: 'Add Student',
                  onTap: () {
                    context.pushNamed(NAVIGATION.addStudents);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: Metrics.height(context) * 0.01),
        ],
      ),
    );
  }

  Widget buildContentCards({
    required Color mainColor,
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(context).colors;

    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(Metrics.width(context) * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Metrics.height(context) * 0.015,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // colors: [Color(0xff7A1E2B), Color(0xff5E1621)],
              colors: [mainColor.withOpacity(0.7), mainColor.withOpacity(0.8)],
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: colors.defaultWhite),
              SizedBox(height: Metrics.height(context) * 0.005),
              TextComponent(
                text: title,
                style: TextStyle(
                  color: colors.defaultWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContentManagement() {
    final colors = Theme.of(context).colors;

    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),
      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: Column(
        children: [
          buildCardTitle(title: 'Content Management', icon: Icons.add),
          SizedBox(height: Metrics.height(context) * 0.01),
          Row(
            children: [
              buildContentCards(
                mainColor: colors.appbarColor,
                title: 'Upload Videos',
                icon: FontAwesome.videocam,
                onTap: () {},
              ),
              SizedBox(width: Metrics.width(context) * 0.02),

              buildContentCards(
                mainColor: colors.colorLightBlue,
                title: 'Add Syllabus',
                icon: FontAwesome.book,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: Metrics.height(context) * 0.015),

          Row(
            children: [
              buildContentCards(
                mainColor: Colors.deepPurple,
                title: 'Add Notations',
                icon: FontAwesome.music,
                onTap: () {},
              ),
              SizedBox(width: Metrics.width(context) * 0.02),

              buildContentCards(
                mainColor: Color(0xff5E1621),
                title: 'Add Lehra/Track',
                icon: Icons.headphones,
                onTap: () {},
              ),
            ],
          ),
          SizedBox(height: Metrics.height(context) * 0.01),
        ],
      ),
    );
  }

  Widget buildAnalytics() {
    final colors = Theme.of(context).colors;
    List<Map<String, dynamic>> metrics = [
      {"title": "Total Students", "count": 42, "progress": 0.85},
      {"title": "Active Today", "count": 28, "progress": 0.7},
      {"title": "Fees Collected", "count": 45000, "progress": 0.9},
      {"title": "Pending Fees", "count": 12500, "progress": 0.25},
    ];
    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),
      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: Column(
        children: [
          buildCardTitle(
            title: 'Fees & Analytics',
            icon: Icons.bar_chart_sharp,
          ),
          SizedBox(height: Metrics.height(context) * 0.01),
          ...metrics.map((metric) {
            return Container(
              padding: EdgeInsets.symmetric(
                vertical: Metrics.width(context) * 0.01,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + Count
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        metric['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        metric['count'].toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  // Progress Indicator
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: metric['progress'], // 0.0 to 1.0
                      minHeight: 6,
                      backgroundColor: Colors.grey[300],
                      color: colors.marronColor,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget buildOtherServicesTab() {
    final colors = Theme.of(context).colors;

    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),
      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextComponent(
                text: 'Utilities',
                style: TextStyle(
                  color: colors.colorBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: Metrics.getFontSize(context, 18),
                ),
              ),

              Icon(
                Icons.miscellaneous_services,
                color: colors.marronColor,
                size: Metrics.height(context) * 0.035,
              ),
            ],
          ),
          SizedBox(height: Metrics.height(context) * 0.01),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(0),
            itemCount: utilities.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // 4 items in a row
              crossAxisSpacing: Metrics.width(context) * 0.03,
              mainAxisSpacing: Metrics.width(context) * 0.03,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              final item = utilities[index];
              return InkWell(
                onTap: () {
                  log('pressed--> $index');
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          Metrics.height(context) * 0.015,
                        ),
                        color: colors.marronColor, // background color
                      ),
                      padding: EdgeInsets.all(Metrics.width(context) * 0.025),
                      child: Icon(
                        item['icon'],
                        color: colors.appbarColor,
                        size: 22,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['title'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: colors.marronColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      backgroundColor: colors.marronColor.withOpacity(0.1),
      appBar: buildHomeAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Metrics.width(context) * 0.03),
          child: Column(
            children: [
              SizedBox(height: Metrics.height(context) * 0.01),
              buildStudentsOverview(),
              SizedBox(height: Metrics.height(context) * 0.02),
              buildContentManagement(),
              SizedBox(height: Metrics.height(context) * 0.02),
              buildOtherServicesTab(),
              SizedBox(height: Metrics.height(context) * 0.02),

              buildAnalytics(),
              SizedBox(height: Metrics.height(context) * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
