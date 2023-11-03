import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class PillarsOfFaith extends StatelessWidget {
  const PillarsOfFaith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اركان الايمان',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors5,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/Pillars_of_faith.mp4",
        text: AppImages.PillarsOfFaith,
      ),
    );
  }
}
