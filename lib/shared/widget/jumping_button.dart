// ignore_for_file: must_be_immutable

import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JumpingButton extends StatelessWidget {
  final double? height;
  final double? width;
  final TextAlign? textAlign;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin, padding, sidePadding;
  final BoxBorder? border, lodingBorder;
  final List<BoxShadow>? boxShadow;
  final Color? color, lodingBGcolor;
  final Gradient? gradient;
  final String? label;
  final TextStyle? style;
  final Widget? child;
  final VoidCallback? onTap;
  final bool? isLoding, isDisable;
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
    this.textAlign,
    this.sidePadding,
    this.isDisable = false,
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
      builder: (context, isvalue, chil) {
        return GestureDetector(
          onTap: isDisable! ? null : onTaps,
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 1, end: isvalue ? 0.8 : 1),
            duration: Duration(milliseconds: 100),
            builder: (context, value, chil) {
              return Transform.scale(
                scale: value,
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 100),
                  opacity: isvalue ? 0.3 : 1,
                  child: chil,
                ),
              );
            },

            child: LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: sidePadding ?? const EdgeInsets.all(0),
                child: AnimatedContainer(
                  margin: margin,
                  padding: padding,
                  duration: duration ?? Duration(milliseconds: 300),
                  height: height ?? 60,
                  width: isLoding != null
                      ? (isLoding! ? 60 : (width ?? constraints.maxWidth))
                      : (width ?? constraints.minWidth),
                  decoration: BoxDecoration(
                    color: isDisable!
                        ? Colors.grey
                        : (isLoding != null
                              ? (isLoding!
                                    ? lodingBGcolor ?? Colors.transparent
                                    : color ?? Colors.deepPurple)
                              : color ?? Colors.deepPurple),
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
                  child: AnimatedSwitcher(
                    duration: duration ?? Duration(milliseconds: 200),
                    transitionBuilder: (ca, animation) {
                      return FadeTransition(opacity: animation, child: ca);
                    },
                    child: isLoding != null
                        ? (isLoding!
                              ? Center(
                                  key: ValueKey("loading"),
                                  child: Lottie.asset(
                                    Asset.lottieLoading,
                                    width: 30,
                                    height: 30,
                                  ),
                                )
                              : Center(
                                  key: ValueKey("content"),
                                  child: childWidget(
                                    child: child,
                                    label: label,
                                    style: style,
                                    isDisable: isDisable!,
                                  ),
                                ))
                        : Center(
                            key: ValueKey("content"),
                            child: childWidget(
                              child: child,
                              label: label,
                              style: style,
                              isDisable: isDisable!,
                            ),
                          ),
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

Widget childWidget({
  String? label,
  Widget? child,
  TextStyle? style,
  TextAlign? textAlign,
  required bool isDisable,
}) {
  if (child != null) {
    return Center(child: child);
  } else if (label != null || child != null) {
    return Center(
      child: Text(
        label!,
        textAlign: textAlign ?? TextAlign.center,
        style: isDisable
            ? TextStyle(
                fontSize: 18,
                color: Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              )
            : (style ??
                  const TextStyle(
                    fontSize: 18,
                    color: Color(0xffFAFAFA),
                    fontWeight: FontWeight.bold,
                  )),
      ),
    );
  }

  return SizedBox(
    child: Text(
      "data",
      style: isDisable
          ? TextStyle(
              fontSize: 18,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            )
          : (style ??
                const TextStyle(
                  fontSize: 18,
                  color: Color(0xffFAFAFA),
                  fontWeight: FontWeight.bold,
                )),
    ),
  );
}
