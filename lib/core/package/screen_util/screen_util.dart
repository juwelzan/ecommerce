// ignore_for_file: camel_case_types, unused_local_variable

import 'package:ecommerce/shared/path/paths.dart';

typedef screenBuilder = Function(BuildContext context);

class ScreenUtil extends StatelessWidget {
  final screenBuilder builder;
  final Size? screenSize;
  const ScreenUtil({super.key, required this.builder, this.screenSize});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        Size deviseSize = MediaQuery.of(context).size;
        ScreenUtils.Init(
          deviseSize: deviseSize,
          screenSize: screenSize ?? ScreenUtils.Default,
          orientation: orientation,
        );

        return ScreenInherit(child: builder(context));
      },
    );
  }
}

class ScreenInherit extends InheritedWidget {
  const ScreenInherit({super.key, required super.child});
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static ScreenInherit of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScreenInherit>()!;
  }
}
