// ignore_for_file: avoid_print, unnecessary_const

import 'package:flutter/material.dart';

import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/screen/animal_screen.dart/animal_screen.dart';
import 'package:learning/screen/ar_screen/ar_screen.dart';
import 'package:learning/screen/colors/colora_screen.dart';
import 'package:learning/screen/en_screen/en_screen.dart';
import 'package:learning/screen/exam/exam_layout.dart';
import 'package:learning/screen/islam/islam_screen.dart';

class TesstScreen extends StatefulWidget {
  const TesstScreen({Key? key}) : super(key: key);

  @override
  State<TesstScreen> createState() => _TesstScreenState();
}

class _TesstScreenState extends State<TesstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ArScreen(),
                    ),
                  ),
                  color: colors1,
                  text: 'تعلم باللغه العربيه',
                  images: AppImages.LETTER_AR,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnScreen(),
                    ),
                  ),
                  color: colors2,
                  images: AppImages.LETTER_EN,
                  text: 'تعلم باللغة الإنجليزية',
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ItemSmall(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AnimalScreen(),
                ),
              ),
              color: colors5,
              text: 'اصوات الحيوانات',
              images: AppImages.ANIMALS,
              text2: '',
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ColorsScreen(),
                    ),
                  ),
                  color: colors3,
                  text: 'تعلم الالوان',
                  images: AppImages.color,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IslamScreen(),
                    ),
                  ),
                  color: colors4,
                  text: 'تعلم الدين الاسلامي',
                  images: AppImages.muslem,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ItemSmall(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExamLayout(),
                ),
              ),
              color: colors5,
              text: 'الاختبارات',
              images: AppImages.exam,
            ),
          ),
        ],
      ),
    ));
  }
}
