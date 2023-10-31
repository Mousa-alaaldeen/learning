import 'package:flutter/material.dart';
import 'package:learning/tesst.dart';

class PillarsOfIslam extends StatelessWidget {
  const PillarsOfIslam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(
        url: "assets/video/1.mp4",
        text: 'اركان الاسلام',
      ),
    );
  }
}
