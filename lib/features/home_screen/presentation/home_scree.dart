import 'package:ecommerce/core/package/gap/sliver_gap.dart';
import 'package:ecommerce/features/home_screen/widgets/ads_banner.dart';
import 'package:ecommerce/features/home_screen/widgets/all_categories.dart';
import 'package:ecommerce/features/home_screen/widgets/product_section.dart';
import 'package:ecommerce/features/home_screen/widgets/search_field.dart';
import 'package:ecommerce/features/home_screen/widgets/title_name.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = "/HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreeState();
}

class _HomeScreeState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdsBannerProvider>().autoScrollBanner();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: SvgPicture.asset(Asset.navLogoSVG, width: 140.w),
        actions: [
          IconButton(
            tooltip: 'Profile',
            onPressed: () => context.push(ProfileScreen.name),
            icon: Image.asset(
              Asset.appbarUser,
              width: 27.w,
              color: context.textTheme.bodyLarge!.color,
            ),
          ),
          IconButton(
            tooltip: 'Support',
            onPressed: () => showModalBottomSheet<void>(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              ),
              builder: (context) => SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer Support',
                        style: context.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Gap(h: 8.h),
                      Text(
                        'We are here to help you 24/7. Reach out to us via any of the channels below.',
                        style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      ),
                      Gap(h: 20.h),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
                          child: Icon(Icons.phone, color: context.theme.primaryColor),
                        ),
                        title: const Text('Call Us'),
                        subtitle: const Text('+880 1700-000000'),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Calling +880 1700-000000...')),
                          );
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
                          child: Icon(Icons.email, color: context.theme.primaryColor),
                        ),
                        title: const Text('Email Support'),
                        subtitle: const Text('support@easyecommerce.com'),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Opening email support...')),
                          );
                        },
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
                          child: Icon(Icons.chat, color: context.theme.primaryColor),
                        ),
                        title: const Text('Live Chat'),
                        subtitle: const Text('Chat with our support agent'),
                        onTap: () {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Connecting to live chat...')),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            icon: Image.asset(
              Asset.appbarPhone,
              width: 27.w,
              color: context.textTheme.bodyLarge!.color,
            ),
          ),
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => context.push(NotificationScreen.name),
            icon: Image.asset(
              Asset.appbarBell,
              width: 27.w,
              color: context.textTheme.bodyLarge!.color,
            ),
          ),
          Gap(w: 5.w),
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverGap(h: 10.h),
          SearchField(),

          SliverGap(h: 10.h),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180.h,
              child: RepaintBoundary(child: AdsBanner()),
            ),
          ),
          SliverGap(h: 10.h),
          SliverToBoxAdapter(
            child: RepaintBoundary(
              child: TitleName(
                onTap: () {
                  context.read<NavbarController>().nextScreen(1);
                },
              ),
            ),
          ),
          SliverGap(h: 10.h),

          AllCategories(),

          SliverGap(h: 10.h),
          SliverToBoxAdapter(
            child: RepaintBoundary(
              child: TitleName(
                title: 'All Products',
                onTap: () => context.push(ProductListingScreen.name),
              ),
            ),
          ),
          SliverToBoxAdapter(child: RepaintBoundary(child: ProductSection())),
          const SliverGap(h: 200),
        ],
      ),
    );
  }
}
