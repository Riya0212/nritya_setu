import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nritya_setu/components/index.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/metrics.dart';
import 'package:nritya_setu/constants/utils.dart';
import 'package:nritya_setu/navigation/app_navigation.dart';

class StudyScreen extends StatefulWidget {
  const StudyScreen({super.key});

  @override
  State<StudyScreen> createState() => _StudyScreenState();
}

class _StudyScreenState extends State<StudyScreen> {
  final List<Map<String, dynamic>> studyFolders = [
    {
      "title": "Syllabus",
      "description": "Year-wise syllabus for all levels",
      "icon": Icons.menu_book,
      "mainColor": Colors.deepOrange,
      "bgColor": Colors.deepOrange.shade50,
    },
    {
      "title": "Taals & Beats",
      "description": "All taals, rhythms, and lehra practice materials",
      "icon": Icons.music_note,
      "mainColor": Colors.teal,
      "bgColor": Colors.teal.shade50,
    },
    {
      "title": "Notations",
      "description": "Year-wise dance notations for Kathak and music",
      "icon": Icons.note_alt,
      "mainColor": Colors.purple,
      "bgColor": Colors.purple.shade50,
    },
    {
      "title": "Theory Answers",
      "description": "Detailed theory explanations and answers by year",
      "icon": Icons.menu_book_outlined,
      "mainColor": Colors.indigo,
      "bgColor": Colors.indigo.shade50,
    },
    {
      "title": "Previous Exam Papers",
      "description": "Past exam question papers for reference",
      "icon": Icons.description,
      "mainColor": Colors.blue,
      "bgColor": Colors.blue.shade50,
    },
    {
      "title": "Definitions",
      "description": "Key terms and definitions in Kathak & classical music",
      "icon": Icons.library_books,
      "mainColor": Colors.green,
      "bgColor": Colors.green.shade50,
    },
    {
      "title": "Movements",
      "description": "Hashtaks, neck, face, eyes, head movements",
      "icon": Icons.back_hand,
      "mainColor": Colors.brown,
      "bgColor": Colors.brown.shade50,
    },
  ];

  Widget buildTabItems({
    required IconData icon,
    required String title,
    required String description,
    required Color bgColor,
    required Color mainColor,
    required VoidCallback onTap,
  }) {
    final colors = Theme.of(context).colors;

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Metrics.width(context) * 0.03),
        decoration: BoxDecoration(
          color: colors.colorWhite,
          borderRadius: BorderRadius.circular(Metrics.width(context) * 0.015),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(Metrics.width(context) * 0.02),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  Metrics.width(context) * 0.015,
                ),
                color: bgColor,
              ),
              child: Icon(
                icon,
                color: mainColor,
                size: Metrics.height(context) * 0.033,
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
                        fontSize: Metrics.getFontSize(context, 18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextComponent(
                      text: description,
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.9),
                        fontSize: Metrics.getFontSize(context, 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              color: colors.marronColor,
              size: Metrics.height(context) * 0.025,
            ),
          ],
        ),
      ),
    );
  }

  void handleOnItemSelect(int index) {
    switch (index) {
      case 0:
        context.pushNamed(NAVIGATION.syllabusScreen);
        break;

      default:
        () {};
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      backgroundColor: colors.marronColor.withOpacity(0.1),
      appBar: buildCustomAppBar(context, 'Study', hasLeading: false),
      body: Container(
        padding: EdgeInsets.all(Metrics.width(context) * 0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var studyItem = studyFolders[index];
                  return buildTabItems(
                    icon: studyItem['icon'],
                    title: studyItem['title'],
                    description: studyItem['description'],
                    mainColor: studyItem['mainColor'],
                    onTap: () {
                      handleOnItemSelect(index);
                    },
                    bgColor: studyItem['bgColor'],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: Metrics.height(context) * 0.01);
                },
                itemCount: studyFolders.length,
              ),

              SizedBox(height: Metrics.height(context) * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
