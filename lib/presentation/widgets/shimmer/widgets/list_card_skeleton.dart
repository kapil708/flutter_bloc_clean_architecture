import 'package:flutter/material.dart';

import 'box_decoration.dart';

class ListCardSkeleton extends StatelessWidget {
  final Animation<double> animation;
  const ListCardSkeleton({super.key, required this.animation});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: width - 32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 8,
                width: width * 0.3,
                decoration: ShimmerBoxDecoration(animation),
              ),
              const SizedBox(height: 16),
              Container(
                height: 8,
                width: width * 0.4,
                decoration: ShimmerBoxDecoration(animation),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 8,
                    width: width * 0.3,
                    decoration: ShimmerBoxDecoration(animation),
                  ),
                  Container(
                    height: 8,
                    width: width * 0.3,
                    decoration: ShimmerBoxDecoration(animation),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
