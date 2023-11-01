import 'package:flutter/material.dart';
import 'package:learning/component/widget/vedio_screen.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: VedioScreen(
        url: "assets/video/colors.mp4",
        text: 'الالوان',
      ),
    );
  }
}
