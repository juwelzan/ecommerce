import 'package:flutter/material.dart';

class OtpInput extends StatefulWidget {
  final int length;
  final Function(String)? onCompleted;

  const OtpInput({super.key, this.length = 4, this.onCompleted});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(widget.length, (_) => TextEditingController());

    focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  void _handleChange(String value, int index) {
    // 👉 Paste support
    if (value.length > 1) {
      final chars = value.split("");

      for (int i = 0; i < widget.length; i++) {
        controllers[i].text = i < chars.length ? chars[i] : "";
      }

      FocusScope.of(context).unfocus();
      _checkComplete();
      return;
    }

    // 👉 Move next
    if (value.isNotEmpty && index < widget.length - 1) {
      focusNodes[index + 1].requestFocus();
    }

    // 👉 Move back
    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }

    _checkComplete();
  }

  void _checkComplete() {
    String otp = controllers.map((e) => e.text).join();

    if (otp.length == widget.length && !otp.contains("")) {
      widget.onCompleted?.call(otp);
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.length, (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: TextField(
              controller: controllers[index],
              focusNode: focusNodes[index],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 1,
              decoration: InputDecoration(
                counterText: "",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) => _handleChange(value, index),
            ),
          ),
        );
      }),
    );
  }
}
