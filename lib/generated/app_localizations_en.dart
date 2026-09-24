// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get categories => 'Categories';

  @override
  String get cart => 'Cart';

  @override
  String get wishlist => 'Wishlist';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get orders => 'My Orders';

  @override
  String get logout => 'Logout';

  @override
  String get login => 'Sign In';

  @override
  String get signup => 'Sign Up';

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading...';

  @override
  String get noCategories => 'No categories available';

  @override
  String get noProducts => 'No products available';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get emptyWishlist => 'Your wishlist is empty.';

  @override
  String get continueShopping => 'Continue shopping';

  @override
  String get allProducts => 'All Products';

  @override
  String get seeAll => 'See All';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get clearSearch => 'Clear Search';

  @override
  String get popularSearches => 'Popular Searches';

  @override
  String get noProductsFound => 'No products found';

  @override
  String get productDetails => 'Product Details';

  @override
  String get category => 'Category';

  @override
  String get brand => 'Brand';

  @override
  String get viewCart => 'View Cart';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String quantity(int count) {
    return 'Quantity: $count';
  }

  @override
  String get subtotal => 'Subtotal';

  @override
  String get checkout => 'Checkout';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get placeOrderUnavailable => 'Place order unavailable';

  @override
  String get checkoutUnavailable =>
      'Online checkout is not connected to a payment or order API yet.';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'There are no new notifications for you.';

  @override
  String get account => 'Account';

  @override
  String get preferences => 'Preferences';

  @override
  String get supportLegal => 'Support & Legal';

  @override
  String get trackOrders => 'Track and view your orders';

  @override
  String get savedItems => 'Your saved items';

  @override
  String get manageAddresses => 'Manage delivery addresses';

  @override
  String get manageAlerts => 'Manage push alerts';

  @override
  String get themePreferences => 'App theme & preferences';

  @override
  String get faqsSupport => 'FAQs and contact support';

  @override
  String get appDetails => 'App version & details';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get about => 'About EasyEcommerce';

  @override
  String get savedAddresses => 'Saved Addresses';

  @override
  String get welcome => 'Welcome to EasyEcommerce';

  @override
  String get signInFeatures =>
      'Sign in to enjoy all features, track your orders & manage wishlist.';

  @override
  String get edit => 'Edit';

  @override
  String get cancel => 'Cancel';

  @override
  String get signInRequired => 'Sign In Required';

  @override
  String pleaseSignIn(String action) {
    return 'Please sign in to your account to $action.';
  }

  @override
  String get logoutConfirm =>
      'Are you sure you want to log out of your account?';

  @override
  String get loggedOut => 'Logged out successfully';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get systemDefault => 'System Default';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get themeMode => 'Theme Mode';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get language => 'Language';

  @override
  String get callUs => 'Call Us';

  @override
  String get emailSupport => 'Email Support';

  @override
  String get liveChat => 'Live Chat';

  @override
  String get customerSupport => 'Customer Support';

  @override
  String get supportDescription =>
      'We are here to help you 24/7. Reach out to us via any of the channels below.';

  @override
  String get calling => 'Calling +880 1700-000000...';

  @override
  String get openingEmail => 'Opening email support...';

  @override
  String get connectingChat => 'Connecting to live chat...';

  @override
  String get noOrders => 'No orders placed yet';

  @override
  String get orderHistory => 'Your order history will appear here.';

  @override
  String get startShopping => 'Start Shopping';

  @override
  String get homeAddress => 'Home Address';

  @override
  String get workAddress => 'Work Address';

  @override
  String get addAddress => 'Add New Address';

  @override
  String get addressSoon => 'Add Address feature coming soon!';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get fullName => 'Full Name';

  @override
  String get emailAddress => 'Email Address (read-only)';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get profileUpdated => 'Profile updated successfully!';

  @override
  String get loginError => 'Login failed. Please check credentials.';

  @override
  String get registrationError => 'Registration failed. Please try again.';

  @override
  String get profileUpdateError => 'Failed to update profile.';

  @override
  String get loadCategoriesError => 'Unable to load categories.';

  @override
  String get loadProductsError => 'Unable to load products.';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get forgotPasswordBody =>
      'Please enter your registered email address to receive password reset instructions.';

  @override
  String get close => 'Close';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get loginSubtitle => 'Enter your email & password to sign in';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get forgotPasswordQuestion => 'Forgot Password?';

  @override
  String get otherSignIn => 'Other Sign-in Options';

  @override
  String get enterEmail => 'Please enter your email';

  @override
  String get validEmail => 'Please enter a valid email';

  @override
  String get enterPasswordError => 'Please enter your password';

  @override
  String get googleSoon =>
      'Google Sign-In is coming soon. Please sign in with email and password.';

  @override
  String get emailNotFound => 'Email not found. Please try signing up again.';

  @override
  String get validOtp => 'Please enter a valid 4-digit OTP code.';

  @override
  String get invalidOtp => 'Invalid OTP code. Please try again.';

  @override
  String get accountCreated =>
      'Account created! Please verify your email with the OTP.';

  @override
  String get profileTooltip => 'Profile';

  @override
  String get supportTooltip => 'Support';

  @override
  String get notificationTooltip => 'Notifications';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String noSearchMatch(String query) {
    return 'We could not find a match for \"$query\".\\\nTry another keyword.';
  }

  @override
  String searchResultCount(int count, String query) {
    return 'Found $count result(s) for \"$query\"';
  }

  @override
  String get aboutDescription =>
      'Your ultimate one-stop shopping destination for the best products and deals.';

  @override
  String get rightsReserved => '© 2025 EasyEcommerce Inc. All rights reserved.';

  @override
  String get haveAccount => 'I have an account';

  @override
  String get dontHaveAccount => 'Don\'t have an account';

  @override
  String get signInHere => 'Sign in here';

  @override
  String get signUpHere => 'Sign up here';

  @override
  String get yourName => 'Your Name';

  @override
  String get city => 'City';

  @override
  String get phone => 'Phone';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get bangla => 'Bangla';

  @override
  String get english => 'English';

  @override
  String get promotions => 'Promotions will appear here';

  @override
  String get supportChatTeam => 'Chat instantly with our support team';

  @override
  String get supportChatAgent => 'Chat with our support agent';

  @override
  String get trackOrderQuestion => 'How do I track my order?';

  @override
  String get returnPolicyQuestion => 'What is the return policy?';

  @override
  String get promoCodeQuestion => 'How do I apply a promo code?';

  @override
  String quantityLabel(int count) {
    return 'Quantity: $count';
  }

  @override
  String get available => 'Available';

  @override
  String get or => 'or';

  @override
  String get userFallback => 'User';

  @override
  String get noEmailAvailable => 'No email available';

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
  String get homeAddressValue =>
      'House #12, Road #4, Block C, Dhaka, Bangladesh';

  @override
  String get workAddressValue => 'Level 5, Software Technology Park, Dhaka';

  @override
  String get supportEmail => 'support@easyecommerce.com';

  @override
  String get supportPhone => '+880 1700-000000 (24/7)';

  @override
  String get helpIntro => 'How can we help you today?';

  @override
  String get faqTitle => 'Frequently Asked Questions';

  @override
  String get trackOrderAnswer =>
      'You can track your orders by going to Profile -> My Orders. Here you will find live status updates for all your purchases.';

  @override
  String get returnPolicyAnswer =>
      'We offer a 7-day easy return policy for all eligible products. Items must be in their original condition.';

  @override
  String get promoCodeAnswer =>
      'You can apply promo codes on the Checkout screen before placing your order.';

  @override
  String get welcomeTitle => 'Welcome to\nEasyEcommerce';

  @override
  String get welcomeDescription =>
      'Discover products you love, shop easily, and manage everything from one place.';

  @override
  String get getStarted => 'Get Started';

  @override
  String get welcomeTagline => 'Everything you need, all in one place.';

  @override
  String get enterCityName => 'Enter your city name';

  @override
  String get enterCity => 'enter city';

  @override
  String get correctName => 'correct name';

  @override
  String get personalNumber => 'Enter your personal number';

  @override
  String get enterBdNumber => 'enter BD number';

  @override
  String get createStrongPassword => 'Create strong password';

  @override
  String get confirmPasswordSubtitle => 'Re-enter your password to confirm';

  @override
  String get enterFirstName => 'enter your first name';

  @override
  String get correctFirstName => 'enter your correct first name';

  @override
  String get enterLastName => 'enter your last name';

  @override
  String get correctLastName => 'enter your correct last name';

  @override
  String get lastNameExample => 'islam,mia,roy etc';

  @override
  String get productFallback => 'Product';

  @override
  String get outOfStock => 'This product is out of stock.';

  @override
  String get maxQuantityAdded => 'Maximum available quantity already added.';

  @override
  String get maxQuantityReached => 'Maximum available quantity reached.';

  @override
  String get pleaseEnterName => 'Please enter your name';

  @override
  String get otpVerificationError => 'OTP verification failed.';

  @override
  String get chatTeam => 'Chat instantly with our support team';
}
