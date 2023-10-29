// ignore_for_file: library_private_types_in_public_api, unnecessary_import, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/models/storeis_model.dart';
import 'package:learning/screen/exam/letter/letter_ar/layout_screen.dart';
import 'package:learning/screen/exam/letter/letter_ar/screen_one.dart';
import 'package:learning/screen/exam/letter/letter_ar/screen_three.dart';
import 'package:learning/screen/exam/letter/letter_ar/screen_two.dart';
import 'package:learning/screen/exam/letter/letter_en/screen_two.dart';
import 'package:learning/screen/exam/letter/letter_en/secreen_one.dart';
import 'package:learning/screen/exam/number/number_ar.dart';
import 'package:learning/screen/exam/number/number_en.dart';
import 'package:learning/screen/storeis/storeis_layout.dart';

class ExamLetterEn extends StatefulWidget {
  const ExamLetterEn({Key? key}) : super(key: key);

  @override
  State<ExamLetterEn> createState() => _ExamLetterEnState();
}

class _ExamLetterEnState extends State<ExamLetterEn> {
  double w = 0.0;
  int columnCount = 1;

  // List of exam screens

  final List<Widget> examNumber = [
    const ScreenOneEn(),
    const ScreenTwoEn(),
    const ScreenTwoEn(),
  ];

  // List of StoreisModel data
  final List imageAndText = [
    AppImages.letterEn10,
    AppImages.letterEn20,
    AppImages.letterEn30,
  ];

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: const Text(
          'اختبارات الحروف الانجليزيه',
          style: Styles.textStyle25,
        ),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: _buildGridItems(),
        ),
      ),
    );
  }

  List<Widget> _buildGridItems() {
    return List.generate(examNumber.length, (int index) {
      return AnimationConfiguration.staggeredGrid(
        position: index,
        duration: const Duration(milliseconds: 500),
        columnCount: columnCount,
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 900),
          curve: Curves.ease,
          child: FadeInAnimation(
            child: _buildGridItem(index),
          ),
        ),
      );
    });
  }

  Widget _buildGridItem(int index) {
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
        child: Expanded(
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
                    color:
                        Colors.black.withOpacity(0.3), // لون أسود فاتح مع تعتيم
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
