import 'package:ecommerce/shared/path/paths.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) =>
          context.read<NavbarController>().back(),
      child: Scaffold(),
    );
  }
}
