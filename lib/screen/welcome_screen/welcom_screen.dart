import 'package:flutter/material.dart';
import 'package:learning/screen/welcome_screen/img.dart';
import 'package:learning/screen/welcome_screen/my_icon.dart';
import 'package:learning/screen/welcome_screen/text_one.dart';
import 'package:learning/screen/welcome_screen/text_two.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const Img(),
          const TextOne(),
          const TextTwo(),
          MyIcon(width: width),
        ],
      ),
    ));
  }
}
