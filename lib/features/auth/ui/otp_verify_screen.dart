import 'package:ecommerce/features/auth/widget/auth_widget.dart';
import 'package:ecommerce/features/auth/widget/pin_put.dart';
import 'package:ecommerce/shared/widget/jumping_button.dart';
import 'package:flutter/material.dart';

class OtpVerifyScreen extends StatelessWidget {
  static const String name = "/OtpVerufyScreen";
  const OtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isOk = ValueNotifier(false);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 200),
          AuthWidget(
            title: "Enter OTP Code",
            titleSize: 30,
            subTitle: "A 4 Digit OTP Dode has been send",
            subTitleSize: 20,
            logoSize: 120,
          ),
          OtpPinPut(
            length: 4,
            isError: false,
            isShowReset: false,
            boxSize: 70,

            onChanged: (value) {
              print(value);
            },
            isDisable: (value) {
              isOk.value = value;
            },
          ),
          SizedBox(height: 50),

          ValueListenableBuilder(
            valueListenable: isOk,
            builder: (context, value, child) {
              return Column(
                children: [JumpingButton(isDisable: value, isLoding: false)],
              );
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
