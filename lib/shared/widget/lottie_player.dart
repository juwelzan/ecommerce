import 'package:ecommerce/shared/path/paths.dart';
import 'package:lottie/lottie.dart';

class LottiePlayer extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  final double? w, h;
  const LottiePlayer({super.key, required this.path, this.fit, this.w, this.h});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      path,
      fit: fit,
      width: w,
      height: h,
      errorBuilder: (context, error, stackTrace) {
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
