import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JumpingButton extends StatefulWidget {
  final double? height, width;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin, padding;
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
    this.padding,
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
              child: child,
            ),
          );
        },

        child: SizedBox(
          width: widget.width ?? MediaQuery.of(context).size.width,
          height: widget.height ?? 65,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            height: widget.isLoding ? 60 : (widget.height ?? 60),
            width: widget.isLoding
                ? 60
                : (widget.width ?? MediaQuery.of(context).size.width),
            margin: widget.margin ?? const .all(7),
            padding: widget.padding ?? const .all(10),
            decoration: BoxDecoration(
              color: widget.color ?? Colors.deepPurple,
              borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
              border: widget.border,
              boxShadow: widget.boxShadow,
              gradient: widget.gradient,
            ),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: widget.isLoding
                  ? Lottie.asset(Asset.lottieLoading, width: 30)
                  : childWidget(
                      child: widget.child,
                      label: widget.label,
                      style: widget.style,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget childWidget({String? label, Widget? child, TextStyle? style}) {
  if (label != null) {
    return Text(
      label,
      textAlign: .center,
      style: style ?? TextStyle(fontSize: 18, fontWeight: .bold),
    );
  } else if (child != null) {
    return child;
  } else if (label != null && child != null) {
    return Text(
      label,
      style: style ?? TextStyle(fontSize: 18, fontWeight: .bold),
    );
  }

  return SizedBox();
}
