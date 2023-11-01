import 'package:flutter/material.dart';
import 'package:learning/component/app_images.dart';
import 'package:learning/component/components.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_one.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_three.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_two.dart';
import 'package:progress_bar_steppers/steppers.dart';

class ExamLetterAr extends StatefulWidget {
  const ExamLetterAr({Key? key}) : super(key: key);

  @override
  State<ExamLetterAr> createState() => _ExamLetterArState();
}

class _ExamLetterArState extends State<ExamLetterAr> {
  var id = idAr;
  var currentStep = idAr + 1;
  var totalSteps = 0;

  late List<StepperData> stepsData;

  @override
  void initState() {
    super.initState();

    stepsData = [
      StepperData(
        label: 'الاختبار 1',
        description: '',
        //  "اختبار الحروف من أ-ز",
        child: id >= 0
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterAr10,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenOneAr(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterAr10,
                height: 200,
              ),
      ),
      StepperData(
        label: 'الاختبار 2',
        description: '',
        child: id >= 1
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterAr20,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenTwoAr(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterAr20,
                height: 200,
              ),
      ),
      StepperData(
        label: 'الاختبار 3',
        description: '',
        child: id >= 2
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterAr30,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenThreeAr(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterAr30,
                height: 200,
              ),
      ),
    ];
    totalSteps = stepsData.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('اختبارات الحروف العربيه', style: Styles.textStyle25),
        centerTitle: true,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Steppers(
                direction: StepperDirection.horizontal,
                labels: stepsData,
                currentStep: currentStep,
                stepBarStyle: StepperStyle(
                  maxLineLabel: 1,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  'الاختبارات',
                  style: Styles.textStyle25,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            SliverToBoxAdapter(
              child: Steppers(
                direction: StepperDirection.vertical,
                labels: stepsData,
                currentStep: currentStep,
                stepBarStyle: StepperStyle(
                  maxLineLabel: 2,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
