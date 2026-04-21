import 'package:ecommerce/shared/path/paths.dart';
import 'package:ecommerce/shared/widget/prodact_widget.dart';

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,

      child: RepaintBoundary(
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),

          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 20.w),
              child: RepaintBoundary(child: ProdactWidget()),
            );
          },
        ),
      ),
    );
  }
}
