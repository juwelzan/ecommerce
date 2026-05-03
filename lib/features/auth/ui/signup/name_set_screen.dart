import 'package:ecommerce/shared/path/paths.dart';

class NameSetScreen extends StatelessWidget {
  static const String name = "/NameSetScreen";
  const NameSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Your Name",
      subTitle: "Enter your full name",
      hintText: "Md juwel",
      lable: "Fast Name",
      lottie: Asset.userLottie,
      onSubmitName: (fastname, lastName) {},
    );
  }
}
