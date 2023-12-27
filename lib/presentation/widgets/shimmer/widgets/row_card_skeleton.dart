import 'package:flutter/material.dart';

import 'box_decoration.dart';

class RowCardListSkeleton extends StatelessWidget {
  final Animation<double> animation;
  const RowCardListSkeleton({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...[1, 2, 3].map(
              (e) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: 200,
                        decoration: ShimmerBoxDecoration(animation),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          height: 16,
                          width: 168,
                          decoration: ShimmerBoxDecoration(animation),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
