import 'package:ecommerce/shared/path/paths.dart';

class HelpSupportScreen extends StatelessWidget {
  static const String name = '/HelpSupportScreen';
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            'How can we help you today?',
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 18.f,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(h: 16.h),
          Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(
                color: context.isThemeMod == Brightness.light
                    ? Colors.grey.shade200
                    : Colors.grey.shade800,
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.phone_outlined,
                    color: context.theme.primaryColor,
                  ),
                  title: const Text('Call Customer Care'),
                  subtitle: const Text('+880 1700-000000 (24/7)'),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Calling +880 1700-000000...'),
                      ),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: context.theme.primaryColor,
                  ),
                  title: const Text('Email Support'),
                  subtitle: const Text('support@easyecommerce.com'),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opening email support...')),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outline,
                    color: context.theme.primaryColor,
                  ),
                  title: const Text('Live Chat'),
                  subtitle: const Text('Chat instantly with our support team'),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Connecting to live chat agent...'),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Gap(h: 24.h),
          Text(
            'Frequently Asked Questions',
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 18.f,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(h: 12.h),
          ExpansionTile(
            title: const Text('How do I track my order?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: const Text(
                  'You can track your orders by going to Profile -> My Orders. Here you will find live status updates for all your purchases.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('What is the return policy?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: const Text(
                  'We offer a 7-day easy return policy for all eligible products. Items must be in their original condition.',
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: const Text('How do I apply a promo code?'),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: const Text(
                  'You can apply promo codes on the Checkout screen before placing your order.',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
