import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('bn'),
  ];

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @wishlist.
  ///
  /// In en, this message translates to:
  /// **'Wishlist'**
  String get wishlist;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @orders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get orders;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get login;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signup;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @noCategories.
  ///
  /// In en, this message translates to:
  /// **'No categories available'**
  String get noCategories;

  /// No description provided for @noProducts.
  ///
  /// In en, this message translates to:
  /// **'No products available'**
  String get noProducts;

  /// No description provided for @emptyCart.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get emptyCart;

  /// No description provided for @emptyWishlist.
  ///
  /// In en, this message translates to:
  /// **'Your wishlist is empty.'**
  String get emptyWishlist;

  /// No description provided for @continueShopping.
  ///
  /// In en, this message translates to:
  /// **'Continue shopping'**
  String get continueShopping;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProducts;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// No description provided for @clearSearch.
  ///
  /// In en, this message translates to:
  /// **'Clear Search'**
  String get clearSearch;

  /// No description provided for @popularSearches.
  ///
  /// In en, this message translates to:
  /// **'Popular Searches'**
  String get popularSearches;

  /// No description provided for @noProductsFound.
  ///
  /// In en, this message translates to:
  /// **'No products found'**
  String get noProductsFound;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @brand.
  ///
  /// In en, this message translates to:
  /// **'Brand'**
  String get brand;

  /// No description provided for @viewCart.
  ///
  /// In en, this message translates to:
  /// **'View Cart'**
  String get viewCart;

  /// No description provided for @addToCart.
  ///
  /// In en, this message translates to:
  /// **'Add to Cart'**
  String get addToCart;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity: {count}'**
  String quantity(int count);

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @placeOrderUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Place order unavailable'**
  String get placeOrderUnavailable;

  /// No description provided for @checkoutUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Online checkout is not connected to a payment or order API yet.'**
  String get checkoutUnavailable;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'There are no new notifications for you.'**
  String get noNotifications;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @supportLegal.
  ///
  /// In en, this message translates to:
  /// **'Support & Legal'**
  String get supportLegal;

  /// No description provided for @trackOrders.
  ///
  /// In en, this message translates to:
  /// **'Track and view your orders'**
  String get trackOrders;

  /// No description provided for @savedItems.
  ///
  /// In en, this message translates to:
  /// **'Your saved items'**
  String get savedItems;

  /// No description provided for @manageAddresses.
  ///
  /// In en, this message translates to:
  /// **'Manage delivery addresses'**
  String get manageAddresses;

  /// No description provided for @manageAlerts.
  ///
  /// In en, this message translates to:
  /// **'Manage push alerts'**
  String get manageAlerts;

  /// No description provided for @themePreferences.
  ///
  /// In en, this message translates to:
  /// **'App theme & preferences'**
  String get themePreferences;

  /// No description provided for @faqsSupport.
  ///
  /// In en, this message translates to:
  /// **'FAQs and contact support'**
  String get faqsSupport;

  /// No description provided for @appDetails.
  ///
  /// In en, this message translates to:
  /// **'App version & details'**
  String get appDetails;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About EasyEcommerce'**
  String get about;

  /// No description provided for @savedAddresses.
  ///
  /// In en, this message translates to:
  /// **'Saved Addresses'**
  String get savedAddresses;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to EasyEcommerce'**
  String get welcome;

  /// No description provided for @signInFeatures.
  ///
  /// In en, this message translates to:
  /// **'Sign in to enjoy all features, track your orders & manage wishlist.'**
  String get signInFeatures;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @signInRequired.
  ///
  /// In en, this message translates to:
  /// **'Sign In Required'**
  String get signInRequired;

  /// No description provided for @pleaseSignIn.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to your account to {action}.'**
  String pleaseSignIn(String action);

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out of your account?'**
  String get logoutConfirm;

  /// No description provided for @loggedOut.
  ///
  /// In en, this message translates to:
  /// **'Logged out successfully'**
  String get loggedOut;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @themeMode.
  ///
  /// In en, this message translates to:
  /// **'Theme Mode'**
  String get themeMode;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @callUs.
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get callUs;

  /// No description provided for @emailSupport.
  ///
  /// In en, this message translates to:
  /// **'Email Support'**
  String get emailSupport;

  /// No description provided for @liveChat.
  ///
  /// In en, this message translates to:
  /// **'Live Chat'**
  String get liveChat;

  /// No description provided for @customerSupport.
  ///
  /// In en, this message translates to:
  /// **'Customer Support'**
  String get customerSupport;

  /// No description provided for @supportDescription.
  ///
  /// In en, this message translates to:
  /// **'We are here to help you 24/7. Reach out to us via any of the channels below.'**
  String get supportDescription;

  /// No description provided for @calling.
  ///
  /// In en, this message translates to:
  /// **'Calling +880 1700-000000...'**
  String get calling;

  /// No description provided for @openingEmail.
  ///
  /// In en, this message translates to:
  /// **'Opening email support...'**
  String get openingEmail;

  /// No description provided for @connectingChat.
  ///
  /// In en, this message translates to:
  /// **'Connecting to live chat...'**
  String get connectingChat;

  /// No description provided for @noOrders.
  ///
  /// In en, this message translates to:
  /// **'No orders placed yet'**
  String get noOrders;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Your order history will appear here.'**
  String get orderHistory;

  /// No description provided for @startShopping.
  ///
  /// In en, this message translates to:
  /// **'Start Shopping'**
  String get startShopping;

  /// No description provided for @homeAddress.
  ///
  /// In en, this message translates to:
  /// **'Home Address'**
  String get homeAddress;

  /// No description provided for @workAddress.
  ///
  /// In en, this message translates to:
  /// **'Work Address'**
  String get workAddress;

  /// No description provided for @addAddress.
  ///
  /// In en, this message translates to:
  /// **'Add New Address'**
  String get addAddress;

  /// No description provided for @addressSoon.
  ///
  /// In en, this message translates to:
  /// **'Add Address feature coming soon!'**
  String get addressSoon;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @emailAddress.
  ///
  /// In en, this message translates to:
  /// **'Email Address (read-only)'**
  String get emailAddress;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @profileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated successfully!'**
  String get profileUpdated;

  /// No description provided for @loginError.
  ///
  /// In en, this message translates to:
  /// **'Login failed. Please check credentials.'**
  String get loginError;

  /// No description provided for @registrationError.
  ///
  /// In en, this message translates to:
  /// **'Registration failed. Please try again.'**
  String get registrationError;

  /// No description provided for @profileUpdateError.
  ///
  /// In en, this message translates to:
  /// **'Failed to update profile.'**
  String get profileUpdateError;

  /// No description provided for @loadCategoriesError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load categories.'**
  String get loadCategoriesError;

  /// No description provided for @loadProductsError.
  ///
  /// In en, this message translates to:
  /// **'Unable to load products.'**
  String get loadProductsError;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordBody.
  ///
  /// In en, this message translates to:
  /// **'Please enter your registered email address to receive password reset instructions.'**
  String get forgotPasswordBody;

  /// No description provided for @sendResetInstructions.
  ///
  /// In en, this message translates to:
  /// **'Send reset instructions'**
  String get sendResetInstructions;

  /// No description provided for @forgotPasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reset instructions sent. Check your email.'**
  String get forgotPasswordSuccess;

  /// No description provided for @forgotPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Unable to send reset instructions. Please try again.'**
  String get forgotPasswordError;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit OTP code has been sent to {email}'**
  String otpSentTo(String email);

  /// No description provided for @otpSentToEmail.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit OTP code has been sent to your email.'**
  String get otpSentToEmail;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resendOtp;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email & password to sign in'**
  String get loginSubtitle;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @forgotPasswordQuestion.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPasswordQuestion;

  /// No description provided for @otherSignIn.
  ///
  /// In en, this message translates to:
  /// **'Other Sign-in Options'**
  String get otherSignIn;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter your email'**
  String get enterEmail;

  /// No description provided for @validEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get validEmail;

  /// No description provided for @enterPasswordError.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get enterPasswordError;

  /// No description provided for @googleSoon.
  ///
  /// In en, this message translates to:
  /// **'Google Sign-In is coming soon. Please sign in with email and password.'**
  String get googleSoon;

  /// No description provided for @emailNotFound.
  ///
  /// In en, this message translates to:
  /// **'Email not found. Please try signing up again.'**
  String get emailNotFound;

  /// No description provided for @validOtp.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid 4-digit OTP code.'**
  String get validOtp;

  /// No description provided for @invalidOtp.
  ///
  /// In en, this message translates to:
  /// **'Invalid OTP code. Please try again.'**
  String get invalidOtp;

  /// No description provided for @accountCreated.
  ///
  /// In en, this message translates to:
  /// **'Account created! Please verify your email with the OTP.'**
  String get accountCreated;

  /// No description provided for @profileTooltip.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileTooltip;

  /// No description provided for @supportTooltip.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get supportTooltip;

  /// No description provided for @notificationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notificationTooltip;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @noSearchMatch.
  ///
  /// In en, this message translates to:
  /// **'We could not find a match for \"{query}\".\\\nTry another keyword.'**
  String noSearchMatch(String query);

  /// No description provided for @searchResultCount.
  ///
  /// In en, this message translates to:
  /// **'Found {count} result(s) for \"{query}\"'**
  String searchResultCount(int count, String query);

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Your ultimate one-stop shopping destination for the best products and deals.'**
  String get aboutDescription;

  /// No description provided for @rightsReserved.
  ///
  /// In en, this message translates to:
  /// **'© 2025 EasyEcommerce Inc. All rights reserved.'**
  String get rightsReserved;

  /// No description provided for @haveAccount.
  ///
  /// In en, this message translates to:
  /// **'I have an account'**
  String get haveAccount;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account'**
  String get dontHaveAccount;

  /// No description provided for @signInHere.
  ///
  /// In en, this message translates to:
  /// **'Sign in here'**
  String get signInHere;

  /// No description provided for @signUpHere.
  ///
  /// In en, this message translates to:
  /// **'Sign up here'**
  String get signUpHere;

  /// No description provided for @yourName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get yourName;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @bangla.
  ///
  /// In en, this message translates to:
  /// **'Bangla'**
  String get bangla;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @promotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions will appear here'**
  String get promotions;

  /// No description provided for @supportChatTeam.
  ///
  /// In en, this message translates to:
  /// **'Chat instantly with our support team'**
  String get supportChatTeam;

  /// No description provided for @supportChatAgent.
  ///
  /// In en, this message translates to:
  /// **'Chat with our support agent'**
  String get supportChatAgent;

  /// No description provided for @trackOrderQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do I track my order?'**
  String get trackOrderQuestion;

  /// No description provided for @returnPolicyQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is the return policy?'**
  String get returnPolicyQuestion;

  /// No description provided for @promoCodeQuestion.
  ///
  /// In en, this message translates to:
  /// **'How do I apply a promo code?'**
  String get promoCodeQuestion;

  /// No description provided for @quantityLabel.
  ///
  /// In en, this message translates to:
  /// **'Quantity: {count}'**
  String quantityLabel(int count);

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get or;

  /// No description provided for @userFallback.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get userFallback;

  /// No description provided for @noEmailAvailable.
  ///
  /// In en, this message translates to:
  /// **'No email available'**
  String get noEmailAvailable;

  /// No description provided for @emailExample.
  ///
  /// In en, this message translates to:
  /// **'email@example.com'**
  String get emailExample;

  /// No description provided for @genericEmailExample.
  ///
  /// In en, this message translates to:
  /// **'example@gmail.com'**
  String get genericEmailExample;

  /// No description provided for @phoneExample.
  ///
  /// In en, this message translates to:
  /// **'01X00000000'**
  String get phoneExample;

  /// No description provided for @cityExample.
  ///
  /// In en, this message translates to:
  /// **'dhaka,rangpur'**
  String get cityExample;

  /// No description provided for @mailExample.
  ///
  /// In en, this message translates to:
  /// **'@mail.com'**
  String get mailExample;

  /// No description provided for @passwordExample.
  ///
  /// In en, this message translates to:
  /// **'01000000000'**
  String get passwordExample;

  /// No description provided for @nameExample.
  ///
  /// In en, this message translates to:
  /// **'Md juwel'**
  String get nameExample;

  /// No description provided for @homeAddressValue.
  ///
  /// In en, this message translates to:
  /// **'House #12, Road #4, Block C, Dhaka, Bangladesh'**
  String get homeAddressValue;

  /// No description provided for @workAddressValue.
  ///
  /// In en, this message translates to:
  /// **'Level 5, Software Technology Park, Dhaka'**
  String get workAddressValue;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'support@easyecommerce.com'**
  String get supportEmail;

  /// No description provided for @supportPhone.
  ///
  /// In en, this message translates to:
  /// **'+880 1700-000000 (24/7)'**
  String get supportPhone;

  /// No description provided for @helpIntro.
  ///
  /// In en, this message translates to:
  /// **'How can we help you today?'**
  String get helpIntro;

  /// No description provided for @faqTitle.
  ///
  /// In en, this message translates to:
  /// **'Frequently Asked Questions'**
  String get faqTitle;

  /// No description provided for @trackOrderAnswer.
  ///
  /// In en, this message translates to:
  /// **'You can track your orders by going to Profile -> My Orders. Here you will find live status updates for all your purchases.'**
  String get trackOrderAnswer;

  /// No description provided for @returnPolicyAnswer.
  ///
  /// In en, this message translates to:
  /// **'We offer a 7-day easy return policy for all eligible products. Items must be in their original condition.'**
  String get returnPolicyAnswer;

  /// No description provided for @promoCodeAnswer.
  ///
  /// In en, this message translates to:
  /// **'You can apply promo codes on the Checkout screen before placing your order.'**
  String get promoCodeAnswer;

  /// No description provided for @welcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to\nEasyEcommerce'**
  String get welcomeTitle;

  /// No description provided for @welcomeDescription.
  ///
  /// In en, this message translates to:
  /// **'Discover products you love, shop easily, and manage everything from one place.'**
  String get welcomeDescription;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @welcomeTagline.
  ///
  /// In en, this message translates to:
  /// **'Everything you need, all in one place.'**
  String get welcomeTagline;

  /// No description provided for @enterCityName.
  ///
  /// In en, this message translates to:
  /// **'Enter your city name'**
  String get enterCityName;

  /// No description provided for @enterCity.
  ///
  /// In en, this message translates to:
  /// **'enter city'**
  String get enterCity;

  /// No description provided for @correctName.
  ///
  /// In en, this message translates to:
  /// **'correct name'**
  String get correctName;

  /// No description provided for @personalNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter your personal number'**
  String get personalNumber;

  /// No description provided for @enterBdNumber.
  ///
  /// In en, this message translates to:
  /// **'enter BD number'**
  String get enterBdNumber;

  /// No description provided for @createStrongPassword.
  ///
  /// In en, this message translates to:
  /// **'Create strong password'**
  String get createStrongPassword;

  /// No description provided for @confirmPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password to confirm'**
  String get confirmPasswordSubtitle;

  /// No description provided for @enterFirstName.
  ///
  /// In en, this message translates to:
  /// **'enter your first name'**
  String get enterFirstName;

  /// No description provided for @correctFirstName.
  ///
  /// In en, this message translates to:
  /// **'enter your correct first name'**
  String get correctFirstName;

  /// No description provided for @enterLastName.
  ///
  /// In en, this message translates to:
  /// **'enter your last name'**
  String get enterLastName;

  /// No description provided for @correctLastName.
  ///
  /// In en, this message translates to:
  /// **'enter your correct last name'**
  String get correctLastName;

  /// No description provided for @lastNameExample.
  ///
  /// In en, this message translates to:
  /// **'islam,mia,roy etc'**
  String get lastNameExample;

  /// No description provided for @productFallback.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get productFallback;

  /// No description provided for @outOfStock.
  ///
  /// In en, this message translates to:
  /// **'This product is out of stock.'**
  String get outOfStock;

  /// No description provided for @maxQuantityAdded.
  ///
  /// In en, this message translates to:
  /// **'Maximum available quantity already added.'**
  String get maxQuantityAdded;

  /// No description provided for @maxQuantityReached.
  ///
  /// In en, this message translates to:
  /// **'Maximum available quantity reached.'**
  String get maxQuantityReached;

  /// No description provided for @pleaseEnterName.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseEnterName;

  /// No description provided for @otpVerificationError.
  ///
  /// In en, this message translates to:
  /// **'OTP verification failed.'**
  String get otpVerificationError;

  /// No description provided for @chatTeam.
  ///
  /// In en, this message translates to:
  /// **'Chat instantly with our support team'**
  String get chatTeam;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
