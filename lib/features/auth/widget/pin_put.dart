import 'dart:async';

import 'package:ecommerce/shared/path/paths.dart';

class OtpPinPut extends StatefulWidget {
  final int length;
  final Function(String value) onChanged;
  final Function(bool value) isDisable;
  final VoidCallback? onReset;
  final bool? isError, isShowReset;
  final double? boxSize;
  final TextStyle? textStyle;

  const OtpPinPut({
    super.key,
    required this.length,
    required this.onChanged,
    this.isError = false,
    required this.isDisable,
    this.isShowReset = false,
    this.boxSize,
    this.textStyle,
    this.onReset,
  });

  @override
  State<OtpPinPut> createState() => _OtpPinPutState();
}

class _OtpPinPutState extends State<OtpPinPut> {
  ValueNotifier<int> timeValu = ValueNotifier(30);
  ValueNotifier<bool> isTimerOn = ValueNotifier(false);

  Timer? _timer;
  late List<TextEditingController> controller;
  late List<FocusNode> focusNode;
  @override
  void initState() {
    setController();
    // clipeBoard();
    super.initState();
  }

  @override
  void dispose() {
    for (var f in focusNode) {
      f.dispose();
    }
    for (var c in controller) {
      c.dispose();
    }
    _timer?.cancel();
    timeValu.dispose();
    isTimerOn.dispose();
    super.dispose();
  }

  // Future<void> clipeBoard() async {
  //   final data = await Clipboard.getData('text/plain');
  //   if (data != null && data.text != null) {
  //     final text = data.text!.trim();
  //     if (text.length == widget.length && int.tryParse(text) != null) {
  //       handlePaste(text, 0);
  //     }
  //   }
  // }

  // void handlePaste(String value, int index) {
  //   if (value.length > 1) {
  //     for (int i = 0; i < widget.length; i++) {
  //       if (i < value.length) {
  //         controller[i].text = value[i];
  //       } else {
  //         controller[i].clear();
  //       }
  //     }
  //     focusNode[widget.length - 1].unfocus();
  //     setState(() {});
  //   }
  // }

  void setController() {
    controller = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    focusNode = List.generate(widget.length, (index) => FocusNode());
  }

  void onChanged({required String value, required int index}) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        focusNode[index + 1].requestFocus();
      } else {
        focusNode[index].unfocus();
      }
    } else {
      if (index > 0) {
        focusNode[index - 1].requestFocus();
      }
    }

    widget.onChanged(controller.map((t) => t.text).join());
  }

  void time() async {
    isTimerOn.value = true;
    widget.onReset?.call();
    widget.isDisable.call(true);
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (times) {
      timeValu.value = timeValu.value - 1;
      if (timeValu.value == 0) {
        widget.isDisable.call(false);
        _timer?.cancel();
        timeValu.value = 30;
        isTimerOn.value = false;
      }
    });
  }

  // void onTab() {
  //   int fastEmtyIndex = controller.indexWhere((i) => i.text.isEmpty);

  //   if (fastEmtyIndex != -1) {
  //     focusNode[fastEmtyIndex].requestFocus();
  //   }
  // }

  void onKeyEvent(KeyEvent evend, int index) {
    if (evend is KeyDownEvent &&
        evend.logicalKey == LogicalKeyboardKey.backspace) {
      if (controller[index].text.isEmpty) {
        if (index > 0) {
          controller[index - 1].clear();
          focusNode[index - 1].requestFocus();
        }
      } else {
        controller[index].clear();
      }
    }
    if (evend is KeyDownEvent &&
        evend.logicalKey == LogicalKeyboardKey.arrowLeft &&
        index > 0) {
      focusNode[index - 1].requestFocus();
    }
    if (evend is KeyDownEvent &&
        evend.logicalKey == LogicalKeyboardKey.arrowRight &&
        index < widget.length - 1) {
      focusNode[index + 1].requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: .center,
          children: List.generate(widget.length, (index) {
            return SizedBox(
              height: widget.boxSize ?? 60,
              width: widget.boxSize ?? 60,
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: _textFild(
                  boxSize: widget.boxSize ?? 90,
                  controller: controller[index],
                  focusNode: focusNode[index],
                  isError: widget.isError!,
                  index: index,
                  onChanged: (String text) =>
                      onChanged(value: text, index: index),

                  onKeyEvent: (evend) => onKeyEvent(evend, index),
                ),
              ),
            );
          }),
        ),
        if (widget.isShowReset!)
          ListenableBuilder(
            listenable: Listenable.merge([isTimerOn, timeValu]),
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerRight,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  switchInCurve: Curves.easeIn,
                  switchOutCurve: Curves.easeOut,
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: isTimerOn.value
                      ? Padding(
                          key: const Key('timeron'),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          child: Text(
                            '${timeValu.value}',
                            style: TextStyle(
                              fontSize: 14.f,
                              fontWeight: FontWeight.w600,
                              color: context.theme.primaryColor,
                            ),
                          ),
                        )
                      : TextButton(
                          key: const Key('timeroff'),
                          onPressed: time,
                          style: TextButton.styleFrom(
                            foregroundColor: context.theme.primaryColor,
                            minimumSize: Size(48.h, 48.h),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 12.h,
                            ),
                            textStyle: TextStyle(
                              fontSize: 15.f,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          child: Text(context.l10n.resendOtp),
                        ),
                ),
              );
            },
          ),
      ],
    );
  }
}

Widget _textFild({
  required double boxSize,
  required TextEditingController controller,
  required FocusNode focusNode,
  required bool isError,
  required int index,
  required Function(String) onChanged,
  required Function(KeyEvent) onKeyEvent,
  VoidCallback? onTab,
  TextStyle? textStyle,
}) {
  return Focus(
    onKeyEvent: (node, event) {
      onKeyEvent(event);
      return KeyEventResult.ignored;
    },
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.center,
      expands: true,
      maxLines: null,
      decoration: inputDecoration(isError),
      style: textStyle ?? TextStyle(fontSize: 18.f),
      maxLength: 1,
      onChanged: onChanged,
      showCursor: false,
      onTap: onTab,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
      ],
      textInputAction: TextInputAction.go,
      keyboardType: TextInputType.number,
    ),
  );
}

InputDecoration inputDecoration(bool isError) {
  return InputDecoration(
    counterText: "",
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black26, width: 3),
      borderRadius: BorderRadius.circular(15),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(width: 1, color: Colors.black12),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        width: 2,
        color: Colors.redAccent.withValues(alpha: 0.6),
      ),
    ),
    errorText: isError ? "" : null,
    filled: true,
    fillColor: isError
        ? Colors.redAccent.withValues(alpha: 0.15)
        : Colors.grey.shade50,

    contentPadding: EdgeInsets.all(2),
  );
}

Widget text({required Key key, required String text, VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, top: 10),
    child: TextButton(
      key: key,
      onPressed: onTap,
      style: TextButton.styleFrom(
        minimumSize: const Size(48, 48),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14.f,
          fontWeight: FontWeight.w600,
          color: Colors.deepPurpleAccent.shade200,
        ),
      ),
    ),
  );
}
