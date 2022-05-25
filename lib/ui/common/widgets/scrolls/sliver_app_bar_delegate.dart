import 'package:flutter/material.dart';

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final PreferredSize child;

  SliverAppBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //implement build
    return child;
  }

  @override
  //implement maxExtent
  double get maxExtent => child.preferredSize.height;

  @override
  //implement minExtent
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    //implement shouldRebuild
    return false;
  }
}

