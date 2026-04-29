import 'dart:async';

import 'package:ecommerce/shared/path/paths.dart';

class OtpPinPut extends StatefulWidget {
  final int length;
  final Function(String value) onChanged;
  final Function(bool value) isDisable;
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
  });

  @override
  State<OtpPinPut> createState() => _OtpPinPutState();
}

class _OtpPinPutState extends State<OtpPinPut> {
  ValueNotifier<int> timeValu = ValueNotifier(30);
  ValueNotifier<bool> isTimerOn = ValueNotifier(false);

  late Timer _timer;
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
    super.dispose();
    _timer.cancel();
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
    widget.isDisable.call(true);
    _timer = Timer.periodic(Duration(seconds: 1), (times) {
      timeValu.value = timeValu.value - 1;
      if (timeValu.value == 0) {
        widget.isDisable.call(false);
        _timer.cancel();
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
        evend.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (index == 3) {
        focusNode[2].requestFocus();
      }
      if (index == 2) {
        focusNode[1].requestFocus();
      }
      if (index == 1) {
        focusNode[0].requestFocus();
      }
    }
    if (evend is KeyDownEvent &&
        evend.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (index == 0) {
        focusNode[1].requestFocus();
      }
      if (index == 1) {
        focusNode[2].requestFocus();
      }
      if (index == 2) {
        focusNode[3].requestFocus();
      }
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
              return Row(
                mainAxisAlignment: .end,
                crossAxisAlignment: .center,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: isTimerOn.value
                        ? SizedBox(
                            width: 70,
                            child: Center(
                              child: text(
                                key: Key("timeron"),
                                text: "${timeValu.value}",
                              ),
                            ),
                          )
                        : SizedBox(
                            width: 70,
                            child: text(
                              key: Key("timeroff"),
                              text: "resend",
                              onTap: () => time(),
                            ),
                          ),
                  ),
                ],
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
  return KeyboardListener(
    focusNode: FocusNode(),
    onKeyEvent: onKeyEvent,
    child: TextField(
      controller: controller,
      focusNode: focusNode,
      textAlign: .center,
      expands: true,
      maxLines: null,

      decoration: inputDecoration(isError),
      style: textStyle ?? TextStyle(fontSize: 20),

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
        color: Colors.redAccent.withOpacity(0.6),
      ),
    ),
    errorText: isError ? "" : null,
    filled: true,
    fillColor: isError
        ? Colors.redAccent.withOpacity(0.15)
        : Colors.grey.shade50,

    contentPadding: EdgeInsets.all(2),
  );
}

Widget text({required Key key, required String text, VoidCallback? onTap}) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, top: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Text(
        key: key,
        textAlign: .center,
        text,
        style: TextStyle(fontSize: 18, color: Colors.deepPurpleAccent.shade200),
      ),
    ),
  );
}
