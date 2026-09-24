import 'dart:convert';

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
          "_id": "usr-1",
          "first_name": "Rahim",
          "last_name": "Uddin",
          "email": "rahim@example.com",
        },
      },
    );
  }
}

void main() {
  late MockNetworkCaller mockNetworkCaller;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    mockNetworkCaller = MockNetworkCaller();
    if (getIt.isRegistered<NetworkCaller>()) {
      getIt.unregister<NetworkCaller>();
    }
    getIt.registerLazySingleton<NetworkCaller>(() => mockNetworkCaller);
  });

  group('UserModel tests', () {
    test('fullName returns first and last name when both are present', () {
      final user = UserModel(firstName: 'John', lastName: 'Doe');
      expect(user.fullName, 'John Doe');
    });

    test('fullName returns first name when last name is null or empty', () {
      final user = UserModel(firstName: 'John', lastName: '');
      expect(user.fullName, 'John');
    });

    test('fullName falls back to email if names are empty', () {
      final user = UserModel(email: 'john@example.com');
      expect(user.fullName, 'john@example.com');
    });

    test('fullName falls back to User if email and names are empty', () {
      final user = UserModel();
      expect(user.fullName, 'User');
    });

    test('toJson and fromJson properly serialize and deserialize', () {
      final user = UserModel(
        id: '123',
        firstName: 'Jane',
        lastName: 'Smith',
        email: 'jane@example.com',
        phone: '1234567890',
        city: 'Dhaka',
        role: 1,
      );

      final jsonMap = user.toJson();
      final parsedUser = UserModel.fromJson(jsonMap);

      expect(parsedUser.id, '123');
      expect(parsedUser.fullName, 'Jane Smith');
      expect(parsedUser.email, 'jane@example.com');
      expect(parsedUser.phone, '1234567890');
      expect(parsedUser.city, 'Dhaka');
    });
  });

  group('AuthController tests', () {
    test('initial state is unauthenticated', () {
      final controller = AuthController(networkCaller: mockNetworkCaller);
      expect(controller.isLoggedIn, isFalse);
      expect(controller.user, isNull);
      expect(controller.token, isNull);
    });

    test('checkInitialAuth restores session from SharedPreferences', () async {
      final mockUser = UserModel(
        id: 'usr-1',
        firstName: 'Rahim',
        lastName: 'Uddin',
        email: 'rahim@example.com',
      );
      SharedPreferences.setMockInitialValues({
        Keys.authToken: 'mock-jwt-token-123',
        Keys.authUser: jsonEncode(mockUser.toJson()),
      });

      final controller = AuthController(networkCaller: mockNetworkCaller);
      await controller.checkInitialAuth();

      expect(controller.isLoggedIn, isTrue);
      expect(controller.token, 'mock-jwt-token-123');
      expect(controller.user?.fullName, 'Rahim Uddin');
    });

    test('logout clears session from memory and SharedPreferences', () async {
      final mockUser = UserModel(
        id: 'usr-1',
        firstName: 'Rahim',
        email: 'rahim@example.com',
      );
      SharedPreferences.setMockInitialValues({
        Keys.authToken: 'mock-jwt-token-123',
        Keys.authUser: jsonEncode(mockUser.toJson()),
      });

      final controller = AuthController(networkCaller: mockNetworkCaller);
      await controller.checkInitialAuth();
      expect(controller.isLoggedIn, isTrue);

      await controller.logout();

      expect(controller.isLoggedIn, isFalse);
      expect(controller.user, isNull);
      expect(controller.token, isNull);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString(Keys.authToken), isNull);
      expect(prefs.getString(Keys.authUser), isNull);
    });
  });
}
