import 'package:flutter/cupertino.dart';

class SlideAnimation extends StatefulWidget {
  final SlideController? controller;
  final Widget child;

  const SlideAnimation({super.key, this.controller, required this.child});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slide;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.controller?.duration ?? Duration(milliseconds: 1000),
      reverseDuration: widget.controller?.reversDuration,
    );
    _slide =
        Tween<Offset>(
          begin: widget.controller?.offsetBegin ?? Offset(0, 5),
          end: widget.controller?.offsetEnd ?? Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.fastEaseInToSlowEaseOut,
          ),
        );

    _opacity = Tween<double>(
      begin: widget.controller?.opacity?.begin ?? 0,
      end: widget.controller?.opacity?.end ?? 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    widget.controller?.attach(_controller);
    Future.delayed(Duration(milliseconds: 200), () => _controller.forward());
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

class SlideController {
  AnimationController? controller;
  void attach(AnimationController anicontroller) {
    controller = anicontroller;
  }

  SlideController({
    this.duration,
    this.reversDuration,
    this.offsetBegin,
    this.offsetEnd,
    this.opacity,
  });
  final Duration? duration, reversDuration;
  final Offset? offsetBegin, offsetEnd;
  final Opacitys? opacity;

  void forward() => controller?.forward();
  void reverse() => controller?.reverse();
}

extension SlideExtension on Widget {
  Widget slideMotion({SlideController? controller}) {
    return SlideAnimation(controller: controller, child: this);
  }
}

class Opacitys {
  final double begin, end;
  Opacitys({required this.begin, required this.end});
}
