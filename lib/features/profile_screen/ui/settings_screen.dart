import 'package:ecommerce/shared/path/paths.dart';

class SettingsScreen extends StatelessWidget {
  static const String name = '/SettingsScreen';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final localeController = context.read<LocaleController>();

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settings)),
      body: ListView(
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 24.h),
        children: [
          _sectionLabel(context, l10n.preferences),
          Consumer<ThemeController>(
            builder: (context, themeCtrl, child) => ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 8.w,
                vertical: 2.h,
              ),
              leading: Icon(
                Icons.dark_mode_outlined,
                size: 22.r,
                color: context.theme.primaryColor,
              ),
              title: Text(
                l10n.themeMode,
                style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                themeCtrl.themeMode == ThemeMode.dark
                    ? l10n.darkMode
                    : themeCtrl.themeMode == ThemeMode.light
                    ? l10n.lightMode
                    : l10n.systemDefault,
                style: TextStyle(fontSize: 12.f, color: Colors.grey.shade600),
              ),
              trailing: DropdownButton<ThemeMode>(
                value: themeCtrl.themeMode,
                underline: const SizedBox(),
                style: TextStyle(
                  fontSize: 13.f,
                  color: context.theme.textTheme.bodyMedium?.color,
                ),
                onChanged: (ThemeMode? newMode) {
                  if (newMode != null) themeCtrl.themeTgol(newMode);
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
          const Divider(height: 1),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 2.h,
            ),
            leading: Icon(
              Icons.notifications_outlined,
              size: 22.r,
              color: context.theme.primaryColor,
            ),
            title: Text(
              l10n.pushNotifications,
              style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
            ),
            trailing: Switch.adaptive(value: true, onChanged: (_) {}),
          ),
          const Divider(height: 1),
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 2.h,
            ),
            leading: Icon(
              Icons.language_outlined,
              size: 22.r,
              color: context.theme.primaryColor,
            ),
            title: Text(
              l10n.language,
              style: TextStyle(fontSize: 14.f, fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              Localizations.localeOf(context).languageCode == 'bn'
                  ? l10n.bangla
                  : l10n.english,
              style: TextStyle(fontSize: 12.f, color: Colors.grey.shade600),
            ),
            trailing: Icon(Icons.chevron_right, size: 18.r, color: Colors.grey),
            onTap: () => showModalBottomSheet<void>(
              context: context,
              builder: (sheetContext) => SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Text(
                          l10n.language,
                          style: TextStyle(
                            fontSize: 14.f,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      RadioListTile<Locale>(
                        dense: true,
                        title: Text(
                          l10n.bangla,
                          style: TextStyle(fontSize: 14.f),
                        ),
                        value: const Locale('bn'),
                        groupValue: localeController.locale,
                        onChanged: (value) {
                          if (value != null) localeController.setLocale(value);
                          Navigator.pop(sheetContext);
                        },
                      ),
                      RadioListTile<Locale>(
                        dense: true,
                        title: Text(
                          l10n.english,
                          style: TextStyle(fontSize: 14.f),
                        ),
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
          ),
        ],
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 6.h),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11.f,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.8,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
