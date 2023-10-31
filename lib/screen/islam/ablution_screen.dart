import 'package:flutter/material.dart';
import 'package:learning/tesst.dart';

class AblutionScreen extends StatelessWidget {
  const AblutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyHomePage(
        url: "assets/video/Ablution.mp4", text: 'تعلم الوضوء',
      ),
    );
  }
}
