import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JumpingButton extends StatefulWidget {
  final double? height, width, verticalPadding, horizontalPaddinng;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final Gradient? gradient;
  final String? label;
  final TextStyle? style;
  final Widget? child;
  final VoidCallback? onTap;
  final bool isLoding;

  const JumpingButton({
    super.key,
    this.height,
    this.width,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPaddinng,
    this.border,
    this.boxShadow,
    this.color,
    this.gradient,
    this.label,
    this.child,
    this.style,
    this.onTap,
    this.margin,
    this.isLoding = false,
  });

  @override
  State<JumpingButton> createState() => _JumpingButtonState();
}

class _JumpingButtonState extends State<JumpingButton> {
  bool isClick = false;
  void onTap() async {
    setState(() => isClick = true);
    await Future.delayed(
      Duration(milliseconds: 100),
      () => setState(() => isClick = false),
    );

    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !widget.isLoding ? onTap : null,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1, end: isClick ? 0.8 : 1),
        duration: Duration(milliseconds: 100),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: isClick ? 0.3 : 1,
              child: widget.isLoding
                  ? Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Lottie.asset(Asset.lottieLoading, width: 30),
                    )
                  : child,
            ),
          );
        },

        child: Container(
          height: widget.height,
          width: widget.width,
          margin: widget.margin ?? .all(7),
          padding: EdgeInsets.symmetric(
            horizontal: widget.horizontalPaddinng ?? 18,
            vertical: widget.verticalPadding ?? 8,
          ),
          decoration: BoxDecoration(
            color: widget.color ?? Colors.deepPurple,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
            border: widget.border,
            boxShadow: widget.boxShadow,
            gradient: widget.gradient,
          ),
          child: childWidget(
            child: widget.child,
            label: widget.label,
            style: widget.style,
          ),
        ),
      ),
    );
  }
}

Widget childWidget({String? label, Widget? child, TextStyle? style}) {
  if (label != null) {
    return Center(
      child: Text(
        label,
        textAlign: .center,
        style: style ?? TextStyle(fontSize: 18, fontWeight: .bold),
      ),
    );
  } else if (child != null) {
    return Center(child: child);
  } else if (label != null && child != null) {
    return Center(
      child: Text(
        label,
        style: style ?? TextStyle(fontSize: 18, fontWeight: .bold),
      ),
    );
  }

  return SizedBox();
}
