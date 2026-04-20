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
                child: Container(
                  decoration: BoxDecoration(color: Color(0xFFFAFAFA)),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 600,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.deepPurple.withOpacity(0.7),
                              Colors.deepPurple.withOpacity(0.4),
                              Colors.deepPurple.withOpacity(0),
                            ],
                            begin: AlignmentGeometry.topCenter,
                            end: AlignmentGeometry.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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
