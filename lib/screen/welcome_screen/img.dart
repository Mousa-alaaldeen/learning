
import 'package:flutter/material.dart';
import 'package:learning/screen/home/cover_image.dart';

class Img extends StatelessWidget {
  const Img({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Center(
        child: CoverImage(),
      ),
    );
  }
}
