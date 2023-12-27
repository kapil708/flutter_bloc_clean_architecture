import 'package:flutter/material.dart';

import 'box_decoration.dart';

class DetailPageSkeleton extends StatelessWidget {
  final Animation<double> animation;
  const DetailPageSkeleton({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: width * 0.9,
              decoration: ShimmerBoxDecoration(animation),
            ),
            const SizedBox(height: 16),
            Container(
              height: 16,
              width: width * 0.5,
              decoration: ShimmerBoxDecoration(animation),
            ),
            const SizedBox(height: 32),
            Container(
              height: 64,
              width: width * 0.9,
              decoration: ShimmerBoxDecoration(animation),
            ),
            const SizedBox(height: 16),
            Container(
              height: 16,
              width: width * 0.5,
              decoration: ShimmerBoxDecoration(animation),
            ),
            const SizedBox(height: 16),
            Container(
              height: 16,
              width: width * 0.6,
              decoration: ShimmerBoxDecoration(animation),
            ),
            const SizedBox(height: 64),
            Container(
              height: 50,
              width: width * 0.9,
              decoration: ShimmerBoxDecoration(animation),
            ),
          ],
        ),
      ),
    );
  }
}
