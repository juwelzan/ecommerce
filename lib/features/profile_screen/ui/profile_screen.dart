import 'package:ecommerce/features/auth/ui/login_with_email_pass.dart';
import 'package:ecommerce/features/auth/ui/signup/name_set_screen.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = '/ProfileScreen';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthController>();
    final isLoggedIn = auth.isLoggedIn;
    final user = auth.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        children: [
          // Header: Logged-in Profile or Logged-out Login Card
          if (isLoggedIn)
            _buildLoggedInHeader(context, user)
          else
            _buildLoggedOutCard(context),

          Gap(h: 20.h),

          // Account Section
          _buildSectionHeader(context, 'Account'),
          _buildTile(
            context,
            icon: Icons.shopping_bag_outlined,
            title: 'My Orders',
            subtitle: 'Track and view your orders',
            onTap: () {
              if (isLoggedIn) {
                context.push(OrdersScreen.name);
              } else {
                _showLoginRequiredDialog(context, 'view your orders');
              }
            },
          ),
          _buildTile(
            context,
            icon: Icons.favorite_border,
            title: 'Wishlist',
            subtitle: 'Your saved items',
            onTap: () {
              if (context.canPop()) {
                context.pop();
              }
              context.read<NavbarController>().nextScreen(3);
            },
          ),
          _buildTile(
            context,
            icon: Icons.location_on_outlined,
            title: 'Saved Addresses',
            subtitle: 'Manage delivery addresses',
            onTap: () {
              if (isLoggedIn) {
                context.push(AddressScreen.name);
              } else {
                _showLoginRequiredDialog(context, 'manage your addresses');
              }
            },
          ),
          Gap(h: 16.h),

          // Preferences Section
          _buildSectionHeader(context, 'Preferences'),
          _buildTile(
            context,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage push alerts',
            onTap: () => context.push(NotificationScreen.name),
          ),
          _buildTile(
            context,
            icon: Icons.settings_outlined,
            title: 'Settings',
            subtitle: 'App theme & preferences',
            onTap: () => context.push(SettingsScreen.name),
          ),
          Gap(h: 16.h),

          // Support Section
          _buildSectionHeader(context, 'Support & Legal'),
          _buildTile(
            context,
            icon: Icons.help_outline,
            title: 'Help & Support',
            subtitle: 'FAQs and contact support',
            onTap: () => context.push(HelpSupportScreen.name),
          ),
          _buildTile(
            context,
            icon: Icons.info_outline,
            title: 'About EasyEcommerce',
            subtitle: 'App version & details',
            onTap: () => context.push(AboutScreen.name),
          ),
          Gap(h: 24.h),

          // Logout Button (Only visible when user is logged in)
          if (isLoggedIn) ...[
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => _showLogoutDialog(context, auth),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
            Gap(h: 24.h),
          ],
        ],
      ),
    );
  }

  Widget _buildLoggedInHeader(BuildContext context, UserModel? user) {
    final displayName = user?.fullName.isNotEmpty == true
        ? user!.fullName
        : 'User';
    final email = user?.email ?? 'No email available';
    final phone = user?.phone;

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: context.isThemeMod == Brightness.light
                ? Colors.black.withValues(alpha: 0.05)
                : Colors.white.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32.r,
            backgroundColor: context.theme.primaryColor.withValues(alpha: 0.1),
            child: Text(
              displayName.isNotEmpty ? displayName[0].toUpperCase() : 'U',
              style: TextStyle(
                fontSize: 24.f,
                fontWeight: FontWeight.bold,
                color: context.theme.primaryColor,
              ),
            ),
          ),
          Gap(w: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayName,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Gap(h: 2.h),
                Text(
                  email,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (phone != null && phone.isNotEmpty) ...[
                  Gap(h: 4.h),
                  Row(
                    children: [
                      Icon(Icons.phone, size: 12.r, color: Colors.grey),
                      Gap(w: 4.w),
                      Text(
                        phone,
                        style: context.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 11.f,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          OutlinedButton(
            onPressed: () => context.push(EditProfileScreen.name),
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
            ),
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  Widget _buildLoggedOutCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: context.isThemeMod == Brightness.light
                ? Colors.black.withValues(alpha: 0.05)
                : Colors.white.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.r,
                backgroundColor:
                    context.theme.primaryColor.withValues(alpha: 0.1),
                child: Icon(
                  Icons.person_outline,
                  size: 32.r,
                  color: context.theme.primaryColor,
                ),
              ),
              Gap(w: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to EasyEcommerce',
                      style: context.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(h: 4.h),
                    Text(
                      'Sign in to enjoy all features, track your orders & manage wishlist.',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(h: 18.h),
          Row(
            children: [
              Expanded(
                child: FilledButton.icon(
                  onPressed: () => context.push(LoginWithEmailPass.name),
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  icon: const Icon(Icons.login, size: 18),
                  label: const Text('Sign In'),
                ),
              ),
              Gap(w: 12.w),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => context.push(NameSetScreen.name),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 11.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  icon: const Icon(Icons.person_add_outlined, size: 18),
                  label: const Text('Sign Up'),
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
      padding: EdgeInsets.only(left: 4.w, bottom: 8.h),
      child: Text(
        title.toUpperCase(),
        style: context.textTheme.labelSmall?.copyWith(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.1,
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
      margin: EdgeInsets.only(bottom: 8.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: context.isThemeMod == Brightness.light
              ? Colors.grey.shade200
              : Colors.grey.shade800,
        ),
      ),
      child: ListTile(
        leading: Icon(icon, color: context.theme.primaryColor),
        title: Text(
          title,
          style: context.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: context.textTheme.bodySmall?.copyWith(color: Colors.grey),
        ),
        trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }

  void _showLoginRequiredDialog(BuildContext context, String actionText) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Sign In Required'),
        content: Text('Please sign in to your account to $actionText.'),
        actions: [
          TextButton(
            onPressed: () => ctx.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              ctx.pop();
              context.push(LoginWithEmailPass.name);
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, AuthController auth) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to log out of your account?'),
        actions: [
          TextButton(
            onPressed: () => dialogContext.pop(),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () async {
              dialogContext.pop();
              await auth.logout();
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully'),
                  ),
                );
              }
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
