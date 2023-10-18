// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
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
    NumberModel(AppImages.one, '١', 'واحد'),
    NumberModel(AppImages.tow, '٢', 'اثنان'),
    NumberModel(AppImages.three, '٣', 'ثلاثة'),
    NumberModel(AppImages.four, '٤', 'أربعة'),
    NumberModel(AppImages.five, '٥', 'خمسة'),
    NumberModel(AppImages.six, '٦', 'ستة'),
    NumberModel(AppImages.seven, '٧', 'سبعة'),
    NumberModel(AppImages.eigth, '٨', 'ثمانية'),
    NumberModel(AppImages.nine, '٩', 'تسعة'),
    NumberModel(AppImages.ten, '١٠', 'عشرة'),
  ];

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
