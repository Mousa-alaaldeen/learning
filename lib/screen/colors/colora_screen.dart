import 'package:flutter/material.dart';
import 'package:learning/tesst.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(
        url: "assets/video/colors.mp4",
        text: 'الالوان',
      ),
    );
  }
}
