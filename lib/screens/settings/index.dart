import 'package:flutter/material.dart';
import 'package:nritya_setu/components/customSwitch/index.dart';
import 'package:nritya_setu/components/form_utils.dart';
import 'package:nritya_setu/components/icon/icon_component.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/index.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final List<Map<String, dynamic>> userSettings = [
    {
      "title": "Change Password",
      "description": "Update your account password securely",
      "icon": Icons.lock,
      "mainColor": Colors.red,
      "bgColor": Colors.red.shade50,
    },
    {
      "title": "Email Preferences",
      "description": "Manage your email notifications and subscriptions",
      "icon": Icons.email,
      "mainColor": Colors.orange,
      "bgColor": Colors.orange.shade50,
    },
    {
      "title": "Linked Account",
      "description":
          "Connect or disconnect your social and third-party accounts",
      "icon": Icons.link,
      "mainColor": Colors.blue,
      "bgColor": Colors.blue.shade50,
    },
  ];

  final List<Map<String, dynamic>> userPreferences = [
    {
      "title": "Push Notifications",
      "description": "Manage app push notifications",
      "icon": Icons.notifications,
      "mainColor": Colors.deepPurple,
      "bgColor": Colors.deepPurple.shade50,
      "hasSwitch": true,
    },
    {
      "title": "WhatsApp Notifications",
      "description": "Enable or disable WhatsApp alerts",
      "icon": FontAwesome.whatsapp,
      "mainColor": Colors.green,
      "bgColor": Colors.green.shade50,
      "hasSwitch": true,
    },
    {
      "title": "Dark Mode",
      "description": "Switch between light and dark mode",
      "icon": Icons.palette,
      "mainColor": Colors.pink,
      "bgColor": Colors.pink.shade50,
      "hasSwitch": true,
    },
    {
      "title": "Language",
      "description": "Select your preferred app language",
      "icon": Icons.language,
      "mainColor": Colors.indigo,
      "bgColor": Colors.indigo.shade50,
      "hasSwitch": false,
    },
    {
      "title": "Help & FAQ",
      "description": "Get help or browse frequently asked questions",
      "icon": Icons.help_outline,
      "mainColor": Colors.orange,
      "bgColor": Colors.orange.shade50,
      "hasSwitch": false,
    },
  ];

  Widget buildStudentCard() {
    final colors = Theme.of(context).colors;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(Metrics.width(context) * 0.02),
          decoration: BoxDecoration(
            color: colors.offWhiteBg,
            borderRadius: BorderRadius.circular(
              Metrics.height(context) * 0.015,
            ),
            boxShadow: [
              BoxShadow(
                color: colors.colorLightGrey.withAlpha(50),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    clipBehavior: Clip.none, // allows the badge to overflow
                    children: [
                      // Main container with icon
                      Container(
                        padding: EdgeInsets.all(Metrics.width(context) * 0.015),
                        decoration: BoxDecoration(
                          color: colors.colorWhite,
                          boxShadow: [
                            BoxShadow(
                              color: colors.colorLightGrey.withAlpha(50),
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: const Offset(2, 2),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(
                            Metrics.height(context) * 0.05,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            Metrics.height(context) * 0.06,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(
                              Metrics.width(context) * 0.05,
                            ),
                            color: colors.appbarColor.withOpacity(0.2),
                            child: Icon(
                              Entypo.user,
                              size: Metrics.height(context) * 0.04,
                              color: colors.marronColor,
                            ),
                          ),
                        ),
                      ),

                      // Positioned edit badge
                      Positioned(
                        bottom: -2,
                        right: -2,
                        child: Container(
                          padding: EdgeInsets.all(
                            Metrics.width(context) * 0.01,
                          ),
                          decoration: BoxDecoration(
                            color: colors.marronColor,
                            borderRadius: BorderRadius.circular(
                              Metrics.height(context) * 0.05,
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: colors.defaultWhite,
                            size: Metrics.height(context) * 0.025,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: Metrics.width(context) * 0.03),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Metrics.height(context) * 0.01),

                      TextComponent(
                        text: 'Riya Patel',
                        style: TextStyle(
                          color: colors.colorBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: Metrics.getFontSize(context, 16),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.all(Metrics.width(context) * 0.015),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            Metrics.height(context) * 0.015,
                          ),
                          color: colors.appbarColor.withOpacity(0.2),
                        ),
                        child: TextComponent(
                          text: 'SUPER-ADMIN',
                          style: TextStyle(
                            color: colors.marronColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: Metrics.height(context) * 0.005),
                      Row(
                        children: [
                          Icon(Icons.email_outlined, color: colors.colorSilver),
                          SizedBox(width: Metrics.width(context) * 0.02),
                          TextComponent(
                            text: 'abc@gmail.com',
                            style: TextStyle(color: colors.colorGrey),
                          ),
                        ],
                      ),
                      SizedBox(height: Metrics.height(context) * 0.005),
                      Row(
                        children: [
                          Icon(Icons.phone_outlined, color: colors.colorSilver),
                          SizedBox(width: Metrics.width(context) * 0.02),
                          TextComponent(
                            text: '1234567890',
                            style: TextStyle(color: colors.colorGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: Metrics.height(context) * 0.02),
              buildChildBtn(
                context: context,
                backgroundColor: colors.marronColor,
                title: 'Edit Profile',
                onTap: () {},
              ),

              SizedBox(height: Metrics.height(context) * 0.01),
            ],
          ),
        ),
        // Half-circle overlay
        Positioned(
          top: -20,
          right: -1,
          child: Container(
            width: Metrics.width(context) * 0.2, // diameter of the half circle
            height: Metrics.width(context) * 0.2,
            decoration: BoxDecoration(
              color: colors.appbarColor.withOpacity(
                0.2,
              ), // color of the half-circle
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildTabItems({
    required IconData icon,
    required String title,
    required String description,
    required Color bgColor,
    required Color mainColor,
    required VoidCallback onTap,
    bool hasSwitch = false,
  }) {
    final colors = Theme.of(context).colors;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.colorWhite,
          borderRadius: BorderRadius.circular(Metrics.width(context) * 0.015),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(Metrics.width(context) * 0.015),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Metrics.width(context) * 0.015,
                ),
                color: bgColor,
              ),
              child: Icon(
                icon,
                color: mainColor,
                size: Metrics.height(context) * 0.03,
              ),
            ),

            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: Metrics.width(context) * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextComponent(
                      text: title,
                      style: TextStyle(
                        color: colors.colorBlack,
                        fontSize: Metrics.getFontSize(context, 16),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextComponent(
                      text: description,
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.9),
                        fontSize: Metrics.getFontSize(context, 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            hasSwitch
                ? CustomSwitch(
                  value: false,
                  onChanged: (value) async {
                    // handleOnBiometricChange(value);
                  },
                )
                : Icon(
                  Icons.arrow_forward_ios,
                  color: colors.marronColor,
                  size: Metrics.height(context) * 0.02,
                ),
          ],
        ),
      ),
    );
  }

  Widget buildAccountSettings() {
    final colors = Theme.of(context).colors;
    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),

      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var studyItem = userSettings[index];
          return buildTabItems(
            icon: studyItem['icon'],
            title: studyItem['title'],
            description: studyItem['description'],
            mainColor: studyItem['mainColor'],
            onTap: () {},
            bgColor: studyItem['bgColor'],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: userSettings.length,
      ),
    );
  }

  Widget buildUserSettings() {
    final colors = Theme.of(context).colors;
    return Container(
      padding: EdgeInsets.all(Metrics.width(context) * 0.02),

      decoration: BoxDecoration(
        color: colors.colorWhite,
        borderRadius: BorderRadius.circular(Metrics.height(context) * 0.015),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          var studyItem = userPreferences[index];
          return buildTabItems(
            icon: studyItem['icon'],
            title: studyItem['title'],
            description: studyItem['description'],
            mainColor: studyItem['mainColor'],
            onTap: () {},
            bgColor: studyItem['bgColor'],
            hasSwitch: studyItem['hasSwitch'],
          );
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: userPreferences.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Settings', hasLeading: false),
      body: Container(
        padding: EdgeInsets.all(Metrics.width(context) * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildStudentCard(),
              SizedBox(height: Metrics.height(context) * 0.015),
              TextComponent(
                text: 'Account Settings',
                style: TextStyle(
                  color: colors.marronColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
              ),
              SizedBox(height: Metrics.height(context) * 0.01),

              buildAccountSettings(),

              SizedBox(height: Metrics.height(context) * 0.015),
              TextComponent(
                text: 'User Settings',
                style: TextStyle(
                  color: colors.marronColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 16),
                ),
              ),
              SizedBox(height: Metrics.height(context) * 0.01),

              buildUserSettings(),
              SizedBox(height: Metrics.height(context) * 0.02),

              Container(
                padding: EdgeInsets.all(Metrics.width(context) * 0.02),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: colors.colorLightGrey.withAlpha(50),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  color: colors.colorWhite,
                  borderRadius: BorderRadius.circular(
                    Metrics.height(context) * 0.015,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout, color: colors.marronColor),
                    SizedBox(width: Metrics.width(context) * 0.02),
                    TextComponent(
                      text: 'LOGOUT',
                      style: TextStyle(
                        color: colors.marronColor,
                        fontWeight: FontWeight.w600,
                        fontSize: Metrics.getFontSize(context, 15),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Metrics.height(context) * 0.02),

              Container(
                alignment: Alignment.center,
                child: TextComponent(
                  text: 'NRITYASETU v1.0.0',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: colors.colorGrey,
                    fontWeight: FontWeight.w600,
                    fontSize: Metrics.getFontSize(context, 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
