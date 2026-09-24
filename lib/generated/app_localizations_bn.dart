// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get home => 'হোম';

  @override
  String get categories => 'ক্যাটাগরি';

  @override
  String get cart => 'কার্ট';

  @override
  String get wishlist => 'উইশলিস্ট';

  @override
  String get profile => 'প্রোফাইল';

  @override
  String get settings => 'সেটিংস';

  @override
  String get orders => 'অর্ডারসমূহ';

  @override
  String get logout => 'লগআউট';

  @override
  String get login => 'লগইন করুন';

  @override
  String get signup => 'সাইন আপ';

  @override
  String get retry => 'আবার চেষ্টা করুন';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String get noCategories => 'কোনো ক্যাটাগরি পাওয়া যায়নি';

  @override
  String get noProducts => 'কোনো পণ্য পাওয়া যায়নি';

  @override
  String get emptyCart => 'আপনার কার্ট খালি';

  @override
  String get emptyWishlist => 'আপনার উইশলিস্ট এখনো খালি।';

  @override
  String get continueShopping => 'কেনাকাটা চালিয়ে যান';

  @override
  String get allProducts => 'সব পণ্য';

  @override
  String get seeAll => 'সব দেখুন';

  @override
  String get searchProducts => 'পণ্য খুঁজুন...';

  @override
  String get clearSearch => 'সার্চ মুছুন';

  @override
  String get popularSearches => 'জনপ্রিয় সার্চ';

  @override
  String get noProductsFound => 'কোনো পণ্য পাওয়া যায়নি';

  @override
  String get productDetails => 'পণ্যের বিবরণ';

  @override
  String get category => 'ক্যাটাগরি';

  @override
  String get brand => 'ব্র্যান্ড';

  @override
  String get viewCart => 'কার্ট দেখুন';

  @override
  String get addToCart => 'কার্টে যোগ করুন';

  @override
  String quantity(int count) {
    return 'পরিমাণ: $count';
  }

  @override
  String get subtotal => 'উপমোট';

  @override
  String get total => 'মোট';

  @override
  String get checkout => 'চেকআউট';

  @override
  String get orderSummary => 'অর্ডারের সারাংশ';

  @override
  String get placeOrderUnavailable => 'অর্ডার করা যাচ্ছে না';

  @override
  String get checkoutUnavailable =>
      'অনলাইন চেকআউট এখনো পেমেন্ট বা অর্ডার API-এর সাথে সংযুক্ত নয়।';

  @override
  String get notifications => 'নোটিফিকেশন';

  @override
  String get noNotifications => 'আপনার জন্য এখনো কোনো নতুন নোটিফিকেশন নেই।';

  @override
  String get account => 'অ্যাকাউন্ট';

  @override
  String get preferences => 'পছন্দসমূহ';

  @override
  String get supportLegal => 'সহায়তা ও আইনগত তথ্য';

  @override
  String get trackOrders => 'আপনার অর্ডার দেখুন ও ট্র্যাক করুন';

  @override
  String get savedItems => 'আপনার সংরক্ষিত পণ্য';

  @override
  String get manageAddresses => 'ডেলিভারি ঠিকানা পরিচালনা করুন';

  @override
  String get manageAlerts => 'পুশ অ্যালার্ট পরিচালনা করুন';

  @override
  String get themePreferences => 'অ্যাপের থিম ও পছন্দসমূহ';

  @override
  String get faqsSupport => 'প্রশ্নোত্তর ও সহায়তা';

  @override
  String get appDetails => 'অ্যাপের সংস্করণ ও তথ্য';

  @override
  String get helpSupport => 'সহায়তা ও সাপোর্ট';

  @override
  String get about => 'CraftyBay সম্পর্কে';

  @override
  String get savedAddresses => 'সংরক্ষিত ঠিকানা';

  @override
  String get welcome => 'CraftyBay-এ স্বাগতম';

  @override
  String get signInFeatures =>
      'সব সুবিধা উপভোগ করতে, অর্ডার ট্র্যাক করতে ও উইশলিস্ট পরিচালনা করতে লগইন করুন।';

  @override
  String get edit => 'সম্পাদনা';

  @override
  String get cancel => 'বাতিল';

  @override
  String get signInRequired => 'লগইন প্রয়োজন';

  @override
  String pleaseSignIn(String action) {
    return 'এই কাজটি করতে আপনার অ্যাকাউন্টে লগইন করুন: $action।';
  }

  @override
  String get logoutConfirm =>
      'আপনি কি নিশ্চিত যে অ্যাকাউন্ট থেকে লগআউট করতে চান?';

  @override
  String get loggedOut => 'সফলভাবে লগআউট হয়েছে';

  @override
  String get darkMode => 'ডার্ক মোড';

  @override
  String get lightMode => 'লাইট মোড';

  @override
  String get systemDefault => 'সিস্টেম ডিফল্ট';

  @override
  String get light => 'লাইট';

  @override
  String get dark => 'ডার্ক';

  @override
  String get system => 'সিস্টেম';

  @override
  String get themeMode => 'থিম মোড';

  @override
  String get pushNotifications => 'পুশ নোটিফিকেশন';

  @override
  String get language => 'ভাষা';

  @override
  String get callUs => 'ফোন করুন';

  @override
  String get emailSupport => 'ইমেইল সাপোর্ট';

  @override
  String get liveChat => 'লাইভ চ্যাট';

  @override
  String get customerSupport => 'কাস্টমার সাপোর্ট';

  @override
  String get supportDescription =>
      'আমরা ২৪/৭ আপনাকে সহায়তা করতে প্রস্তুত। নিচের যেকোনো মাধ্যমে যোগাযোগ করুন।';

  @override
  String get calling => '+৮৮০ ১৭০০-০০০০০০ নম্বরে কল করা হচ্ছে...';

  @override
  String get openingEmail => 'ইমেইল সাপোর্ট খোলা হচ্ছে...';

  @override
  String get connectingChat => 'লাইভ চ্যাটে সংযোগ করা হচ্ছে...';

  @override
  String get noOrders => 'এখনো কোনো অর্ডার করা হয়নি';

  @override
  String get orderHistory => 'আপনার অর্ডারের ইতিহাস এখানে দেখা যাবে।';

  @override
  String get startShopping => 'কেনাকাটা শুরু করুন';

  @override
  String get homeAddress => 'বাসার ঠিকানা';

  @override
  String get workAddress => 'অফিসের ঠিকানা';

  @override
  String get addAddress => 'নতুন ঠিকানা যোগ করুন';

  @override
  String get addressSoon => 'ঠিকানা যোগ করার সুবিধা শিগগিরই আসছে!';

  @override
  String get editProfile => 'প্রোফাইল সম্পাদনা';

  @override
  String get fullName => 'পুরো নাম';

  @override
  String get emailAddress => 'ইমেইল ঠিকানা (শুধু দেখা যাবে)';

  @override
  String get phoneNumber => 'ফোন নম্বর';

  @override
  String get saveChanges => 'পরিবর্তন সংরক্ষণ করুন';

  @override
  String get profileUpdated => 'প্রোফাইল সফলভাবে আপডেট হয়েছে!';

  @override
  String get loginError => 'লগইন ব্যর্থ। তথ্য যাচাই করুন।';

  @override
  String get registrationError => 'রেজিস্ট্রেশন ব্যর্থ। আবার চেষ্টা করুন।';

  @override
  String get profileUpdateError => 'প্রোফাইল আপডেট করা যায়নি।';

  @override
  String get loadCategoriesError => 'ক্যাটাগরি লোড করা যায়নি।';

  @override
  String get loadProductsError => 'পণ্য লোড করা যায়নি।';

  @override
  String get forgotPassword => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get forgotPasswordBody =>
      'পাসওয়ার্ড পুনরুদ্ধারের নির্দেশনা পেতে আপনার নিবন্ধিত ইমেইল দিন।';

  @override
  String get sendResetInstructions => 'রিসেট নির্দেশনা পাঠান';

  @override
  String get forgotPasswordSuccess =>
      'রিসেট নির্দেশনা পাঠানো হয়েছে। আপনার ইমেইল দেখুন।';

  @override
  String get forgotPasswordError =>
      'রিসেট নির্দেশনা পাঠানো যায়নি। আবার চেষ্টা করুন।';

  @override
  String otpSentTo(String email) {
    return '$email-এ ৪ সংখ্যার OTP পাঠানো হয়েছে';
  }

  @override
  String get otpSentToEmail => 'আপনার ইমেইলে ৪ সংখ্যার OTP পাঠানো হয়েছে।';

  @override
  String get resendOtp => 'আবার পাঠান';

  @override
  String get otpResent => 'নতুন OTP পাঠানো হয়েছে।';

  @override
  String get otpResendError => 'OTP আবার পাঠানো যায়নি। আবার চেষ্টা করুন।';

  @override
  String get back => 'পেছনে';

  @override
  String get continueAction => 'এগিয়ে যান';

  @override
  String get createAccount => 'অ্যাকাউন্ট তৈরি করুন';

  @override
  String get createAccountSubtitle =>
      'কেনাকাটা শুরু করতে আপনার অ্যাকাউন্ট তৈরি করুন';

  @override
  String get firstNameExample => 'জুয়েল';

  @override
  String get enterPhone => 'আপনার ফোন নম্বর লিখুন';

  @override
  String get validPhone => 'সঠিক বাংলাদেশি ফোন নম্বর লিখুন';

  @override
  String get passwordMinLength => 'পাসওয়ার্ড কমপক্ষে ৬ অক্ষরের হতে হবে';

  @override
  String get showPassword => 'পাসওয়ার্ড দেখুন';

  @override
  String get hidePassword => 'পাসওয়ার্ড লুকান';

  @override
  String get haveAccountLogin => 'আগেই অ্যাকাউন্ট আছে? লগইন করুন';

  @override
  String get close => 'বন্ধ করুন';

  @override
  String get welcomeBack => 'আবারও স্বাগতম';

  @override
  String get loginSubtitle => 'লগইন করতে ইমেইল ও পাসওয়ার্ড দিন';

  @override
  String get email => 'ইমেইল';

  @override
  String get password => 'পাসওয়ার্ড';

  @override
  String get enterPassword => 'আপনার পাসওয়ার্ড দিন';

  @override
  String get forgotPasswordQuestion => 'পাসওয়ার্ড ভুলে গেছেন?';

  @override
  String get otherSignIn => 'অন্যান্য লগইন অপশন';

  @override
  String get enterEmail => 'আপনার ইমেইল দিন';

  @override
  String get validEmail => 'সঠিক ইমেইল দিন';

  @override
  String get enterPasswordError => 'আপনার পাসওয়ার্ড দিন';

  @override
  String get googleSoon =>
      'Google Sign-In শিগগিরই আসছে। আপাতত ইমেইল ও পাসওয়ার্ড দিয়ে লগইন করুন।';

  @override
  String get emailNotFound => 'ইমেইল পাওয়া যায়নি। আবার সাইন আপ করুন।';

  @override
  String get validOtp => 'সঠিক ৪ সংখ্যার OTP দিন।';

  @override
  String get invalidOtp => 'OTP সঠিক নয়। আবার চেষ্টা করুন।';

  @override
  String get accountCreated =>
      'অ্যাকাউন্ট তৈরি হয়েছে! OTP দিয়ে ইমেইল যাচাই করুন।';

  @override
  String get profileTooltip => 'প্রোফাইল';

  @override
  String get supportTooltip => 'সাপোর্ট';

  @override
  String get notificationTooltip => 'নোটিফিকেশন';

  @override
  String get privacyPolicy => 'গোপনীয়তা নীতি';

  @override
  String noSearchMatch(String query) {
    return '\"$query\"-এর কোনো মিল পাওয়া যায়নি।\\\nঅন্য কোনো শব্দ দিয়ে চেষ্টা করুন।';
  }

  @override
  String searchResultCount(int count, String query) {
    return '\"$query\"-এর জন্য $countটি ফলাফল পাওয়া গেছে';
  }

  @override
  String get aboutDescription =>
      'সেরা পণ্য ও অফারের জন্য আপনার একমাত্র অনলাইন শপিং গন্তব্য।';

  @override
  String get rightsReserved => '© ২০২৫ CraftyBay Inc. সর্বস্বত্ব সংরক্ষিত।';

  @override
  String get haveAccount => 'আমার অ্যাকাউন্ট আছে';

  @override
  String get dontHaveAccount => 'আমার অ্যাকাউন্ট নেই';

  @override
  String get signInHere => 'এখানে লগইন করুন';

  @override
  String get signUpHere => 'এখানে সাইন আপ করুন';

  @override
  String get yourName => 'আপনার নাম';

  @override
  String get city => 'শহর';

  @override
  String get phone => 'ফোন';

  @override
  String get firstName => 'নামের প্রথম অংশ';

  @override
  String get lastName => 'নামের শেষ অংশ';

  @override
  String get confirmPassword => 'পাসওয়ার্ড নিশ্চিত করুন';

  @override
  String get verifyOtp => 'OTP যাচাই করুন';

  @override
  String get bangla => 'বাংলা';

  @override
  String get english => 'English';

  @override
  String get promotions => 'প্রমোশন এখানে দেখা যাবে';

  @override
  String get supportChatTeam => 'আমাদের সাপোর্ট টিমের সাথে সরাসরি চ্যাট করুন';

  @override
  String get supportChatAgent => 'আমাদের সাপোর্ট এজেন্টের সাথে চ্যাট করুন';

  @override
  String get trackOrderQuestion => 'আমি কীভাবে অর্ডার ট্র্যাক করব?';

  @override
  String get returnPolicyQuestion => 'রিটার্ন পলিসি কী?';

  @override
  String get promoCodeQuestion => 'আমি কীভাবে প্রোমো কোড ব্যবহার করব?';

  @override
  String quantityLabel(int count) {
    return 'পরিমাণ: $count';
  }

  @override
  String get available => 'পাওয়া যাচ্ছে';

  @override
  String get or => 'অথবা';

  @override
  String get userFallback => 'ব্যবহারকারী';

  @override
  String get noEmailAvailable => 'ইমেইল পাওয়া যায়নি';

  @override
  String get emailExample => 'email@example.com';

  @override
  String get genericEmailExample => 'example@gmail.com';

  @override
  String get phoneExample => '01X00000000';

  @override
  String get cityExample => 'dhaka,rangpur';

  @override
  String get mailExample => '@mail.com';

  @override
  String get passwordExample => '01000000000';

  @override
  String get nameExample => 'Md juwel';

  @override
  String get homeAddressValue => 'বাড়ি #১২, রোড #৪, ব্লক সি, ঢাকা, বাংলাদেশ';

  @override
  String get workAddressValue => 'লেভেল ৫, সফটওয়্যার টেকনোলজি পার্ক, ঢাকা';

  @override
  String get supportEmail => 'support@craftybay.com';

  @override
  String get supportPhone => '+৮৮০ ১৭০০-০০০০০০ (২৪/৭)';

  @override
  String get helpIntro => 'আজ আমরা কীভাবে আপনাকে সাহায্য করতে পারি?';

  @override
  String get faqTitle => 'সাধারণ জিজ্ঞাসা';

  @override
  String get trackOrderAnswer =>
      'প্রোফাইল -> আমার অর্ডারসমূহ-এ গিয়ে অর্ডার ট্র্যাক করতে পারবেন। এখানে আপনার সব কেনাকাটার লাইভ স্ট্যাটাস দেখা যাবে।';

  @override
  String get returnPolicyAnswer =>
      'যোগ্য সব পণ্যের জন্য আমরা ৭ দিনের সহজ রিটার্ন সুবিধা দিই। পণ্যটি অবশ্যই মূল অবস্থায় থাকতে হবে।';

  @override
  String get promoCodeAnswer =>
      'অর্ডার দেওয়ার আগে চেকআউট স্ক্রিনে প্রোমো কোড ব্যবহার করতে পারবেন।';

  @override
  String get welcomeTitle => 'CraftyBay-এ\nস্বাগতম';

  @override
  String get welcomeDescription =>
      'আপনার পছন্দের পণ্য খুঁজুন, সহজে কেনাকাটা করুন এবং এক জায়গা থেকে সবকিছু পরিচালনা করুন।';

  @override
  String get getStarted => 'শুরু করুন';

  @override
  String get welcomeTagline => 'আপনার প্রয়োজনীয় সবকিছু এক জায়গায়।';

  @override
  String get enterCityName => 'আপনার শহরের নাম লিখুন';

  @override
  String get enterCity => 'শহরের নাম লিখুন';

  @override
  String get correctName => 'সঠিক নাম লিখুন';

  @override
  String get personalNumber => 'আপনার ব্যক্তিগত নম্বর লিখুন';

  @override
  String get enterBdNumber => 'বাংলাদেশের সঠিক নম্বর লিখুন';

  @override
  String get createStrongPassword => 'শক্তিশালী পাসওয়ার্ড তৈরি করুন';

  @override
  String get confirmPasswordSubtitle => 'নিশ্চিত করতে পাসওয়ার্ড আবার লিখুন';

  @override
  String get enterFirstName => 'আপনার নামের প্রথম অংশ লিখুন';

  @override
  String get correctFirstName => 'সঠিক নামের প্রথম অংশ লিখুন';

  @override
  String get enterLastName => 'আপনার নামের শেষ অংশ লিখুন';

  @override
  String get correctLastName => 'সঠিক নামের শেষ অংশ লিখুন';

  @override
  String get lastNameExample => 'ইসলাম';

  @override
  String get productFallback => 'পণ্য';

  @override
  String get outOfStock => 'এই পণ্যটি স্টকে নেই।';

  @override
  String get maxQuantityAdded =>
      'সর্বোচ্চ পাওয়া যায় এমন পরিমাণ ইতোমধ্যে যোগ করা হয়েছে।';

  @override
  String get maxQuantityReached => 'সর্বোচ্চ পরিমাণে পৌঁছে গেছে।';

  @override
  String get pleaseEnterName => 'আপনার নাম লিখুন';

  @override
  String get otpVerificationError => 'OTP যাচাই ব্যর্থ হয়েছে।';

  @override
  String get chatTeam => 'আমাদের সাপোর্ট টিমের সাথে সরাসরি চ্যাট করুন';

  @override
  String appVersion(String version) {
    return 'ভার্সন $version';
  }

  @override
  String appVersionLabel(String version) {
    return 'CraftyBay v$version';
  }
}
