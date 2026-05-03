import 'package:ecommerce/shared/path/paths.dart';

class EmailSetScreen extends StatelessWidget {
  static const String name = "/EmailSetScreen";
  const EmailSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Email",
      subTitle: "Enter valid email",
      hintText: "01000000000",
      lable: "Phone",
      lottie: Asset.passwordLottie,
    );
  }
}
