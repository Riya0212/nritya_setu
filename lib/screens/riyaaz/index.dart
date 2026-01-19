import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/colors.dart';
import 'package:nritya_setu/constants/utils.dart';

class RiyaazScreen extends StatefulWidget {
  const RiyaazScreen({super.key});

  @override
  State<RiyaazScreen> createState() => _RiyaazScreenState();
}

class _RiyaazScreenState extends State<RiyaazScreen> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colors;
    return Scaffold(
      backgroundColor: colors.marronColor.withOpacity(0.1),
      appBar: buildCustomAppBar(context, 'Riyaaz', hasLeading: false),
    );
  }
}
