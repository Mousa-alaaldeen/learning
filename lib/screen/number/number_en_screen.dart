// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/build_list_tile.dart';
import 'package:learning/models/number_model.dart';

class NumberEnScreen extends StatefulWidget {
  const NumberEnScreen({Key? key}) : super(key: key);

  @override
  State<NumberEnScreen> createState() => _NumberEnScreenState();
}

class _NumberEnScreenState extends State<NumberEnScreen> {
  final List<NumberModel> numbers = [
    NumberModel('', AppImages.one, '1', 'one'),
    NumberModel('', AppImages.tow, '2', 'two'),
    NumberModel('', AppImages.three, '3', 'three'),
    NumberModel('', AppImages.four, '4', 'four'),
    NumberModel('', AppImages.five, '5', 'five'),
    NumberModel('', AppImages.six, '6', 'six'),
    NumberModel('', AppImages.seven, '7', 'seven'),
    NumberModel('', AppImages.eigth, '8', 'eight'),
    NumberModel('', AppImages.nine, '9', 'nine'),
    NumberModel('', AppImages.ten, '10', 'ten'),
  ];

  int selectedAnimalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(200, 228, 178, 10),
        centerTitle: true,
        title: Text('الأرقام الانجليزيه', style: Styles.textStyle25),
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
                      icon: selectedAnimalIndex == index
                          ? Icons.replay
                          : Icons.play_arrow,
                      subtitle: numbers[index].subtitle,
                      images: numbers[index].images,
                      title: numbers[index].title,
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
}
