import 'package:flutter/material.dart';
import 'package:learning/tesst.dart';

class PillarsOfFaith extends StatelessWidget {
  const PillarsOfFaith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(
        url: "assets/video/Pillars_of_faith.mp4", text: 'اركان الايمان',
      ),
    );
  }
}
