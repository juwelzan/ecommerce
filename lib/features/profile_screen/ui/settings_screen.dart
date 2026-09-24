import 'package:ecommerce/shared/path/paths.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = '/SettingsScreen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final localeController = context.read<LocaleController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Consumer<ThemeController>(
            builder: (context, themeCtrl, child) => ListTile(
              leading: const Icon(Icons.dark_mode_outlined),
              title: Text(l10n.themeMode),
              subtitle: Text(
                themeCtrl.themeMode == ThemeMode.dark
                    ? l10n.darkMode
                    : themeCtrl.themeMode == ThemeMode.light
                        ? l10n.lightMode
                        : l10n.systemDefault,
              ),
              trailing: DropdownButton<ThemeMode>(
                value: themeCtrl.themeMode,
                underline: const SizedBox(),
                onChanged: (ThemeMode? newMode) {
                  if (newMode != null) {
                    themeCtrl.themeTgol(newMode);
                  }
                },
                items: [
                  DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(l10n.light),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.dark,
                    child: Text(l10n.dark),
                  ),
                  DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(l10n.system),
                  ),
                ],
              ),
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_outlined),
            title: Text(l10n.pushNotifications),
            trailing: Switch(
              value: true,
              onChanged: (val) {},
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.language_outlined),
            title: Text(l10n.language),
            subtitle: Text(Localizations.localeOf(context).languageCode == 'bn'
                ? l10n.bangla
                : l10n.english),
            onTap: () => showModalBottomSheet<void>(
              context: context,
              builder: (sheetContext) => SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RadioListTile<Locale>(
                      title: Text(l10n.bangla),
                      value: const Locale('bn'),
                      groupValue: localeController.locale,
                      onChanged: (value) {
                        if (value != null) localeController.setLocale(value);
                        Navigator.pop(sheetContext);
                      },
                    ),
                    RadioListTile<Locale>(
                      title: Text(l10n.english),
                      value: const Locale('en'),
                      groupValue: localeController.locale,
                      onChanged: (value) {
                        if (value != null) localeController.setLocale(value);
                        Navigator.pop(sheetContext);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
