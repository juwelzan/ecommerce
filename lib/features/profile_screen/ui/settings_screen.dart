import 'package:ecommerce/shared/path/paths.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = '/SettingsScreen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Consumer<ThemeController>(
            builder: (context, themeCtrl, child) => ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: const Text('Theme Mode'),
              subtitle: Text(
                themeCtrl.themeMode == ThemeMode.dark
                    ? 'Dark Mode'
                    : themeCtrl.themeMode == ThemeMode.light
                        ? 'Light Mode'
                        : 'System Default',
              ),
              trailing: DropdownButton<ThemeMode>(
                value: themeCtrl.themeMode,
                underline: const SizedBox(),
                onChanged: (ThemeMode? newMode) {
                  if (newMode != null) {
                    themeCtrl.themeTgol(newMode);
                  }
                },
                items: const [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text('Light'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text('Dark'),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text('System'),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: const Text('Push Notifications'),
            trailing: Switch(
              value: true,
              onChanged: (val) {},
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: const Text('Language'),
            subtitle: const Text('English (US)'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
