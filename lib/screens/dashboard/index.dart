import 'package:flutter/material.dart';
import 'package:nritya_setu/constants/utils.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildCustomAppBar(context, 'Add Student Details'));
  }
}
