import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class PillarsOfIslam extends StatelessWidget {
  const PillarsOfIslam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'اركان الاسلام',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors3,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/1.mp4",
        text: AppImages.PillarsOfIslam,
      ),
    );
  }
}
