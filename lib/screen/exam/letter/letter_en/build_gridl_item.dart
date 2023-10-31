import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/screen/exam/letter/letter_en/screen_three.dart';
import 'package:learning/screen/exam/letter/letter_en/screen_two.dart';
import 'package:learning/screen/exam/letter/letter_en/secreen_one.dart';

final List<Widget> examNumber = [
  const ScreenOneEn(),
  const ScreenTwoEn(),
  const ScreenThreeEn(),
];

// List of StoreisModel data
final List imageAndText = [
  AppImages.letterEn10,
  AppImages.letterEn20,
  AppImages.letterEn30,
];

List<Widget> buildGridItemsEn(context) {
  return List.generate(examNumber.length, (int index) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 500),
      columnCount: 2,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
        child: FadeInAnimation(
          child: buildGridItemEn(index, context),
        ),
      ),
    );
  });
}

Widget buildGridItemEn(int index, context) {
  double w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {
      if (index <= idEn) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => examNumber[index],
          ),
        );
      } else {
        // عند عدم توافق الشرط (index > idEn)
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("خطأ"),
              content: const Text("يجب عليك النجاح في الامتحان السابق أولاً."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("موافق"),
                ),
              ],
            );
          },
        );
      }
    },
    child: Container(
      margin: EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
      height: 300,
      child: Stack(
        children: [
          Image.asset(
            imageAndText[index],
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fill,
          ),
          if (index > idEn)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
        ],
      ),
    ),
  );
}
