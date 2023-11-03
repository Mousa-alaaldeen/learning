import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/app_audio.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';

class WeekDaysScreen extends StatefulWidget {
  const WeekDaysScreen({Key? key}) : super(key: key);

  @override
  State<WeekDaysScreen> createState() => _WeekDaysScreenState();
}

class _WeekDaysScreenState extends State<WeekDaysScreen> {
  final player = AudioPlayer();
  bool isPlayer = false;
  // @override
  // void initState() {
  //   super.initState;
  //   playWelcomeSound();
  // }

  void playWelcomeSound() async {
    await player.play(AssetSource(AppOudio.weekDays));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors3,
        centerTitle: true,
        title: const Text(
          'ايام الاسبوع',
          style: Styles.textStyle25,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              AppImages.WeekDays,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  if (player.state == PlayerState.playing) {
                    await player.stop();
                  } else {
                    await player.play(AssetSource(AppOudio.weekDays));
                  }
                  setState(() {
                    isPlayer = player.state == PlayerState.playing;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: colors3,
                  radius: 40,
                  child: isPlayer
                      ? const Icon(Icons.pause)
                      : const Icon(
                          Icons.play_arrow,
                        ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void deactivate() {
    player.stop();
    super.deactivate();
  }
}
