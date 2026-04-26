import 'package:ecommerce/core/logger/logger.dart';
import 'package:ecommerce/features/auth/widget/auth_widget.dart';
import 'package:ecommerce/features/auth/widget/pin_put.dart';
import 'package:flutter/material.dart';

class OtpVerufyScreen extends StatelessWidget {
  static const String name = "/OtpVerufyScreen";
  const OtpVerufyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 100),
          AuthWidget(
            title: "Enter OTP Code",
            titleSize: 30,
            subTitle: "A 4 Digit OTP Dode has been send",
            subTitleSize: 20,
            logoSize: 120,
          ),
          OtpInput(
            onCompleted: (p0) {
              LoggerLog.logI(p0);
            },
          ),
        ],
      ),
    );
  }
}
