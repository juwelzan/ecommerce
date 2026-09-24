# CraftyBay

> CraftyBay is a Flutter-based e-commerce mobile application that provides a smooth shopping experience with product discovery, category browsing, cart management, wishlist, authentication, OTP verification, Bangla/English localization, dark mode, and a clean mobile-first interface.

---

## Project Status

**Status:** In development (MVP stage)

**Platforms:** Android, iOS

The core shopping flow (browse, search, product details, cart, checkout UI) and authentication (login, signup, OTP, forgot password) are implemented. Checkout payment integration, order placement, and push notifications are not yet connected to a backend.

---

## Features

- Splash screen with initial data loading
- Welcome / onboarding screen
- Home screen with ad banners, categories, and product sections
- Category browsing and category-filtered product listing
- Product search with live filtering
- Product details with quantity management
- Shopping cart with subtotal calculation and stock validation
- Wishlist with add/remove toggle
- Checkout screen (UI — payment not yet integrated)
- Authentication: Login, Sign Up, OTP verification, Forgot Password
- Profile, Edit Profile, Orders, Address, Settings, Help & Support, About
- Notifications screen
- Bangla and English localization with persistent preference
- Light / Dark / System theme mode
- Bottom navigation with Home, Categories, Cart, Wishlist
- Customer support bottom sheet (call, email, chat)

---

## Screens / User Flow

```text
Splash
  ↓
Welcome
  ↓
Home ─────────────────────────────────────────────┐
  ├→ Categories → Category Products               │
  ├→ Search                                       │
  ├→ Product Details → Cart / Wishlist            │
  ├→ Cart → Checkout                               │
  ├→ Profile → Edit Profile / Orders / Address    │
  │            / Settings / Help & Support / About │
  ├→ Settings → Theme / Language / Notifications   │
  └→ Login → LoginWithEmailPass → ForgotPassword   │
            Sign Up → OTP Verify → Home            │
```

---

## Screenshots

Screenshots will be added soon.

---

## Tech Stack

| Technology            | Usage                          |
| --------------------- | ------------------------------ |
| Flutter               | Cross-platform UI framework    |
| Dart                  | Application development        |
| Provider              | State management               |
| GoRouter              | Declarative routing            |
| GetIt                 | Dependency injection           |
| http                  | REST API communication         |
| SharedPreferences     | Local persistence (theme, locale, auth) |
| flutter_localizations | Localization framework         |
| intl                  | Internationalization           |
| Lottie                | Animations                     |
| flutter_svg           | SVG rendering                  |
| cached_network_image  | Remote image caching           |
| firebase_core         | Firebase initialization        |
| pinput                | OTP input UI                   |
| animate_do            | UI animations                  |

---

## Architecture

The project uses a **feature-based architecture** with a shared `core` layer and a centralized barrel export file (`paths.dart`). State management is handled with Provider (ChangeNotifier) and service injection via GetIt.

```text
lib/
├── main.dart                  # App entry, DI init, Provider setup
├── app_config.dart            # MaterialApp.router, theme/locale wiring
├── firebase_options.dart      # Firebase platform config
├── core/
│   ├── api_url/               # API endpoint constants (Urls)
│   ├── assets/                # Asset path constants (Asset)
│   ├── di/                    # GetIt dependency injection
│   ├── extensions/            # Dart/Flutter extensions
│   ├── keys/                  # SharedPreferences key constants
│   ├── localization/          # LocaleController + l10n context extension
│   ├── logger/               # Logger wrapper
│   ├── network/               # NetworkCaller (http client + response model)
│   ├── package/               # Internal packages (Gap, ScreenUtil)
│   ├── router/                # GoRouter route configuration
│   └── themes/                # AppTheme, AppColors, ThemeController
├── features/
│   ├── auth/                  # Login, Signup, OTP, Forgot Password
│   ├── cart_screen/           # Cart controller, UI, widgets
│   ├── category_screen/      # Category listing & filtered products
│   ├── checkout_screen/       # Checkout UI
│   ├── home_screen/           # Home, banners, product sections
│   ├── main_screen/           # Bottom nav host + navbar controller
│   ├── notification_screen/   # Notifications
│   ├── product_screen/       # Product listing & details
│   ├── profile_screen/       # Profile, Edit, Orders, Address, Settings, etc.
│   ├── review_screen/         # Product reviews
│   ├── search_screen/         # Search
│   ├── splash_screen/         # Splash + initial data load
│   └── welcome_screen/       # Welcome/onboarding
├── generated/                 # Generated AppLocalizations (en, bn)
├── l10n/                      # ARB source files (app_en.arb, app_bn.arb)
└── shared/
    ├── model/                 # ProductModel, CategoryModel
    ├── network_data/          # GetCategoriesData, GetProductData
    ├── path/paths.dart        # Barrel export for all shared imports
    └── widget/                # Reusable widgets (JumpingButton, ProductWidget, etc.)
```

