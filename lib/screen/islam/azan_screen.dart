import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';

import 'package:learning/component/widget/vedio_screen.dart';

class AzanScreen extends StatelessWidget {
  const AzanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاذان و دعاء الاذان',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/azan.mp4",
        text: AppImages.azan,
      ),
    );
  }
}
