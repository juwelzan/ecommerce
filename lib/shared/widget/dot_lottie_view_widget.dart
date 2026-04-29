import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class DotLottieViewWidget extends StatelessWidget {
  final String? path;
  final double? size;
  const DotLottieViewWidget({super.key, this.path, this.size});

  @override
  Widget build(BuildContext context) {
    return DotLottieLoader.fromAsset(
      path ?? Asset.phoneNumberLottie,
      frameBuilder: (context, dotLottie) {
        if (dotLottie != null) {
          return SizedBox(
            height: size ?? 300,
            width: size ?? 300,
            child: Lottie.memory(
              dotLottie.animations.values.single,
              fit: .cover,
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
