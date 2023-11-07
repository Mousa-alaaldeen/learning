import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/item_small.dart';
import 'package:learning/screen/islam/ablution_screen.dart';
import 'package:learning/screen/islam/azan_screen.dart';

import 'package:learning/screen/islam/pillars_of_faith.dart';
import 'package:learning/screen/islam/pillars_of_islam.dart';
import 'package:learning/screen/islam/tashahhud_screen.dart';

class IslamScreen extends StatefulWidget {
  const IslamScreen({Key? key}) : super(key: key);

  @override
  State<IslamScreen> createState() => _IslamScreenState();
}

class _IslamScreenState extends State<IslamScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "تعلم الدين الاسلامي",
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
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
                        builder: (context) => const PillarsOfIslam(),
                      ),
                    ),
                    color: colors3,
                    text: 'الاركان الاسلام',
                    images: AppImages.PillarsOfIslam,
                  ),
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PillarsOfFaith(),
                      ),
                    ),
                    color: colors5,
                    images: AppImages.PillarsOfFaith,
                    text: 'اركان الايمان',
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: ItemSmall(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AzanScreen(),
                  ),
                ),
                color: colors4,
                text: 'الاذان و دعاء الاذان',
                images: AppImages.azan,
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AblutionScreen(),
                      ),
                    ),
                    color: colors2,
                    text: "تعلم الوضوء",
                    images: AppImages.Ablution,
                  ),
                  ItemSmall(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TashahhudScreen(),
                      ),
                    ),
                    color: colors1,
                    text: "التشهد و الصلاة الابراهميه",
                    images: AppImages.tashahhud,
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
