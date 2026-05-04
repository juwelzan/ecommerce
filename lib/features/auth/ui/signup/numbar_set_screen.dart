import 'package:ecommerce/features/auth/ui/signup/city_name_set_screen.dart';
import 'package:ecommerce/features/auth/ui/signup/email_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class NumbarSetScreen extends StatelessWidget {
  static const String name = "/NumbarSetScreen";
  const NumbarSetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingnupScreenModel(
      title: "Phone Number",
      subTitle: "Enter your personal number",
      hintText: "01000000000",
      lable: "Phone",
      backScreenPath: EmailSetScreen.name,
      onSubmitText: (fastFild, secondFild) {
        context.push(CityNameSetScreen.name);
      },
    );
  }
}
