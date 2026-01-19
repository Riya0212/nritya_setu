import 'package:flutter/material.dart';

import '../../constants/utils.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
            appBar: buildCustomAppBar(context, 'Learning', hasLeading: false),

    );
  }
}