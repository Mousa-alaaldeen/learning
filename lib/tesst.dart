// ignore_for_file: deprecated_member_use

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';

class MyHomePage extends StatefulWidget {
  final String url;
  final String text;
  const MyHomePage({Key? key, required this.url, required this.text})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;
  late CustomVideoPlayerWebController _customVideoPlayerWebController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.url)
      ..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors5,
          body: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    AppImages.bakeColor,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.asset(
                    AppImages.boy,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height / 5.1,
                        width: MediaQuery.of(context).size.height / 2.9,
                        child: kIsWeb
                            ? Expanded(
                                child: CustomVideoPlayerWeb(
                                  customVideoPlayerWebController:
                                      _customVideoPlayerWebController,
                                ))
                            : CustomVideoPlayer(
                                customVideoPlayerController:
                                    _customVideoPlayerController,
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.text,
                      style:
                          Styles.textStyle25.copyWith(color: Colors.cyan[800]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
