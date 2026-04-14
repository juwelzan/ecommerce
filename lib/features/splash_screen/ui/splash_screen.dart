// ignore_for_file: use_build_context_synchronously

import 'package:ecommerce/core/themes/app_colors.dart';
import 'package:ecommerce/features/splash_screen/provider/splash_provider.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/png_logo.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = "/splash";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.microtask(() {
      context.read<SplashProvider>().startSpash();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<SplashProvider>(
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: PngLogo(width: 130.hw(max: 130, min: 110)),
                ),
              ),
              Positioned(
                bottom: 30.h,
                left: 10.w,
                right: 10.w,

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      Asset.lottieLoder,
                      width: 70.hw(),
                      height: 70.hw(),
                      delegates: LottieDelegates(
                        values: [
                          ValueDelegate.color(const [
                            "**",
                          ], value: AppColors.darkPrimary),
                        ],
                      ),
                    ),
                    Text(
                      "version 1.0",
                      style: TextStyle(
                        fontSize: 13.hw(min: 13, max: 13),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
