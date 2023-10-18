// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/styles.dart';

class BuildListTile extends StatelessWidget {
  final String subtitle;
  final String images;
  final String title;
  const BuildListTile({
    Key? key,
    required this.subtitle,
    required this.images,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AudioPlayer audioPlayer = AudioPlayer();
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Image.asset(
              images,
              width: 200,
              height: 200,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(title, style: Styles.textStyle40),
              ),
              Text(
                subtitle,
                style: Styles.textStyle25,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            icon: Icon(
              Icons.play_arrow,
              size: 40,
            ),
            onPressed: () async {
              await audioPlayer.play(AssetSource('sounds/one.mp3'));
            },
          ),
        ],
      ),
    );
  }
}

Future<void> playSound() async {}
