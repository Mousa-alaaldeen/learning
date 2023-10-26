// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_audio.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/build_list_tile.dart';
import 'package:learning/models/number_model.dart';

class LetterEnScreen extends StatefulWidget {
  const LetterEnScreen({Key? key}) : super(key: key);

  @override
  State<LetterEnScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<LetterEnScreen> {
  final List<NumberModel> letter = [
    NumberModel(AppOudio.en1, AppImages.en1, 'A', 'Banana'),
    NumberModel(AppOudio.en2, AppImages.en2, 'B', 'Banana'),
    NumberModel(AppOudio.en3, AppImages.en3, 'C', 'Cherry'),
    NumberModel(AppOudio.en4, AppImages.en4, 'D', 'Date'),
    NumberModel(AppOudio.en5, AppImages.en5, 'E', 'Eggplant'),
    NumberModel(AppOudio.en6, AppImages.en6, 'F', 'Fig'),
    NumberModel(AppOudio.en7, AppImages.en7, 'G', 'Grapes'),
    NumberModel(AppOudio.en8, AppImages.en8, 'H', 'Honeydew'),
    NumberModel(AppOudio.en9, AppImages.en9, 'I', 'Ice Cream'),
    NumberModel(AppOudio.en10, AppImages.en10, 'J', 'Jellyfish'),
    NumberModel(AppOudio.en11, AppImages.en11, 'K', 'Kiwi'),
    NumberModel(AppOudio.en12, AppImages.en12, 'L', 'Lemon'),
    NumberModel(AppOudio.en13, AppImages.en13, 'M', 'Mango'),
    NumberModel(AppOudio.en14, AppImages.en14, 'N', 'Nectarine'),
    NumberModel(AppOudio.en15, AppImages.en15, 'O', 'Orange'),
    NumberModel(AppOudio.en16, AppImages.en16, 'P', 'Peach'),
    NumberModel(AppOudio.en17, AppImages.en17, 'Q', 'Quince'),
    NumberModel(AppOudio.en18, AppImages.en18, 'R', 'Raspberry'),
    NumberModel(AppOudio.en19, AppImages.en19, 'S', 'Strawberry'),
    NumberModel(AppOudio.en20, AppImages.en20, 'T', 'Tomato'),
    NumberModel(AppOudio.en21, AppImages.en21, 'U', 'Umbrella'),
    NumberModel(AppOudio.en22, AppImages.en22, 'V', 'Vanilla'),
    NumberModel(AppOudio.en23, AppImages.en23, 'W', 'Watermelon'),
    NumberModel(AppOudio.en24, AppImages.en24, 'X', 'X-ray'),
    NumberModel(AppOudio.en25, AppImages.en25, 'Y', 'Yogurt'),
    NumberModel(AppOudio.en26, AppImages.en26, 'Z', 'Zucchini'),
  ];
  final player = AudioPlayer();

  int selectedAnimalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(194, 222, 220, 10),
        centerTitle: true,
        title: Text(
          'الحروف الانجليزيه',
          style: Styles.textStyle25,
        ),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: letter.length,
            itemBuilder: (BuildContext c, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                delay: const Duration(milliseconds: 100),
                child: SlideAnimation(
                  duration: const Duration(milliseconds: 2500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  horizontalOffset: 30,
                  verticalOffset: 300.0,
                  child: FlipAnimation(
                    duration: const Duration(milliseconds: 3000),
                    curve: Curves.fastLinearToSlowEaseIn,
                    flipAxis: FlipAxis.y,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(194, 222, 220, 10),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      child: BuildListTile(
                        icon: selectedAnimalIndex == index
                            ? Icons.replay
                            : Icons.play_arrow,
                        subtitle: '',
                        //letter[index].subtitle,
                        images: letter[index].images,
                        title: letter[index].title,
                        url: () async {
                          setState(() {
                            selectedAnimalIndex = index;
                          });
                          if (player.state == PlayerState.playing) {
                            await player.stop();
                          }
                          await player.play(AssetSource(letter[index].oudio!));
                        },
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
  
  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
