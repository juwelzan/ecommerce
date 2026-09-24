import 'package:ecommerce/shared/path/paths.dart';

class HelpSupportScreen extends StatelessWidget {
  static const String name = '/HelpSupportScreen';
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final primary = context.theme.primaryColor;
    final borderColor = context.isThemeMod == Brightness.light
        ? Colors.grey.shade200
        : Colors.grey.shade800;

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.helpSupport)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
        children: [
          Text(
            context.l10n.helpIntro,
            style: TextStyle(
              fontSize: 14.f,
              fontWeight: FontWeight.w600,
              height: 1.3,
            ),
          ),
          Gap(h: 6.h),
          Text(
            context.l10n.supportDescription,
            style: TextStyle(
              fontSize: 12.5.f,
              color: Colors.grey.shade600,
              height: 1.35,
            ),
          ),
          Gap(h: 16.h),
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: BorderSide(color: borderColor),
            ),
            child: Column(
              children: [
                _SupportTile(
                  icon: Icons.phone_outlined,
                  title: context.l10n.callUs,
                  subtitle: context.l10n.supportPhone,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.calling)),
                    );
                  },
                ),
                Divider(height: 1, color: borderColor),
                _SupportTile(
                  icon: Icons.email_outlined,
                  title: context.l10n.emailSupport,
                  subtitle: context.l10n.supportEmail,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.openingEmail)),
                    );
                  },
                ),
                Divider(height: 1, color: borderColor),
                _SupportTile(
                  icon: Icons.chat_bubble_outline,
                  title: context.l10n.liveChat,
                  subtitle: context.l10n.chatTeam,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(context.l10n.connectingChat)),
                    );
                  },
                ),
              ],
            ),
          ),
          Gap(h: 22.h),
          Text(
            context.l10n.faqTitle,
            style: TextStyle(
              fontSize: 14.f,
              fontWeight: FontWeight.w700,
              color: primary,
            ),
          ),
          Gap(h: 8.h),
          _FaqTile(
            question: context.l10n.trackOrderQuestion,
            answer: context.l10n.trackOrderAnswer,
          ),
          _FaqTile(
            question: context.l10n.returnPolicyQuestion,
            answer: context.l10n.returnPolicyAnswer,
          ),
          _FaqTile(
            question: context.l10n.promoCodeQuestion,
            answer: context.l10n.promoCodeAnswer,
          ),
        ],
      ),
    );
  }
}

class _SupportTile extends StatelessWidget {
  const _SupportTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
      leading: Icon(icon, size: 22.r, color: context.theme.primaryColor),
      title: Text(
        title,
        style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.f, color: Colors.grey.shade600),
      ),
      trailing: Icon(Icons.chevron_right, size: 18.r, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class _FaqTile extends StatelessWidget {
  const _FaqTile({required this.question, required this.answer});

  final String question;
  final String answer;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 4.w),
      childrenPadding: EdgeInsets.fromLTRB(8.w, 0, 8.w, 12.h),
      title: Text(
        question,
        style: TextStyle(fontSize: 13.5.f, fontWeight: FontWeight.w500),
      ),
      children: [
        Text(
          answer,
          style: TextStyle(
            fontSize: 12.5.f,
            color: Colors.grey.shade700,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
