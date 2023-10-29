// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class TesstScreen extends StatefulWidget {
  const TesstScreen({Key? key}) : super(key: key);

  @override
  State<TesstScreen> createState() => _TesstScreenState();
}

class _TesstScreenState extends State<TesstScreen> {
  int x = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          itemCount: 10,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                if (index <= x) print(index);
              },
              child: Container(
                color: Colors.amber,
                padding: const EdgeInsets.all(8),
                width: 200,
                height: 200,
                child: Text('$index'),
              ),
            );
          })),
    );
  }
}