**Layer responsibilities:**

- **`core/`** — Infrastructure: networking, routing, theming, localization, DI, logging. No feature-specific logic.
- **`features/`** — Self-contained feature modules, each with its own `ui/`, `provider/`, `model/`, and `widget/` subdirectories.
- **`shared/`** — Cross-feature models, data services, reusable widgets, and the barrel file (`paths.dart`) that re-exports the entire dependency graph.
- **`generated/`** — Auto-generated localization classes from ARB files. Do not edit manually.

---

## State Management

State is managed with **Provider** (`ChangeNotifier`) registered globally in `main.dart` via `MultiProvider`:

| Provider               | Responsibility                                       |
| ---------------------- | ---------------------------------------------------- |
| `ThemeController`      | Theme mode (light/dark/system) + persistence         |
| `LocaleController`     | App locale (en/bn) + persistence                     |
| `AuthController`       | Login, signup, OTP, forgot password, session, profile|
| `SplashProvider`       | Splash timer / navigation                            |
| `NavbarController`     | Bottom nav index, visibility, page stack            |
| `AdsBannerProvider`   | Banner auto-scroll / pause                           |
| `CartController`       | Cart items, quantities, subtotal, stock validation  |
| `WishlistController`  | Wishlist toggle / lookup                            |

Data services `GetCategoriesData` and `GetProductData` are registered as lazy singletons in GetIt and act as lightweight data sources for categories and products.

UI consumes state via `context.read<T>()` for actions and `context.watch<T>()` / `Consumer<T>` for reactive rebuilds.

---

## Localization

CraftyBay supports two locales:

- Bangla (`bn`)
- English (`en`)

**Implementation:**

- Source files: `lib/l10n/app_en.arb`, `lib/l10n/app_bn.arb`
- Generated classes: `lib/generated/app_localizations*.dart` (generated via `flutter gen-l10n`)
- Configuration: `l10n.yaml`
- Locale persistence: `SharedPreferences` key `appLocale`
- Controller: `LocaleController` (loads saved locale on startup, `setLocale()` to switch)
- Access in widgets: `context.l10n` (extension on `BuildContext`)
- Error message mapping: `context.localizedError(message, fallback)` maps server error strings to localized equivalents

---

## API / Backend

The app communicates with a REST API hosted on a remote server. All endpoints are defined in `lib/core/api_url/urls.dart` as static constants/methods.

**Network layer:**

- `NetworkCaller` — HTTP client wrapper supporting `GET`, `POST`, `PATCH`, `DELETE`
- Returns `NetworkResponse` with `isSuccess`, `statusCode`, `body`, `errorMessage`
- 30-second timeout, 401 unauthorized callback, debug logging
- Registered as a lazy singleton via GetIt

**Key endpoints:**

| Area        | Operations                                         |
| ----------- | -------------------------------------------------- |
| Auth        | Login, Signup, Verify OTP, Resend OTP, Profile, Update Profile, Forgot Password |
| Products    | List all, Get by ID, Create, Update, Delete        |
| Categories  | List all, Get by ID, Create, Update, Delete         |
| Cart        | List, Add, Update, Delete                           |
| Wishlist    | List, Add, Delete                                   |
| Orders      | List, Get by ID, Create, Cancel, Update, Delete     |
| Slides      | List (home banner carousel)                         |
| Reviews     | List by product, Create, Update, Delete             |

