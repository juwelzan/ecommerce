import 'package:ecommerce/shared/path/paths.dart';

class CardBottonBox extends StatelessWidget {
  const CardBottonBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: 150.h,
      decoration: BoxDecoration(
        color: context.theme.secondaryHeaderColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            color: context.isThemeMod == Brightness.dark
                ? Colors.white38
                : Colors.black12,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Total Pricr"), Text("34565365")],
          ),
          Container(
            height: 50,
            width: 150,

            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
