import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/cupertino.dart';

class PngLogo extends StatelessWidget {
  final double? height, width;
  const PngLogo({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(Asset.logoPNG, height: height, width: width);
  }
}
