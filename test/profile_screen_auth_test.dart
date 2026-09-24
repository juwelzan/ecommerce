import 'package:ecommerce/shared/path/paths.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockNetworkCaller extends NetworkCaller {
  MockNetworkCaller() : super(headers: {});

  @override
  Future<NetworkResponse> get({
    required String url,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    return NetworkResponse(
      statusCode: 200,
      isSuccess: true,
      body: {
        "code": 200,
        "data": {
          "_id": "u-1",
          "first_name": "Juwel",
          "last_name": "Developer",
          "email": "juwel.dev@example.com",
          "phone": "01700000000",
        },
      },
    );
  }
}

Widget createTestableWidget({
  required AuthController authController,
  NavbarController? navbarController,
}) {
  return ScreenUtil(
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>.value(value: authController),
        ChangeNotifierProvider<NavbarController>(
          create: (_) => navbarController ?? NavbarController(),
        ),
      ],
      child: const MaterialApp(
        home: ProfileScreen(),
      ),
    ),
  );
}

void main() {
  late MockNetworkCaller mockCaller;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockCaller = MockNetworkCaller();
    if (getIt.isRegistered<NetworkCaller>()) {
      getIt.unregister<NetworkCaller>();
    }
    getIt.registerLazySingleton<NetworkCaller>(() => mockCaller);
  });

  testWidgets('ProfileScreen shows guest card when user is not logged in',
      (WidgetTester tester) async {
    final auth = AuthController(networkCaller: mockCaller);

    await tester.pumpWidget(createTestableWidget(authController: auth));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to EasyEcommerce'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Logout'), findsNothing);
  });

  testWidgets('ProfileScreen shows user info and logout when user is logged in',
      (WidgetTester tester) async {
    final auth = AuthController(networkCaller: mockCaller);

    SharedPreferences.setMockInitialValues({
      Keys.authToken: 'valid-test-token',
      Keys.authUser:
          '{"_id":"u-1","first_name":"Juwel","last_name":"Developer","email":"juwel.dev@example.com","phone":"01700000000"}',
    });
    await auth.checkInitialAuth();

    await tester.pumpWidget(createTestableWidget(authController: auth));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to EasyEcommerce'), findsNothing);
    expect(find.text('Juwel Developer'), findsOneWidget);
    expect(find.text('juwel.dev@example.com'), findsOneWidget);
    expect(find.text('01700000000'), findsOneWidget);
    expect(find.text('Edit'), findsOneWidget);

    // Scroll down to check Logout button
    await tester.scrollUntilVisible(find.text('Logout'), 200);
    expect(find.text('Logout'), findsOneWidget);
  });
}
