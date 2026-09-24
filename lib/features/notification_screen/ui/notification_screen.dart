import 'package:ecommerce/shared/path/paths.dart';

class NotificationScreen extends StatelessWidget {
  static const String name = '/NotificationScreen';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(
        child: Text('আপনার জন্য এখনো কোনো নতুন নোটিফিকেশন নেই।'),
      ),
    );
  }
}
