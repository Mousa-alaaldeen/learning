
   import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_one.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_three.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_two.dart';

final List<Widget> examNumberAr = [
    const ScreenOneAr(),
    const ScreenTwoAr(),
    const ScreenThreeAr(),
  ];

  // List of StoreisModel data
  final List imageAndTextAr = [
    AppImages.letterAr10,
    AppImages.letterAr20,
    AppImages.letterAr30,
  ];
  Widget buildGridItemAr(int index,context) {
      double w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        if (index <= idAr) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => examNumberAr[index],
            ),
          );
        } else {
          // عند عدم توافق الشرط (index > idAr)
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("خطأ"),
                content:
                    const Text("يجب عليك النجاح في الامتحان السابق أولاً."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // لإغلاق الـ Dialog
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
              imageAndTextAr[index],
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            if (index > idAr)
              Container(
                decoration: BoxDecoration(
                  color:
                      Colors.black.withOpacity(0.3), // لون أسود فاتح مع تعتيم
                ),
              ),
          ],
        ),
      ),
    );
  }


  List<Widget> buildGridItemsAr(context) {
    return List.generate(examNumberAr.length, (int index) {
      return AnimationConfiguration.staggeredGrid(
        position: index,
        duration: const Duration(milliseconds: 500),
        columnCount:2,
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 900),
          curve: Curves.ease,
          child: FadeInAnimation(
            child: buildGridItemAr(index, context),
          ),
        ),
      );
    });
  }
