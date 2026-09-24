import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AppLanguage { bangla, english }

class AppLocalizations extends ChangeNotifier {
  static const _languageKey = 'appLanguage';
  AppLanguage _language = AppLanguage.english;
  static final fallback = AppLocalizations();

  AppLanguage get language => _language;
  bool get isBangla => _language == AppLanguage.bangla;
  String get languageName => isBangla ? 'বাংলা' : 'English';

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    _language = prefs.getString(_languageKey) == 'bn'
        ? AppLanguage.bangla
        : AppLanguage.english;
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage language) async {
    if (_language == language) return;
    _language = language;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language == AppLanguage.bangla ? 'bn' : 'en');
    notifyListeners();
  }

  String t(String key, {Map<String, Object> params = const {}}) {
    final value = (_translations[_language]?[key] ?? _translations[AppLanguage.english]![key] ?? key);
    return params.entries.fold(value, (text, entry) => text.replaceAll('{${entry.key}}', '${entry.value}'));
  }

  String error(String? message, {required String fallback}) {
    if (message == null || message.trim().isEmpty) return t(fallback);
    const known = {
      'Unable to load categories.': 'loadCategoriesError',
      'Unable to load products.': 'loadProductsError',
      'Login failed. Please check credentials.': 'loginError',
      'Registration failed. Please try again.': 'registrationError',
      'Failed to update profile.': 'profileUpdateError',
    };
    return t(known[message] ?? fallback);
  }

  static const _translations = <AppLanguage, Map<String, String>>{
    AppLanguage.english: {
      'home': 'Home', 'categories': 'Categories', 'cart': 'Cart', 'wishlist': 'Wishlist',
      'profile': 'Profile', 'settings': 'Settings', 'orders': 'My Orders', 'logout': 'Logout',
      'login': 'Sign In', 'signup': 'Sign Up', 'retry': 'Retry', 'loading': 'Loading...',
      'noCategories': 'No categories available', 'noProducts': 'No products available',
      'emptyCart': 'Your cart is empty', 'emptyWishlist': 'Your wishlist is empty.',
      'continueShopping': 'Continue shopping', 'allProducts': 'All Products', 'seeAll': 'See All',
      'searchProducts': 'Search products...', 'clearSearch': 'Clear Search',
      'popularSearches': 'Popular Searches', 'noProductsFound': 'No products found',
      'productDetails': 'Product Details', 'category': 'Category', 'brand': 'Brand',
      'viewCart': 'View Cart', 'addToCart': 'Add to Cart', 'quantity': 'Quantity: {count}',
      'subtotal': 'Subtotal', 'checkout': 'Checkout', 'orderSummary': 'Order Summary',
      'placeOrderUnavailable': 'Place order unavailable',
      'checkoutUnavailable': 'Online checkout is not connected to a payment or order API yet.',
      'notifications': 'Notifications', 'noNotifications': 'There are no new notifications for you.',
      'account': 'Account', 'preferences': 'Preferences', 'supportLegal': 'Support & Legal',
      'trackOrders': 'Track and view your orders', 'savedItems': 'Your saved items',
      'manageAddresses': 'Manage delivery addresses', 'manageAlerts': 'Manage push alerts',
      'themePreferences': 'App theme & preferences', 'faqsSupport': 'FAQs and contact support',
      'appDetails': 'App version & details', 'helpSupport': 'Help & Support',
      'about': 'About EasyEcommerce', 'savedAddresses': 'Saved Addresses',
      'welcome': 'Welcome to EasyEcommerce', 'signInFeatures': 'Sign in to enjoy all features, track your orders & manage wishlist.',
      'edit': 'Edit', 'cancel': 'Cancel', 'signInRequired': 'Sign In Required',
      'pleaseSignIn': 'Please sign in to your account to {action}.', 'logoutConfirm': 'Are you sure you want to log out of your account?',
      'loggedOut': 'Logged out successfully', 'darkMode': 'Dark Mode', 'lightMode': 'Light Mode',
      'systemDefault': 'System Default', 'light': 'Light', 'dark': 'Dark', 'system': 'System',
      'themeMode': 'Theme Mode', 'pushNotifications': 'Push Notifications', 'language': 'Language',
      'callUs': 'Call Us', 'emailSupport': 'Email Support', 'liveChat': 'Live Chat',
      'customerSupport': 'Customer Support', 'supportDescription': 'We are here to help you 24/7. Reach out to us via any of the channels below.',
      'calling': 'Calling +880 1700-000000...', 'openingEmail': 'Opening email support...',
      'connectingChat': 'Connecting to live chat...', 'noOrders': 'No orders placed yet',
      'orderHistory': 'Your order history will appear here.', 'startShopping': 'Start Shopping',
      'homeAddress': 'Home Address', 'workAddress': 'Work Address', 'addAddress': 'Add New Address',
      'addressSoon': 'Add Address feature coming soon!', 'editProfile': 'Edit Profile',
      'fullName': 'Full Name', 'emailAddress': 'Email Address (read-only)', 'phoneNumber': 'Phone Number',
      'saveChanges': 'Save Changes', 'profileUpdated': 'Profile updated successfully!',
      'loginError': 'Login failed. Please check credentials.', 'registrationError': 'Registration failed. Please try again.',
      'profileUpdateError': 'Failed to update profile.', 'loadCategoriesError': 'Unable to load categories.',
      'loadProductsError': 'Unable to load products.', 'forgotPassword': 'Forgot Password',
      'forgotPasswordBody': 'Please enter your registered email address to receive password reset instructions.',
      'close': 'Close', 'welcomeBack': 'Welcome Back', 'loginSubtitle': 'Enter your email & password to sign in',
      'email': 'Email', 'password': 'Password', 'enterPassword': 'Enter your password',
      'forgotPasswordQuestion': 'Forgot Password?', 'otherSignIn': 'Other Sign-in Options',
      'enterEmail': 'Please enter your email', 'validEmail': 'Please enter a valid email',
      'enterPasswordError': 'Please enter your password', 'googleSoon': 'Google Sign-In is coming soon. Please sign in with email and password.',
      'emailNotFound': 'Email not found. Please try signing up again.', 'validOtp': 'Please enter a valid 4-digit OTP code.',
      'invalidOtp': 'Invalid OTP code. Please try again.', 'accountCreated': 'Account created! Please verify your email with the OTP.',
      'profileTooltip': 'Profile', 'supportTooltip': 'Support', 'notificationTooltip': 'Notifications',
      'privacyPolicy': 'Privacy Policy',
      'noSearchMatch': 'We could not find a match for "{query}".\\nTry another keyword.',
      'searchResultCount': 'Found {count} result(s) for "{query}"',
      'aboutDescription': 'Your ultimate one-stop shopping destination for the best products and deals.',
      'rightsReserved': '© 2025 EasyEcommerce Inc. All rights reserved.',
      'haveAccount': 'I have an account', 'dontHaveAccount': "Don't have an account", 'signInHere': 'Sign in here', 'signUpHere': 'Sign up here',
      'yourName': 'Your Name', 'city': 'City', 'phone': 'Phone', 'firstName': 'First Name',
      'lastName': 'Last Name', 'confirmPassword': 'Confirm Password', 'verifyOtp': 'Verify OTP',
    },
    AppLanguage.bangla: {
      'home': 'হোম', 'categories': 'ক্যাটাগরি', 'cart': 'কার্ট', 'wishlist': 'উইশলিস্ট',
      'profile': 'প্রোফাইল', 'settings': 'সেটিংস', 'orders': 'অর্ডারসমূহ', 'logout': 'লগআউট',
      'login': 'লগইন করুন', 'signup': 'সাইন আপ', 'retry': 'আবার চেষ্টা করুন', 'loading': 'লোড হচ্ছে...',
      'noCategories': 'কোনো ক্যাটাগরি পাওয়া যায়নি', 'noProducts': 'কোনো পণ্য পাওয়া যায়নি',
      'emptyCart': 'আপনার কার্ট খালি', 'emptyWishlist': 'আপনার উইশলিস্ট এখনো খালি।',
      'continueShopping': 'কেনাকাটা চালিয়ে যান', 'allProducts': 'সব পণ্য', 'seeAll': 'সব দেখুন',
      'searchProducts': 'পণ্য খুঁজুন...', 'clearSearch': 'সার্চ মুছুন',
      'popularSearches': 'জনপ্রিয় সার্চ', 'noProductsFound': 'কোনো পণ্য পাওয়া যায়নি',
      'productDetails': 'পণ্যের বিবরণ', 'category': 'ক্যাটাগরি', 'brand': 'ব্র্যান্ড',
      'viewCart': 'কার্ট দেখুন', 'addToCart': 'কার্টে যোগ করুন', 'quantity': 'পরিমাণ: {count}',
      'subtotal': 'উপমোট', 'checkout': 'চেকআউট', 'orderSummary': 'অর্ডারের সারাংশ',
      'placeOrderUnavailable': 'অর্ডার করা যাচ্ছে না',
      'checkoutUnavailable': 'অনলাইন চেকআউট এখনো পেমেন্ট বা অর্ডার API-এর সাথে সংযুক্ত নয়।',
      'notifications': 'নোটিফিকেশন', 'noNotifications': 'আপনার জন্য এখনো কোনো নতুন নোটিফিকেশন নেই।',
      'account': 'অ্যাকাউন্ট', 'preferences': 'পছন্দসমূহ', 'supportLegal': 'সহায়তা ও আইনগত তথ্য',
      'trackOrders': 'আপনার অর্ডার দেখুন ও ট্র্যাক করুন', 'savedItems': 'আপনার সংরক্ষিত পণ্য',
      'manageAddresses': 'ডেলিভারি ঠিকানা পরিচালনা করুন', 'manageAlerts': 'পুশ অ্যালার্ট পরিচালনা করুন',
      'themePreferences': 'অ্যাপের থিম ও পছন্দসমূহ', 'faqsSupport': 'প্রশ্নোত্তর ও সহায়তা',
      'appDetails': 'অ্যাপের সংস্করণ ও তথ্য', 'helpSupport': 'সহায়তা ও সাপোর্ট',
      'about': 'EasyEcommerce সম্পর্কে', 'savedAddresses': 'সংরক্ষিত ঠিকানা',
      'welcome': 'EasyEcommerce-এ স্বাগতম', 'signInFeatures': 'সব সুবিধা উপভোগ করতে, অর্ডার ট্র্যাক করতে ও উইশলিস্ট পরিচালনা করতে লগইন করুন।',
      'edit': 'সম্পাদনা', 'cancel': 'বাতিল', 'signInRequired': 'লগইন প্রয়োজন',
      'pleaseSignIn': 'এই কাজটি করতে আপনার অ্যাকাউন্টে লগইন করুন: {action}।', 'logoutConfirm': 'আপনি কি নিশ্চিত যে অ্যাকাউন্ট থেকে লগআউট করতে চান?',
      'loggedOut': 'সফলভাবে লগআউট হয়েছে', 'darkMode': 'ডার্ক মোড', 'lightMode': 'লাইট মোড',
      'systemDefault': 'সিস্টেম ডিফল্ট', 'light': 'লাইট', 'dark': 'ডার্ক', 'system': 'সিস্টেম',
      'themeMode': 'থিম মোড', 'pushNotifications': 'পুশ নোটিফিকেশন', 'language': 'ভাষা',
      'callUs': 'ফোন করুন', 'emailSupport': 'ইমেইল সাপোর্ট', 'liveChat': 'লাইভ চ্যাট',
      'customerSupport': 'কাস্টমার সাপোর্ট', 'supportDescription': 'আমরা ২৪/৭ আপনাকে সহায়তা করতে প্রস্তুত। নিচের যেকোনো মাধ্যমে যোগাযোগ করুন।',
      'calling': '+৮৮০ ১৭০০-০০০০০০ নম্বরে কল করা হচ্ছে...', 'openingEmail': 'ইমেইল সাপোর্ট খোলা হচ্ছে...',
      'connectingChat': 'লাইভ চ্যাটে সংযোগ করা হচ্ছে...', 'noOrders': 'এখনো কোনো অর্ডার করা হয়নি',
      'orderHistory': 'আপনার অর্ডারের ইতিহাস এখানে দেখা যাবে।', 'startShopping': 'কেনাকাটা শুরু করুন',
      'homeAddress': 'বাসার ঠিকানা', 'workAddress': 'অফিসের ঠিকানা', 'addAddress': 'নতুন ঠিকানা যোগ করুন',
      'addressSoon': 'ঠিকানা যোগ করার সুবিধা শিগগিরই আসছে!', 'editProfile': 'প্রোফাইল সম্পাদনা',
      'fullName': 'পুরো নাম', 'emailAddress': 'ইমেইল ঠিকানা (শুধু দেখা যাবে)', 'phoneNumber': 'ফোন নম্বর',
      'saveChanges': 'পরিবর্তন সংরক্ষণ করুন', 'profileUpdated': 'প্রোফাইল সফলভাবে আপডেট হয়েছে!',
      'loginError': 'লগইন ব্যর্থ। তথ্য যাচাই করুন।', 'registrationError': 'রেজিস্ট্রেশন ব্যর্থ। আবার চেষ্টা করুন।',
      'profileUpdateError': 'প্রোফাইল আপডেট করা যায়নি।', 'loadCategoriesError': 'ক্যাটাগরি লোড করা যায়নি।',
      'loadProductsError': 'পণ্য লোড করা যায়নি।', 'forgotPassword': 'পাসওয়ার্ড ভুলে গেছেন?',
      'forgotPasswordBody': 'পাসওয়ার্ড পুনরুদ্ধারের নির্দেশনা পেতে আপনার নিবন্ধিত ইমেইল দিন।',
      'close': 'বন্ধ করুন', 'welcomeBack': 'আবারও স্বাগতম', 'loginSubtitle': 'লগইন করতে ইমেইল ও পাসওয়ার্ড দিন',
      'email': 'ইমেইল', 'password': 'পাসওয়ার্ড', 'enterPassword': 'আপনার পাসওয়ার্ড দিন',
      'forgotPasswordQuestion': 'পাসওয়ার্ড ভুলে গেছেন?', 'otherSignIn': 'অন্যান্য লগইন অপশন',
      'enterEmail': 'আপনার ইমেইল দিন', 'validEmail': 'সঠিক ইমেইল দিন',
      'enterPasswordError': 'আপনার পাসওয়ার্ড দিন', 'googleSoon': 'Google Sign-In শিগগিরই আসছে। আপাতত ইমেইল ও পাসওয়ার্ড দিয়ে লগইন করুন।',
      'emailNotFound': 'ইমেইল পাওয়া যায়নি। আবার সাইন আপ করুন।', 'validOtp': 'সঠিক ৪ সংখ্যার OTP দিন।',
      'invalidOtp': 'OTP সঠিক নয়। আবার চেষ্টা করুন।', 'accountCreated': 'অ্যাকাউন্ট তৈরি হয়েছে! OTP দিয়ে ইমেইল যাচাই করুন।',
      'profileTooltip': 'প্রোফাইল', 'supportTooltip': 'সাপোর্ট', 'notificationTooltip': 'নোটিফিকেশন',
      'privacyPolicy': 'গোপনীয়তা নীতি',
      'noSearchMatch': '"{query}"-এর কোনো মিল পাওয়া যায়নি।\\nঅন্য কোনো শব্দ দিয়ে চেষ্টা করুন।',
      'searchResultCount': '"{query}"-এর জন্য {count}টি ফলাফল পাওয়া গেছে',
      'aboutDescription': 'সেরা পণ্য ও অফারের জন্য আপনার একমাত্র অনলাইন শপিং গন্তব্য।',
      'rightsReserved': '© ২০২৫ EasyEcommerce Inc. সর্বস্বত্ব সংরক্ষিত।',
      'haveAccount': 'আমার অ্যাকাউন্ট আছে', 'dontHaveAccount': 'আমার অ্যাকাউন্ট নেই', 'signInHere': 'এখানে লগইন করুন', 'signUpHere': 'এখানে সাইন আপ করুন',
      'yourName': 'আপনার নাম', 'city': 'শহর', 'phone': 'ফোন', 'firstName': 'নামের প্রথম অংশ',
      'lastName': 'নামের শেষ অংশ', 'confirmPassword': 'পাসওয়ার্ড নিশ্চিত করুন', 'verifyOtp': 'OTP যাচাই করুন',
    },
  };
}

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => watch<AppLocalizations?>() ?? AppLocalizations.fallback;
}
