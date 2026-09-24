import 'package:ecommerce/shared/path/paths.dart';

class AboutScreen extends StatelessWidget {
  static const String name = '/AboutScreen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.about),
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
              context.l10n.aboutDescription,
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ),
            const Spacer(),
            Text(
              context.l10n.rightsReserved,
              style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
            ),
            Gap(h: 20.h),
          ],
        ),
      ),
    );
  }
}
