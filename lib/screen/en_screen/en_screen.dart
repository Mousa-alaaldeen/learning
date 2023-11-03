import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/screen/en_screen/letter_en_screen.dart';
import 'package:learning/screen/en_screen/number_en_screen.dart';
import 'package:learning/screen/en_screen/storeis/storeis_layout.dart';
import 'package:learning/screen/en_screen/week_days.dart';

class EnScreen extends StatefulWidget {
  const EnScreen({Key? key}) : super(key: key);

  @override
  State<EnScreen> createState() => _EnScreenState();
}

class _EnScreenState extends State<EnScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'تعلم باللغه الإنجليزيه',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors2,
      ),
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
                        builder: (context) => const NumberEnScreen(),
                      ),
                    ),
                    color: colors4,
                    text: 'الأرقام الإنجليزيه',
                    images: AppImages.NUMBER_EN,
                  ),
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LetterEnScreen(),
                      ),
                    ),
                    color: colors1,
                    text: 'الحروف الإنجليزيه',
                    images: AppImages.LETTER_EN,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const StoreisScreen(),
                      ),
                    ),
                    color: colors5,
                    text: 'قصص باللغه الإنجليزيه',
                    images: AppImages.stories,
                  ),
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WeekDaysScreen(),
                      ),
                    ),
                    color: colors3,
                    text: 'ايام الاسبوع',
                    images: AppImages.WeekDays,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
