// ignore_for_file: library_private_types_in_public_api, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/models/storeis_model.dart';
import 'package:learning/screen/exam/number/number_ar.dart';
import 'package:learning/screen/exam/number/number_en.dart';

class ExamLayout extends StatefulWidget {
  const ExamLayout({Key? key}) : super(key: key);

  @override
  State<ExamLayout> createState() => _ExamLayoutState();
}

class _ExamLayoutState extends State<ExamLayout> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    int columnCount = 2;
    List<Widget> examNumber = [
      const ExamNumberAr(),
      const ExamNumberEn(),
    ];
    List<StoreisModel> imageAndText = [
      StoreisModel(
          image: AppImages.NUMBER_AR, text: " الارقام العربيه من 1-10"),
      StoreisModel(
          image: AppImages.NUMBER_EN, text: " الارقام الانجليزيه من 1-10"),
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(255, 217, 183, 10),
          title: const Text(
            ' اختبارات',
            style: Styles.textStyle25,
          ),
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            examNumber.length,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                duration: const Duration(milliseconds: 500),
                columnCount: columnCount,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 900),
                  curve: Curves.fastLinearToSlowEaseIn,
                  child: FadeInAnimation(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => examNumber[index]),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: w / 30, left: w / 60, right: w / 60),
                        child: ItemSmall(
                            text: imageAndText[index].text,
                            images: imageAndText[index].image),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