Authentication uses a token-based approach: the token is stored in `SharedPreferences` and sent via a `token` header on protected requests.

---

## Authentication Flow

1. **Login** — Email + password → token + user data stored locally
2. **Sign Up** — First name, last name, email, phone, password → account created → OTP screen
3. **OTP Verification** — 4-digit code → token issued, session established
4. **Forgot Password** — Email → reset instructions sent
5. **Session Restore** — On app start, stored token/user are loaded from `SharedPreferences`; profile is refreshed in the background
6. **Logout** — Clears token, user, and preferences

---

## Installation & Setup

```bash
git clone https://github.com/juwelzan/ecommerce.git

cd ecommerce

flutter pub get

flutter run
```

**Requirements:**

- Flutter SDK (Dart `^3.11.0`)
- A connected device or emulator

---

## Environment Configuration

The project uses Firebase (`firebase_core`). Firebase platform configuration is in `lib/firebase_options.dart` and `firebase.json`.

No `.env` file or API key configuration is required — the API base URL is defined in `lib/core/api_url/urls.dart`.

---

## Running the Project

```bash
# Install dependencies
flutter pub get

# Regenerate localization files (if ARB files are modified)
flutter gen-l10n

# Static analysis
flutter analyze

# Run the app
flutter run

# Run tests
flutter test
```

---

## Project Structure

```text
lib/
├── main.dart
├── app_config.dart
├── firebase_options.dart
├── core/
│   ├── api_url/
│   ├── assets/
│   ├── di/
│   ├── extensions/
│   ├── keys/
│   ├── localization/
│   ├── logger/
│   ├── network/
│   ├── package/
│   ├── router/
│   └── themes/
├── features/
│   ├── auth/
│   ├── cart_screen/
│   ├── category_screen/
│   ├── checkout_screen/
│   ├── home_screen/
│   ├── main_screen/
│   ├── notification_screen/
│   ├── product_screen/
│   ├── profile_screen/
│   ├── review_screen/
│   ├── search_screen/
│   ├── splash_screen/
│   └── welcome_screen/
├── generated/
├── l10n/
└── shared/
    ├── model/
    ├── network_data/
    ├── path/
    └── widget/
```

---

## Code Quality

- Feature-based modular organization
- Centralized barrel export (`paths.dart`) reducing import boilerplate
- Reusable shared widgets (JumpingButton, ProductWidget, AuthWidget, IncrementButton)
- Typed models with `fromJson` / `toJson` / `copyWith`
- Typed route names as static constants
- Full localization with no hardcoded UI strings
- Error-to-localization mapping for server messages
- Loading states, empty states, and stock validation in cart
- Responsive sizing via a custom ScreenUtil extension

---

## Testing

The project includes unit tests in the `test/` directory:

| Test File                    | Coverage Area            |
| ---------------------------- | ----------------------- |
| `auth_controller_test.dart`  | AuthController login/signup/OTP |
| `cart_controller_test.dart`  | CartController add/remove/quantity |
| `wishlist_controller_test.dart` | WishlistController toggle |
| `product_model_test.dart`   | ProductModel JSON parsing |
| `profile_screen_auth_test.dart` | Profile auth state persistence |

Tests are limited to controllers and models. Widget and integration tests are not present.

---

## Known Limitations / Roadmap

- [ ] Checkout payment integration (UI exists, no payment API connected)
- [ ] Order placement flow not connected to backend
- [ ] Push notifications (screen exists, no notification service)
- [ ] Address management (placeholder UI)
- [ ] Product reviews (model/screen exist, not fully wired)
- [ ] No widget/integration tests
- [ ] Multi-step signup screens exist but are not wired into the active route (app uses single-screen `SignUpScreen`)

---

## Author

**MD Juwel Rana**

Repository: [github.com/juwelzan/ecommerce](https://github.com/juwelzan/ecommerce)

---

## License

License: Not specified
