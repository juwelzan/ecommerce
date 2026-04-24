import 'package:ecommerce/shared/path/paths.dart';
import 'package:lottie/lottie.dart';

class LodingButton extends StatelessWidget {
  final bool isLoading;
  final String text;
  final VoidCallback onTap;
  const LodingButton({
    super.key,
    required this.isLoading,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: 60,
            width: isLoading ? 60 : constraints.maxWidth,
            decoration: BoxDecoration(
              color: isLoading ? Colors.transparent : Colors.blue,
              borderRadius: isLoading
                  ? BorderRadius.circular(100)
                  : BorderRadius.circular(10),
              border: isLoading ? Border.all(color: Colors.black26) : Border(),
            ),
            child: Center(
              child: AnimatedCrossFade(
                firstChild: Text(text),
                secondChild: Lottie.asset(
                  Asset.lottieLoading,
                  width: 30,
                  height: 30,
                ),
                crossFadeState: isLoading
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 300),
              ),
            ),
          );
        },
      ),
    );
  }
}
