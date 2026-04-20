import 'package:ecommerce/shared/path/paths.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarController>(
      builder: (context, state, child) {
        return Container(
          height: 65.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            height: 65.h,
            padding: EdgeInsets.all(10.f),
            decoration: BoxDecoration(
              color: Colors.deepPurple.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                navBarIcon(
                  context,
                  img: Asset.navbHome,
                  isActive: state.pageIndex == 0,
                  screenIndex: 0,
                ),

                navBarIcon(
                  context,
                  img: Asset.navbCategory,
                  isActive: state.pageIndex == 1,
                  screenIndex: 1,
                ),

                navBarIcon(
                  context,
                  img: Asset.navbCart,
                  isActive: state.pageIndex == 2,
                  screenIndex: 2,
                ),

                navBarIcon(
                  context,
                  img: Asset.navbWish,
                  isActive: state.pageIndex == 3,
                  screenIndex: 3,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget navBarIcon(
  BuildContext context, {
  required bool isActive,

  required String img,
  required int screenIndex,
}) {
  return GestureDetector(
    onTap: () => context.read<NavbarController>().nextScreen(screenIndex),
    child: Image.asset(
      img,
      height: 35.h,
      color: isActive
          ? context.theme.primaryColor
          : context.theme.primaryColorLight,
    ),
  );
}
