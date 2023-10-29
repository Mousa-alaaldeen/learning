// ignore_for_file: avoid_print

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learning/component/app_audio.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/cache_helper.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/models/exam_model.dart';
import 'package:learning/screen/exam/exam_layout.dart';

class ScreenOneAr extends StatefulWidget {
  const ScreenOneAr({Key? key}) : super(key: key);

  @override
  State<ScreenOneAr> createState() => _ScreenOneArState();
}

class _ScreenOneArState extends State<ScreenOneAr> {
  final player = AudioPlayer();
  late List<ExamModel> items, items2;
  int score = 0;

  bool gameOver = true;
  void initGame() {
    gameOver = true;
    score = 0;
    items = [
      ExamModel(AppOudio.ar1, AppImages.rabbit, 'أ'),
      ExamModel(AppOudio.ar2, AppImages.DUCK, 'ب'),
      ExamModel(AppOudio.ar3, AppImages.Crown, 'ت'),
      ExamModel(AppOudio.ar4, AppImages.fox, 'ث'),
      ExamModel(AppOudio.ar5, AppImages.camel, 'ج'),
      ExamModel(AppOudio.ar6, AppImages.b, 'ح'),
      ExamModel(AppOudio.ar7, AppImages.bread, 'خ'),
      ExamModel(AppOudio.ar8, AppImages.rooster, 'د'),
      ExamModel(AppOudio.ar9, AppImages.wolf, 'ذ'),
      ExamModel(AppOudio.ar10, AppImages.man, 'ر'),
    ];
    items2 = List<ExamModel>.from(items)..shuffle();
    items.shuffle();

    if (items.isEmpty) {
      gameOver = true;
    }
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const BuildCircleAvatar(),
              BuildScore(score: score),
              if (gameOver) ...[
                Row(
                  children: [
                    const Spacer(),
                    buildItem1(),
                    const Spacer(flex: 3),
                    buildItem2(),
                  ],
                ),
                if (items.isEmpty) ...[
                  gameOverText(context),
                  againText(context, 'دخول للاختبار مرة أخرى'),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (score == 100 && idAr == 0) {
      idAr++;
      CacheHelper.saveData(key: 'idAr', value: idAr);
      print(idAr);
      print("iiiiiiiiiiiiiiiiiiiddddddddddddd");
    }
    super.dispose();
  }

  Container againText(BuildContext context, String text) => Container(
        height: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextButton(
          child: Text(
            text,
            style: Styles.textStyle20,
          ),
          onPressed: () {
            setState(initGame);
          },
        ),
      );

  Center gameOverText(BuildContext context) => Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'انتها الاختبار',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                score == 100 ? 'رائع' : 'قدم الامتحان مرة أخرى',
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      );

  Column buildItem2() => Column(
        children: items2.map((item) {
          return DragTarget(
            builder: (context, candidateData, rejectedData) => Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Container(
                height: MediaQuery.of(context).size.width / 3,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: item.accepting
                      ? Colors.grey[200]
                      : Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Center(
                  child: Text(
                    item.value,
                    style: Styles.textStyle25,
                  ),
                ),
              ),
            ),
            onAccept: (ExamModel receivedItem) {
              if (item.value == receivedItem.value) {
                setState(() {
                  items.remove(receivedItem);
                  items2.remove(item);
                });
                score += 10;
                player.play(AssetSource(AppOudio.trueExam));
                item.accepting = false;
              } else {
                setState(() {
                  score -= 5;
                  item.accepting = false;
                  player.play(AssetSource(AppOudio.falseExame));
                });
              }
            },
            onWillAccept: (data) {
              setState(() => item.accepting = true);
              return true;
            },
            onLeave: (data) {
              setState(() => item.accepting = false);
            },
          );
        }).toList(),
      );

  Column buildItem1() => Column(
        children: items.map((item) {
          return Container(
            margin: const EdgeInsets.all(8),
            child: Draggable(
              data: item,
              childWhenDragging: Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(item.img), fit: BoxFit.fill),
                ),
              ),
              feedback: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(item.img), fit: BoxFit.fill),
                ),
              ),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(item.img), fit: BoxFit.fill),
                ),
              ),
            ),
          );
        }).toList(),
      );
}

class BuildScore extends StatelessWidget {
  const BuildScore({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text.rich(TextSpan(children: [
        const TextSpan(
          text: 'النتيجه',
          style: Styles.textStyle20,
        ),
        TextSpan(
            text: ' : $score ',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary))
      ])),
    );
  }
}

class BuildCircleAvatar extends StatelessWidget {
  const BuildCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Align(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CircleAvatar(
              radius: 25,
              child: Icon(
                Icons.keyboard_arrow_right_sharp,
              ),
            )),
      ),
    );
  }
}
