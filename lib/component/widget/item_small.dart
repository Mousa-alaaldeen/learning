// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learning/component/styles.dart';

class ItemSmall extends StatelessWidget {
  final Color color;
  final String text;
  final String? text2;
  final String images;
  final void Function()? onTap;
  const ItemSmall({Key? key, 
    
    required this.color,
    required this.text,
    required this.images,
    this.onTap,
    this.text2 = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color,
          ),
          height: 300,
          child: Column(children: [
            Expanded(
              child: Image.asset(
                images,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: Styles.textStyle25,
                  ),
                ),
                Text(
                  text2!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
