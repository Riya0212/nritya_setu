import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/index.dart';

import '../../../components/index.dart';

class SyllabusScreen extends StatefulWidget {
  const SyllabusScreen({super.key});

  @override
  State<SyllabusScreen> createState() => _SyllabusScreenState();
}

class _SyllabusScreenState extends State<SyllabusScreen> {
  String? selectedUniversity;

  Widget buildSyllabusItems({
    required String title,
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
                color: colors.appbarColor.withOpacity(0.4),
              ),
              child: Icon(
                Icons.menu_book,
                color: colors.marronColor,
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
                        fontSize: Metrics.getFontSize(context, 16),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Icon(
              Icons.arrow_forward_ios,
              color: colors.marronColor,
              size: Metrics.height(context) * 0.022,
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      backgroundColor: colors.colorWhite,
      appBar: buildCustomAppBar(context, 'Syllabus'),
      body: Container(
        color: Color.fromRGBO(94, 22, 33, 0.1),
        child: Padding(
          padding: EdgeInsets.all(Metrics.width(context) * 0.03),
          child: Column(
            children: [
              GenericDropdown<String>(
                title: 'University :',
                titleTextStyle: TextStyle(
                  color: colors.colorBlack,
                  fontWeight: FontWeight.w600,
                  fontSize: Metrics.getFontSize(context, 15),
                ),
                items: ['AKHIL', 'BRUHAD'],
                selectedItem: selectedUniversity,
                hintText: 'Select university',
                onChanged: (value) {
                  setState(() {
                    if (value != null) {
                      selectedUniversity = value;
                    }
                  });
                },
                itemToString: (value) {
                  return value.toString();
                },
              ),
              SizedBox(height: Metrics.height(context) * 0.02),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return buildSyllabusItems(
                    title: 'Prarambhik (Year ${index+1})',

                    onTap: () {},
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: Metrics.height(context) * 0.015);
                },
                itemCount: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
