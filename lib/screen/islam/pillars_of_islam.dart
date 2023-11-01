import 'package:flutter/material.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class PillarsOfIslam extends StatelessWidget {
  const PillarsOfIslam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VedioScreen(
        url: "assets/video/1.mp4",
        text: 'اركان الاسلام',
      ),
    );
  }
}
