import 'package:flutter/cupertino.dart';

class Gap extends StatelessWidget {
  final double? h,w;
  const Gap( {super.key, this.h, this.w});

  @override
  Widget build(BuildContext context) {

    return SizedBox(height: h,width: w,);
  }
}
