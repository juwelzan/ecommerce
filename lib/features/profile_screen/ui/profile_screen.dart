import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/signup/sign_up_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final auth = context.watch<AuthController>();
    final isLoggedIn = auth.isLoggedIn;
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.profile),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go(MainScreen.name);
            }
          },
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        children: [
          if (isLoggedIn)
            _buildLoggedInHeader(context, user)
          else
            _buildLoggedOutCard(context),
          Gap(h: 16.h),
          _buildSectionHeader(context, l10n.account),
          _buildTile(
            context,
            icon: Icons.shopping_bag_outlined,
            title: l10n.orders,
            subtitle: l10n.trackOrders,
            onTap: () {
              if (isLoggedIn) {
                context.push(OrdersScreen.name);
              } else {
                _showLoginRequiredDialog(context, l10n.trackOrders);
              }
            },
          ),
          _buildTile(
            context,
            icon: Icons.shopping_cart_outlined,
            title: l10n.cart,
            subtitle: l10n.viewCart,
            onTap: () {
              if (context.canPop()) context.pop();
              context.read<NavbarController>().nextScreen(2);
            },
          ),
          _buildTile(
            context,
            icon: Icons.favorite_border,
            title: l10n.wishlist,
            subtitle: l10n.savedItems,
            onTap: () {
              if (context.canPop()) context.pop();
              context.read<NavbarController>().nextScreen(3);
            },
          ),
          _buildTile(
            context,
            icon: Icons.location_on_outlined,
            title: l10n.savedAddresses,
            subtitle: l10n.manageAddresses,
            onTap: () {
              if (isLoggedIn) {
                context.push(AddressScreen.name);
              } else {
                _showLoginRequiredDialog(context, l10n.manageAddresses);
              }
            },
          ),
          Gap(h: 12.h),
          _buildSectionHeader(context, l10n.preferences),
          _buildTile(
            context,
            icon: Icons.notifications_outlined,
            title: l10n.notifications,
            subtitle: l10n.manageAlerts,
            onTap: () => context.push(NotificationScreen.name),
          ),
          _buildTile(
            context,
            icon: Icons.settings_outlined,
            title: l10n.settings,
            subtitle: l10n.themePreferences,
            onTap: () => context.push(SettingsScreen.name),
          ),
          Gap(h: 12.h),
          _buildSectionHeader(context, l10n.supportLegal),
          _buildTile(
            context,
            icon: Icons.support_agent_outlined,
            title: l10n.helpSupport,
            subtitle: l10n.faqsSupport,
            onTap: () => context.push(HelpSupportScreen.name),
          ),
          _buildTile(
            context,
            icon: Icons.info_outline,
            title: l10n.about,
            subtitle: l10n.appDetails,
            onTap: () => context.push(AboutScreen.name),
          ),
          Gap(h: 20.h),
          if (isLoggedIn) ...[
            SizedBox(
              width: double.infinity,
              height: 46.h,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context, auth),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: const Icon(Icons.logout, size: 18),
                label: Text(
                  l10n.logout,
                  style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Gap(h: 20.h),
          ],
        ],
      ),
    );
  }

  Widget _buildLoggedInHeader(BuildContext context, UserModel? user) {
    final displayName = user?.fullName.isNotEmpty == true
        ? user!.fullName
        : context.l10n.userFallback;
    final email = user?.email ?? context.l10n.noEmailAvailable;
    final phone = user?.phone;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: context.isThemeMod == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28.r,
            backgroundColor: context.theme.primaryColor.withValues(alpha: 0.12),
            child: Text(
              displayName.isNotEmpty ? displayName[0].toUpperCase() : 'U',
              style: TextStyle(
                fontSize: 16.f,
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
          ),
          Gap(w: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: TextStyle(fontSize: 15.f, fontWeight: FontWeight.w700),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(h: 2.h),
                Text(
                  email,
                  style: TextStyle(fontSize: 11.f, color: Colors.grey.shade600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (phone != null && phone.isNotEmpty) ...[
                  Gap(h: 2.h),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 11.f,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ],
            ),
          ),
          TextButton(
            onPressed: () => context.push(EditProfileScreen.name),
            style: TextButton.styleFrom(
              minimumSize: Size(48.w, 40.h),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
            ),
            child: Text(
              context.l10n.edit,
              style: TextStyle(fontSize: 13.f, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoggedOutCard(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: context.isThemeMod == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: context.theme.primaryColor.withValues(
                  alpha: 0.12,
                ),
                child: Icon(
                  Icons.person_outline,
                  size: 26.r,
                  color: context.theme.primaryColor,
                ),
              ),
              Gap(w: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.welcome,
                      style: TextStyle(
                        fontSize: 14.f,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gap(h: 4.h),
                    Text(
                      l10n.signInFeatures,
                      style: TextStyle(
                        fontSize: 12.f,
                        color: Colors.grey.shade600,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(h: 14.h),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: FilledButton.icon(
                    onPressed: () => context.push(LoginWithEmailPass.name),
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: const Icon(Icons.login, size: 16),
                    label: Text(
                      context.l10n.login,
                      style: TextStyle(fontSize: 13.f),
                    ),
                  ),
                ),
              ),
              Gap(w: 10.w),
              Expanded(
                child: SizedBox(
                  height: 44.h,
                  child: OutlinedButton.icon(
                    onPressed: () => context.push(SignUpScreen.name),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    icon: const Icon(Icons.person_add_outlined, size: 16),
                    label: Text(
                      context.l10n.signup,
                      style: TextStyle(fontSize: 13.f),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 6.h),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11.f,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.9,
        ),
      ),
    );
  }

  Widget _buildTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.only(bottom: 6.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: context.isThemeMod == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
        leading: Icon(icon, size: 22.r, color: context.theme.primaryColor),
        title: Text(
          title,
          style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 11.f, color: Colors.grey.shade600),
        ),
        trailing: Icon(Icons.chevron_right, size: 18.r, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLoginRequiredDialog(BuildContext context, String actionText) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(context.l10n.signInRequired),
        content: Text(context.l10n.pleaseSignIn(actionText)),
        actions: [
          TextButton(
            onPressed: () => ctx.pop(),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            onPressed: () {
              ctx.pop();
              context.push(LoginWithEmailPass.name);
            },
            child: Text(context.l10n.login),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthController auth) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(context.l10n.logout),
        content: Text(context.l10n.logoutConfirm),
        actions: [
          TextButton(
            onPressed: () => dialogContext.pop(),
            child: Text(context.l10n.cancel),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              dialogContext.pop();
              await auth.logout();
              if (context.mounted) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(context.l10n.loggedOut)));
              }
            },
            child: Text(context.l10n.logout),
          ),
        ],
      ),
    );
  }
}
