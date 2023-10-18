// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/build_list_tile.dart';
import 'package:learning/models/number_model.dart';

class LetterScreen extends StatefulWidget {
  const LetterScreen({Key? key}) : super(key: key);

  @override
  State<LetterScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<LetterScreen> {
  final List<NumberModel> letter = [
    NumberModel(AppImages.LION, 'أ', 'أسد'),
    NumberModel(AppImages.DUCK, 'ب', 'بطة'),
    NumberModel(AppImages.crocodile, 'ت', 'تمساح'),
    NumberModel(AppImages.fox, 'ث', 'ثعلب'),
    NumberModel(AppImages.camel, 'ج', 'جمل'),
    NumberModel(AppImages.whale, 'ح', 'حوت'),
    NumberModel(AppImages.sheep, 'خ', 'خروف'),
    NumberModel(AppImages.rooster, 'د', "ديك"),
    NumberModel(AppImages.GOLD, 'ذ', 'ذهب'),
    NumberModel(AppImages.pomegranate, 'ر', "رمان"),
    NumberModel(AppImages.flower, 'ز', 'زرافة'),
    NumberModel(AppImages.Fish, 'س', 'سمكة'),
    NumberModel(AppImages.tree, 'ش', 'شمس'),
    NumberModel(AppImages.hawk, 'ص', 'صقر'),
    NumberModel(AppImages.frog, 'ض', 'ضفدع'),
    NumberModel(AppImages.child, 'ط', 'طاووس'),
    NumberModel(AppImages.nail, 'ظ', 'ظبي'),
    NumberModel(AppImages.EYE, 'ع', 'عقرب'),
    NumberModel(AppImages.forest, 'غ', 'غزال'),
    NumberModel(AppImages.elephant, 'ف', 'فيل'),
    NumberModel(AppImages.moon, 'ق', 'قرد'),
    NumberModel(AppImages.book, 'ك', 'كلب'),
    NumberModel(AppImages.Lemon, 'ل', 'ليمور'),
    NumberModel(AppImages.Mosque, 'م', 'ماعز'),
    NumberModel(AppImages.star, 'ن', 'نمر'),
    NumberModel(AppImages.Hoopoe, 'ه', 'هدهد'),
    NumberModel(AppImages.flower1, 'و', 'وحيد القرن'),
    NumberModel(AppImages.hand, 'ي', 'يعسوب'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 217, 183, 10),
        centerTitle: true,
        title: Text('الحروف العربيه', style: Styles.textStyle25),
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
                      color: Color.fromRGBO(255, 217, 183, 10),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                    child: BuildListTile(
                      subtitle: '', //letter[index].subtitle,
                      images: letter[index].images,
                      title: '', //letter[index].title,
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
