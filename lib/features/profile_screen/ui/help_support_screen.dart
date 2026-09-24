import 'package:ecommerce/shared/path/paths.dart';

class HelpSupportScreen extends StatelessWidget {
  static const String name = '/HelpSupportScreen';
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.helpSupport)),
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Text(
            context.l10n.helpIntro,
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
                  title: Text(context.l10n.callUs),
                  subtitle: Text(context.l10n.supportPhone),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.calling),
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
                  title: Text(context.l10n.emailSupport),
                  subtitle: Text(context.l10n.supportEmail),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.openingEmail)),
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(
                    Icons.chat_bubble_outline,
                    color: context.theme.primaryColor,
                  ),
                  title: Text(context.l10n.liveChat),
                  subtitle: Text(context.l10n.chatTeam),
                  trailing: const Icon(Icons.chevron_right, size: 20),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.connectingChat),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Gap(h: 24.h),
          Text(
            context.l10n.faqTitle,
            style: context.textTheme.titleMedium?.copyWith(
              fontSize: 18.f,
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(h: 12.h),
          ExpansionTile(
            title: Text(context.l10n.trackOrderQuestion),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(context.l10n.trackOrderAnswer),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(context.l10n.returnPolicyQuestion),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(context.l10n.returnPolicyAnswer),
              ),
            ],
          ),
          ExpansionTile(
            title: Text(context.l10n.promoCodeQuestion),
            children: [
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(context.l10n.promoCodeAnswer),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
