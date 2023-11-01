import 'package:flutter/material.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class PillarsOfFaith extends StatelessWidget {
  const PillarsOfFaith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VedioScreen(
        url: "assets/video/Pillars_of_faith.mp4", text: 'اركان الايمان',
      ),
    );
  }
}
