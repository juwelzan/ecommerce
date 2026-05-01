import '../../../../shared/path/paths.dart';

class CityNameSetScreen extends StatefulWidget {
  const CityNameSetScreen({super.key});

  @override
  State<CityNameSetScreen> createState() => _CityNameSetScreenState();
}

class _CityNameSetScreenState extends State<CityNameSetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 100),
            Center(
              child: LottiePlayer(path: Asset.waldLottie, w: 350, fit: .cover),
            ),

            AuthWidget(
              showIcon: false,
              title: "City",
              subTitle: "Enter your city name",
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: decorationEliment(
                  labelText: "City",
                  hintText: "Dhaka",
                ),
                style: textStyleEliment(),
              ),
            ),
            SizedBox(height: 80),
            JumpingButton(
              width: double.infinity,
              scale: 0.95,
              isFileBoxShow: true,
              opacity: 1,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SvgPicture.asset(Asset.googleIconSVG),
            ),
          ],
        ),
      ),
    );
  }
}
