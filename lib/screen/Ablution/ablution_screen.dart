// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AblutionScreen extends StatefulWidget {
  const AblutionScreen({Key? key}) : super(key: key);

  @override
  State<AblutionScreen> createState() => _AblutionScreenState();
}

class _AblutionScreenState extends State<AblutionScreen> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.asset('asset/video/Ablution.mp4')
      ..initialize().then((value) {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Container(
        child: VideoPlayer(
            VideoPlayerController.asset('asset/video/Ablution.mp4')),
      )),
    ));
  }
}
