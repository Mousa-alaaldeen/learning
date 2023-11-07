import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class TashahhudScreen extends StatelessWidget {
  const TashahhudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "التشهد و الصلاة الابراهميه",
          style: Styles.textStyle25,
        ),
        backgroundColor: colors1,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/at_tashahhud.mp4",
        text: AppImages.tashahhud,
      ),
    );
  }
}
