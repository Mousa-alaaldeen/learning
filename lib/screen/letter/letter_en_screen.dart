// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:learning/component/styles.dart';
import 'package:learning/component/widget/build_list_tile.dart';
import 'package:learning/models/number_model.dart';

class LetterEnScreen extends StatefulWidget {
  const LetterEnScreen({Key? key}) : super(key: key);

  @override
  State<LetterEnScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<LetterEnScreen> {
 final List<NumberModel> letter = [
    NumberModel('audio/one.mp3','asset/images/number.png', 'B', 'Banana'),
    NumberModel('audio/one.mp3','asset/images/number.png', 'C', 'Cherry'),
    NumberModel('url','asset/images/number.png', 'D', 'Date'),
    NumberModel('url','asset/images/number.png', 'E', 'Eggplant'),
    NumberModel('url','asset/images/number.png', 'F', 'Fig'),
    NumberModel('url','asset/images/number.png', 'G', 'Grapes'),
    NumberModel('url','asset/images/number.png', 'H', 'Honeydew'),
    NumberModel('url','asset/images/number.png', 'I', 'Ice Cream'),
    NumberModel('url','asset/images/number.png', 'J', 'Jellyfish'),
    NumberModel('url','asset/images/number.png', 'K', 'Kiwi'),
    NumberModel('url','asset/images/number.png', 'L', 'Lemon'),
    NumberModel('url','asset/images/number.png', 'M', 'Mango'),
    NumberModel('url','asset/images/number.png', 'N', 'Nectarine'),
    NumberModel('url','asset/images/number.png', 'O', 'Orange'),
    NumberModel('url','asset/images/number.png', 'P', 'Peach'),
    NumberModel('url','asset/images/number.png', 'Q', 'Quince'),
    NumberModel('url','asset/images/number.png', 'R', 'Raspberry'),
    NumberModel('url','asset/images/number.png', 'S', 'Strawberry'),
    NumberModel('url','asset/images/number.png', 'T', 'Tomato'),
    NumberModel('url','asset/images/number.png', 'U', 'Umbrella'),
    NumberModel('url','asset/images/number.png', 'V', 'Vanilla'),
    NumberModel('url','asset/images/number.png', 'W', 'Watermelon'),
    NumberModel('url','asset/images/number.png', 'X', 'X-ray'),
    NumberModel('url','asset/images/number.png', 'Y', 'Yogurt'),
    NumberModel('url','asset/images/number.png', 'Z', 'Zucchini'),
];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(194, 222, 220, 10),
        centerTitle: true,
        title: Text(
          'الحروف الانجليزيه',
          style:Styles.textStyle25,),
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
                        color: Color.fromRGBO(194, 222, 220, 10),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      child: BuildListTile(
                        subtitle: letter[index].subtitle,
                        images: letter[index].images,
                        title: letter[index].title,
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
