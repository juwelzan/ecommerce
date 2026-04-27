import 'dart:async';

import 'package:ecommerce/shared/path/paths.dart';

class OtpPinPut extends StatefulWidget {
  final int length;
  final Function(String value) onChanged;
  final Function(bool value) isDisable;
  final bool? isError, isShowReset;

  const OtpPinPut({
    super.key,
    required this.length,
    required this.onChanged,
    this.isError = false,
    required this.isDisable,
    this.isShowReset = false,
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
    super.initState();
  }

  void setController() {
    controller = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    focusNode = List.generate(widget.length, (index) => FocusNode());
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

  void onChanged({required String value, required int index}) {
    if (value.isNotEmpty) {
      if (index < widget.length - 1) {
        focusNode[index + 1].requestFocus();
        LoggerLog.logV("${index + 1}");
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(widget.length, (index) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: controller[index],
                  focusNode: focusNode[index],
                  textAlign: .center,

                  decoration: inputDecoration(widget.isError!),
                  style: TextStyle(fontSize: 25),
                  maxLength: 1,
                  onChanged: (text) => onChanged(value: text, index: index),
                  showCursor: false,

                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,

                    LengthLimitingTextInputFormatter(1),
                  ],
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.number,
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
