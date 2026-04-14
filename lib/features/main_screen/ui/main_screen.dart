import 'package:ecommerce/features/main_screen/widget/bottom_navbar.dart';
import 'package:ecommerce/shared/path/paths.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String name = "/MainScreen";

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavbarController>(
        builder: (context, state, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: state.page.length,
                  onPageChanged: (value) => state.copyWith(index: value),
                  controller: state.pageController,
                  itemBuilder: (context, index) {
                    return state.page[index];
                  },
                ),
              ),

              if (state.pageIndex != 2)
                Positioned(
                  left: 10.w,
                  right: 10.w,
                  bottom: 25.h,
                  child: BottomNavbar(),
                ),
            ],
          );
        },
      ),
    );
  }
}
