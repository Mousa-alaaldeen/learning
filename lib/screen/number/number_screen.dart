// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_audio.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/build_list_tile.dart';
import 'package:learning/models/number_model.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({Key? key}) : super(key: key);

  @override
  State<NumberScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<NumberScreen> {
  final List<NumberModel> numbers = [
    NumberModel(AppOudio.ONE_AR, AppImages.one, '١', 'واحد'),
    NumberModel(AppOudio.TOW_AR, AppImages.tow, '٢', 'اثنان'),
    NumberModel(AppOudio.THREE_AR, AppImages.three, '٣', 'ثلاثة'),
    NumberModel(AppOudio.FOUR_AR, AppImages.four, '٤', 'أربعة'),
    NumberModel(AppOudio.FIVE_AR, AppImages.five, '٥', 'خمسة'),
    NumberModel(AppOudio.SIX_AR, AppImages.six, '٦', 'ستة'),
    NumberModel(AppOudio.SEVEN_AR, AppImages.seven, '٧', 'سبعة'),
    NumberModel(AppOudio.EIGTH_AR, AppImages.eigth, '٨', 'ثمانية'),
    NumberModel(AppOudio.NINE_AR, AppImages.nine, '٩', 'تسعة'),
    NumberModel(AppOudio.TEN_AR, AppImages.ten, '١٠', 'عشرة'),
  ];
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(200, 228, 178, 10),
        centerTitle: true,
        title: Text(' ألارقام العربيه', style: Styles.textStyle25),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          itemCount: numbers.length,
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
                      color: Color.fromRGBO(200, 228, 178, 10),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                    child: BuildListTile(
                      subtitle: numbers[index].subtitle,
                      images: numbers[index].images,
                      title: numbers[index].title,
                      url: () async {
                        if (player.state == PlayerState.playing) {
                          await player.stop();
                        }
                        await player.play(AssetSource(numbers[index].oudio!));
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
