import 'package:ecommerce/shared/path/paths.dart';

class NotificationScreen extends StatelessWidget {
  static const String name = '/NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.notifications)),
      body: Center(child: Text(context.l10n.noNotifications)),
    );
  }
}
