// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/screen/exam/exam_layout.dart';
import 'package:learning/screen/home/cover_image.dart';
import 'package:learning/screen/en_screen/storeis/storeis_layout.dart';
import 'package:learning/screen/animal_screen.dart/animal_screen.dart';
import 'package:learning/screen/ar_screen/black_board.dart';
import 'package:learning/screen/en_screen/letter_en_screen.dart';
import 'package:learning/screen/ar_screen/letter_screen.dart';
import 'package:learning/screen/en_screen/number_en_screen.dart';
import 'package:learning/screen/ar_screen/number_screen.dart';
import 'package:learning/screen/islam/pillars_of_islam.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            CoverImage(),
            const Center(
              child: Text(
                ' مرحبًا  !',
                style: Styles.textStyle18,
              ),
            ),
            Center(
              child: Text(
                'جاهزون للتعلم؟',
                style: Styles.textStyle25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumberScreen(),
                    ),
                  ),
                  color: Color.fromRGBO(200, 228, 178, 10),
                  text: "الارقام العربيه",
                  images: AppImages.NUMBER_AR,
                ),
                SizedBox(
                  width: 5,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LetterScreen(),
                    ),
                  ),
                  color: Color.fromRGBO(255, 217, 183, 10),
                  images: AppImages.LETTER_AR,
                  text: ' الحروف العربيه',
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ItemSmall(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AnimalScreen(),
                ),
              ),
              color: Color.fromRGBO(158, 210, 190, 10),
              text: 'أصوات الحيوانات',
              images: AppImages.ANIMALS,
              text2: '',
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NumberEnScreen(),
                    ),
                  ),
                  color: Color.fromRGBO(126, 170, 146, 10),
                  text: 'الأرقام الانجليزيه',
                  images: AppImages.NUMBER_EN,
                ),
                SizedBox(
                  width: 5,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LetterEnScreen(),
                    ),
                  ),
                  color: Color.fromRGBO(194, 222, 220, 10),
                  text: 'الحروف الانجليزيه',
                  images: AppImages.LETTER_EN,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            ItemSmall(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PillarsOfIslam(),
                ),
              ),
              color: Color.fromRGBO(126, 170, 146, 10),
              text: 'اركان الاسلام',
              images: AppImages.muslem,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DrawingScreen(),
                    ),
                  ),
                  color: Theme.of(context).colorScheme.inversePrimary,
                  text: 'كتابة الحروف العربيه',
                  images: AppImages.education,
                ),
                SizedBox(
                  width: 5,
                ),
                ItemSmall(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StoreisScreen(),
                    ),
                  ),
                  color: Color.fromRGBO(194, 222, 220, 10),
                  text: 'قصص باللغه الانجليزيه',
                  images: AppImages.stories,
                ),
              ],
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(
            //     vertical: 10,
            //   ),
            //   height: 1,
            //   width: double.infinity,
            //   color: Colors.grey,
            // ),
            SizedBox(
              height: 10,
            ),
            ItemSmall(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExamLayout(),
                ),
              ),
              color: Color.fromRGBO(255, 217, 183, 10),
              text: 'الاختبارات',
              images: AppImages.exam,
            ),
          ],
        ),
      ),
    );
  }
}
