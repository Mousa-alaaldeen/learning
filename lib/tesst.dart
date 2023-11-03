import 'package:flutter/material.dart';
import 'package:learning/component/components.dart';

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a list of items to display in the ListView
    List<String> items = List.generate(50, (index) => 'Item $index');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: colors1,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
