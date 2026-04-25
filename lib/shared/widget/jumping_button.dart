// ignore_for_file: must_be_immutable

import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JumpingButton extends StatelessWidget {
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin, padding;
  final BoxBorder? border, lodingBorder;
  final List<BoxShadow>? boxShadow;
  final Color? color, lodingBGcolor;
  final Gradient? gradient;
  final String? label;
  final TextStyle? style;
  final Widget? child;
  final VoidCallback? onTap;
  final bool? isLoding;
  final Duration? duration;

  JumpingButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.color,
    this.gradient,
    this.label,
    this.child,
    this.style,
    this.onTap,
    this.margin,
    this.isLoding,
    this.padding,
    this.lodingBGcolor,
    this.lodingBorder,
    this.duration,
  });

  ValueNotifier<bool> isClick = ValueNotifier(false);

  void onTaps() async {
    if (isLoding == null) {
      isClick.value = true;
      await Future.delayed(
        Duration(milliseconds: 100),
        () => isClick.value = false,
      );
    }

    if (onTap != null) onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isClick,
      builder: (context, isvalue, child) {
        return GestureDetector(
          onTap: onTaps,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: isvalue ? 0.8 : 1),
            duration: Duration(milliseconds: 100),
            builder: (context, value, child) {
              return Transform.scale(
                scale: value,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isvalue ? 0.3 : 1,
                  child: child,
                ),
              );
            },

            child: LayoutBuilder(
              builder: (context, constraints) => AnimatedContainer(
                margin: margin,
                padding: padding,
                duration: duration ?? Duration(milliseconds: 300),
                height: height ?? 60,
                width: isLoding != null
                    ? (isLoding! ? 60 : (width ?? constraints.maxWidth))
                    : (width ?? constraints.maxWidth),
                decoration: BoxDecoration(
                  color: isLoding != null
                      ? (isLoding!
                            ? lodingBGcolor ?? Colors.transparent
                            : color ?? Colors.deepPurple)
                      : color ?? Colors.deepPurple,
                  borderRadius: isLoding != null
                      ? (isLoding!
                            ? BorderRadius.circular(100)
                            : borderRadius ?? BorderRadius.circular(20))
                      : borderRadius ?? BorderRadius.circular(20),

                  border: isLoding != null
                      ? (isLoding!
                            ? lodingBorder ??
                                  Border.all(color: Colors.black38, width: 2)
                            : border)
                      : border,
                ),
                child: Center(
                  child: AnimatedCrossFade(
                    firstChild: childWidget(
                      child: child,
                      label: label,
                      style: style,
                    ),
                    secondChild: Lottie.asset(
                      Asset.lottieLoading,
                      width: 30,
                      height: 30,
                    ),
                    crossFadeState: isLoding != null
                        ? (isLoding!
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst)
                        : CrossFadeState.showFirst,
                    duration: duration ?? Duration(milliseconds: 300),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget childWidget({String? label, Widget? child, TextStyle? style}) {
  if (child != null) {
    return child;
  } else if (label != null) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style:
          style ??
          const TextStyle(
            fontSize: 18,
            color: Color(0xffFAFAFA),
            fontWeight: FontWeight.bold,
          ),
    );
  }

  return const SizedBox();
}
