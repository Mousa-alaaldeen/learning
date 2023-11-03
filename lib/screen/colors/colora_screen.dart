import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الالوان',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors3,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/colors.mp4",
        text: AppImages.color,
      ),
    );
  }
}
