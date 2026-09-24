import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/generated/app_localizations.dart';

class LocaleController extends ChangeNotifier {
  static const _localeKey = 'appLocale';
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> load() async {
    final preferences = await SharedPreferences.getInstance();
    final languageCode = preferences.getString(_localeKey);
    if (languageCode == 'bn' || languageCode == 'en') {
      _locale = Locale(languageCode!);
    }
    notifyListeners();
  }

  Future<void> setLocale(Locale locale) async {
    if (locale.languageCode != 'bn' && locale.languageCode != 'en') return;
    if (_locale == locale) return;
    _locale = locale;
    notifyListeners();
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_localeKey, locale.languageCode);
  }
}

extension AppLocalizationsContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  String localizedError(String? message, String fallback) {
    final localization = l10n;
    if (message != null && message.trim().isNotEmpty) {
      return switch (message) {
        'Login failed. Please check your credentials.' ||
        'Login failed. Please check credentials.' => localization.loginError,
        'Sign up failed. Please try again.' ||
        'Registration failed. Please try again.' =>
          localization.registrationError,
        'Failed to update profile.' => localization.profileUpdateError,
        'OTP verification failed.' => localization.otpVerificationError,
        'Unable to send reset instructions.' =>
          localization.forgotPasswordError,
        'Unable to resend the OTP.' => localization.otpResendError,
        'This product is out of stock.' => localization.outOfStock,
        'Maximum available quantity already added.' =>
          localization.maxQuantityAdded,
        'Maximum available quantity reached.' =>
          localization.maxQuantityReached,
        _ => message,
      };
    }
    return switch (fallback) {
      'loadCategoriesError' => localization.loadCategoriesError,
      'loadProductsError' => localization.loadProductsError,
      'loginError' => localization.loginError,
      'registrationError' => localization.registrationError,
      'profileUpdateError' => localization.profileUpdateError,
      'forgotPasswordError' => localization.forgotPasswordError,
      'otpResendError' => localization.otpResendError,
      'noProducts' => localization.noProducts,
      'outOfStock' => localization.outOfStock,
      'maxQuantityAdded' => localization.maxQuantityAdded,
      'maxQuantityReached' => localization.maxQuantityReached,
      _ => fallback,
    };
  }
}
