import 'package:ecommerce/shared/path/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  static const String name = '/welcome';
  const WelcomeScreen({super.key});

  Future<void> _completeWelcome(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(Keys.hasSeenWelcome, true);
    } catch (_) {
      // Safe fallback if shared preferences throws
    }
    if (context.mounted) {
      context.go(MainScreen.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 40.h,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox.shrink(),
                    Column(
                      children: [
                        Container(
                          width: 120.hw(max: 140, min: 100),
                          height: 120.hw(max: 140, min: 100),
                          decoration: BoxDecoration(
                            color: context.theme.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              Asset.navLogoSVG,
                              width: 80.w,
                            ),
                          ),
                        ),
                        Gap(h: 32.h),
                        Text(
                          context.l10n.welcomeTitle,
                          textAlign: TextAlign.center,
                          style: context.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Gap(h: 16.h),
                        Text(
                          context.l10n.welcomeDescription,
                          textAlign: TextAlign.center,
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 52.h,
                          child: FilledButton(
                            onPressed: () => _completeWelcome(context),
                            style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                            ),
                            child: Text(
                              context.l10n.getStarted,
                              style: TextStyle(
                                fontSize: 16.f,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Gap(h: 16.h),
                        Text(
                          context.l10n.welcomeTagline,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
