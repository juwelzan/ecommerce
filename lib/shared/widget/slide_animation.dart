import 'package:flutter/cupertino.dart';

/// ==============================
/// 🎮 External Controller
/// ==============================
class SlideController {
  AnimationController? _controller;

  void _attach(AnimationController controller) {
    _controller = controller;
  }

  void forward() => _controller?.forward();
  void reverse() => _controller?.reverse();
  void reset() => _controller?.reset();
}

/// ==============================
/// 🎬 Slide Animation Widget
/// ==============================
class SlideAnimation extends StatefulWidget {
  final Duration? duration;
  final Widget child;
  final Offset? offsetBegin, offsetEnd;
  final SlideController? controller;

  const SlideAnimation({
    super.key,
    required this.child,
    this.duration,
    this.offsetBegin,
    this.offsetEnd,
    this.controller,
  });

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration ?? const Duration(milliseconds: 800),
    );

    // attach external controller
    widget.controller?._attach(_controller);

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slide = Tween<Offset>(
      begin: widget.offsetBegin ?? const Offset(0, 0.5),
      end: widget.offsetEnd ?? const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // auto start
    Future.delayed(const Duration(milliseconds: 150), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return FadeTransition(
          opacity: _opacity,
          child: SlideTransition(position: _slide, child: widget.child),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/// ==============================
/// ✨ Extension (Animate_do style)
/// ==============================
extension SlideExtension on Widget {
  /// নিচ থেকে উপরে উঠবে
  Widget slideUp({Duration? duration}) {
    return SlideAnimation(
      duration: duration,
      offsetBegin: const Offset(0, 0.5),
      child: this,
    );
  }

  /// উপর থেকে নিচে নামবে
  Widget slideDown({Duration? duration}) {
    return SlideAnimation(
      duration: duration,
      offsetBegin: const Offset(0, -0.5),
      child: this,
    );
  }

  /// বাম থেকে আসবে
  Widget slideLeft({Duration? duration}) {
    return SlideAnimation(
      duration: duration,
      offsetBegin: const Offset(-0.5, 0),
      child: this,
    );
  }

  /// ডান থেকে আসবে
  Widget slideRight({Duration? duration}) {
    return SlideAnimation(
      duration: duration,
      offsetBegin: const Offset(0.5, 0),
      child: this,
    );
  }
}
