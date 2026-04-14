import 'package:flutter/cupertino.dart';

class SliverGap extends StatelessWidget {
  final double? w, h;
  const SliverGap({super.key, this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(width: w, height: h),
    );
  }
}
