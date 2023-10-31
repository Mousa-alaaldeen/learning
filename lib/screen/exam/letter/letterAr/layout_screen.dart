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
import 'package:learning/screen/exam/letter/letterAr/build_gridl_item.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_one.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_three.dart';
import 'package:learning/screen/exam/letter/letterAr/screen_two.dart';

import 'package:learning/screen/exam/number/number_en.dart';
import 'package:learning/screen/en_screen/storeis/storeis_layout.dart';

class ExamLetterAr extends StatefulWidget {
  const ExamLetterAr({Key? key}) : super(key: key);

  @override
  State<ExamLetterAr> createState() => _ExamLetterArState();
}

class _ExamLetterArState extends State<ExamLetterAr> {
  double w = 0.0;
  int columnCount = 2;
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: const Text(
          'اختبارات الحروف العربيه',
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
          children: buildGridItemsAr(context),
        ),
      ),
    );
  }
}
