import 'package:ecommerce/core/assets/asset.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class JumpingButton extends StatefulWidget {
  final double? height;
  final double? width, opacity, scale;
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
  final bool? isLoding, isDisable, isFileBoxShow;
  final Duration? duration;

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
    this.isLoding,
    this.padding,
    this.lodingBGcolor,
    this.lodingBorder,
    this.duration,
    this.textAlign,
    this.sidePadding,
    this.isDisable = false,
    this.isFileBoxShow = false,
    this.opacity,
    this.scale,
  });

  @override
  State<JumpingButton> createState() => _JumpingButtonState();
}

class _JumpingButtonState extends State<JumpingButton> {
  late final ValueNotifier<bool> _isClick;

  @override
  void initState() {
    super.initState();
    _isClick = ValueNotifier(false);
  }

  @override
  void dispose() {
    _isClick.dispose();
    super.dispose();
  }

  Future<void> _onTaps() async {
    if (widget.isDisable == true) return;
    if (widget.isLoding == null) {
      _isClick.value = true;
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) _isClick.value = false;
    }
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    final isDisable = widget.isDisable ?? false;
    final isLoding = widget.isLoding;

    return LayoutBuilder(
      builder: (context, constraints) {
        return ValueListenableBuilder<bool>(
          valueListenable: _isClick,
          builder: (context, isvalue, chil) {
            return GestureDetector(
              onTap: isDisable ? null : _onTaps,
              child: TweenAnimationBuilder<double>(
                tween: Tween(
                  begin: 1,
                  end: isvalue ? widget.scale?.clamp(0, 1) ?? 0.9 : 1,
                ),
                duration: const Duration(milliseconds: 100),
                builder: (context, value, chil) {
                  return Transform.scale(
                    scale: value,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: isvalue ? widget.opacity?.clamp(0, 1) ?? 0.3 : 1,
                      child: Padding(
                        padding: widget.sidePadding ?? EdgeInsets.zero,
                        child: AnimatedContainer(
                          margin: widget.margin,
                          padding: widget.padding,
                          duration:
                              widget.duration ??
                              const Duration(milliseconds: 300),
                          height: widget.height ?? 60,
                          width: isLoding != null
                              ? (isLoding
                                    ? 60
                                    : (widget.width ?? constraints.maxWidth))
                              : (widget.width ?? constraints.minWidth),
                          decoration: BoxDecoration(
                            color: isDisable
                                ? Colors.grey
                                : (isLoding != null
                                      ? (isLoding
                                            ? widget.lodingBGcolor ??
                                                  Colors.transparent
                                            : widget.color ?? Colors.deepPurple)
                                      : widget.color ?? Colors.deepPurple),
                            borderRadius: isLoding != null
                                ? (isLoding
                                      ? BorderRadius.circular(100)
                                      : widget.borderRadius ??
                                            BorderRadius.circular(20))
                                : widget.borderRadius ??
                                      BorderRadius.circular(20),
                            border: isLoding != null
                                ? (isLoding
                                      ? widget.lodingBorder ??
                                            Border.all(
                                              color: Colors.black38,
                                              width: 2,
                                            )
                                      : widget.border)
                                : widget.border,
                          ),
                          child: AnimatedSwitcher(
                            duration:
                                widget.duration ??
                                const Duration(milliseconds: 200),
                            transitionBuilder: (ca, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: ca,
                              );
                            },
                            child: isLoding == true
                                ? Center(
                                    key: const ValueKey('loading'),
                                    child: Lottie.asset(
                                      Asset.lottieLoading,
                                      width: 30,
                                      height: 30,
                                    ),
                                  )
                                : Center(
                                    key: const ValueKey('content'),
                                    child: _JumpingButtonChild(
                                      label: widget.label,
                                      style: widget.style,
                                      textAlign: widget.textAlign,
                                      isDisable: isDisable,
                                      child: widget.child,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _JumpingButtonChild extends StatelessWidget {
  const _JumpingButtonChild({
    this.label,
    this.child,
    this.style,
    this.textAlign,
    required this.isDisable,
  });

  final String? label;
  final Widget? child;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool isDisable;

  @override
  Widget build(BuildContext context) {
    if (child != null) return child!;
    if (label == null) return const SizedBox.shrink();
    return Text(
      label!,
      textAlign: textAlign ?? TextAlign.center,
      style: isDisable
          ? TextStyle(
              fontSize: 15,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.bold,
            )
          : (style ??
                const TextStyle(
                  fontSize: 15,
                  color: Color(0xffFAFAFA),
                  fontWeight: FontWeight.bold,
                )),
    );
  }
}
