import '../../../../shared/path/paths.dart';

class CityNameSetScreen extends StatelessWidget {
  static const String name = "/CityNameSetScreen";
  const CityNameSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Password",
      subTitle: "Create strong password",
      hintText: "01000000000",
      lable: "Phone",
      lottie: Asset.waldLottie,
    );
  }
}
