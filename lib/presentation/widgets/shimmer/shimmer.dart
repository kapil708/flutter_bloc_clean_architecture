import 'package:flutter/material.dart';

import 'widgets/detail_page_skeleton.dart';
import 'widgets/list_card_skeleton.dart';
import 'widgets/row_card_skeleton.dart';

enum ShimmerType {
  rowCardList,
  listCard,
  detailPage,
}

class Shimmer extends StatefulWidget {
  final dynamic type;

  const Shimmer({super.key, required this.type});

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation = Tween<double>(begin: -1.0, end: 2.0).animate(CurvedAnimation(curve: Curves.easeInOutSine, parent: _controller));

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed || status == AnimationStatus.dismissed) {
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget get animatedWidget {
    switch (widget.type) {
      case ShimmerType.detailPage:
        return DetailPageSkeleton(animation: animation);
      case ShimmerType.rowCardList:
        return RowCardListSkeleton(animation: animation);
      case ShimmerType.listCard:
        return ListCardSkeleton(animation: animation);
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) => animatedWidget,
    );
  }
}
