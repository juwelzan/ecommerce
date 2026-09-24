import 'package:ecommerce/shared/path/paths.dart';

class AboutScreen extends StatelessWidget {
  static const String name = '/AboutScreen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About EasyEcommerce'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Gap(h: 20.h),
            SvgPicture.asset(Asset.navLogoSVG, width: 160.w),
            Gap(h: 16.h),
            Text(
              'EasyEcommerce v1.0.0',
              style: context.textTheme.titleMedium,
            ),
            Gap(h: 8.h),
            Text(
              'Your ultimate one-stop shopping destination for the best products and deals.',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const Spacer(),
            Text(
              '© 2025 EasyEcommerce Inc. All rights reserved.',
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            Gap(h: 20.h),
          ],
        ),
      ),
    );
  }
}
