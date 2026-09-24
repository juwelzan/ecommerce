import 'dart:convert';

import 'package:ecommerce/features/auth/model/signup_model.dart';
import 'package:ecommerce/shared/path/paths.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends ChangeNotifier {
  final NetworkCaller _networkCaller;

  AuthController({NetworkCaller? networkCaller})
    : _networkCaller = networkCaller ?? getIt<NetworkCaller>();

  UserModel? _user;
  String? _token;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isInitialized = false;

  UserModel? get user => _user;
  String? get token => _token;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isInitialized => _isInitialized;
  bool get isLoggedIn => _token != null && _token!.trim().isNotEmpty;

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  Future<void> checkInitialAuth() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final storedToken = prefs.getString(Keys.authToken);
      final storedUserData = prefs.getString(Keys.authUser);

      if (storedToken != null && storedToken.isNotEmpty) {
        _token = storedToken;
        if (storedUserData != null && storedUserData.isNotEmpty) {
          try {
            _user = UserModel.fromJson(
              jsonDecode(storedUserData) as Map<String, dynamic>,
            );
          } catch (e) {
            LoggerLog.logE("Failed to parse stored user: $e");
          }
        }
        notifyListeners();
        // Fetch fresh profile in the background
        fetchProfile().catchError((e) {
          LoggerLog.logE("Background fetchProfile error: $e");
        });
      }
    } catch (e) {
      LoggerLog.logE("checkInitialAuth error: $e");
    } finally {
      _isInitialized = true;
      notifyListeners();
    }
  }

  Future<bool> login({required String email, required String password}) async {
    if (_isLoading) return false;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _networkCaller.post(
        url: Urls.postAuthLogin,
        body: {"email": email.trim(), "password": password},
      );

      if (response.isSuccess && response.body != null) {
        final data = response.body['data'];
        if (data != null) {
          final token = data['token'] as String?;
          if (token == null || token.trim().isEmpty) {
            _isLoading = false;
            _errorMessage =
                response.errrorM ??
                "Login failed. Please check your credentials.";
            notifyListeners();
            return false;
          }

          _token = token.trim();
          if (data['user'] != null) {
            _user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
          }

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(Keys.authToken, _token!);
          if (_user != null) {
            await prefs.setString(Keys.authUser, jsonEncode(_user!.toJson()));
          }

          _isLoading = false;
          _errorMessage = null;
          notifyListeners();
          return true;
        }
      }

      _isLoading = false;
      _errorMessage =
          response.errrorM ?? "Login failed. Please check your credentials.";
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = "Login failed. Please check your credentials.";
      LoggerLog.logE("login error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> signup(SignupModel model) async {
    if (_isLoading) return false;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _networkCaller.post(
        url: Urls.postAuthSignup,
        body: model.toJson(),
      );

      _isLoading = false;
      if (response.isSuccess) {
        _errorMessage = null;
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.errrorM ?? "Sign up failed. Please try again.";
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = "Sign up failed. Please try again.";
      LoggerLog.logE("signup error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> verifyOtp({required String email, required String otp}) async {
    if (_isLoading) return false;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _networkCaller.post(
        url: Urls.postAuthVerifyOtp,
        body: {"email": email.trim(), "otp": otp.trim()},
      );

      if (response.isSuccess && response.body != null) {
        final data = response.body['data'];
        if (data != null) {
          final token = data['token'] as String?;
          if (token == null || token.trim().isEmpty) {
            _isLoading = false;
            _errorMessage = response.errrorM ?? "OTP verification failed.";
            notifyListeners();
            return false;
          }

          _token = token.trim();
          if (data['user'] != null) {
            _user = UserModel.fromJson(data['user'] as Map<String, dynamic>);
          }

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString(Keys.authToken, _token!);
          if (_user != null) {
            await prefs.setString(Keys.authUser, jsonEncode(_user!.toJson()));
          }

          _isLoading = false;
          _errorMessage = null;
          notifyListeners();
          return true;
        }
      }

      _isLoading = false;
      _errorMessage = response.errrorM ?? "OTP verification failed.";
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = "OTP verification failed.";
      LoggerLog.logE("verifyOtp error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> resendOtp({required String email}) async {
    try {
      final response = await _networkCaller.post(
        url: Urls.postAuthResendOtp,
        body: {"email": email.trim()},
      );
      if (response.isSuccess) return true;
      _errorMessage = response.errrorM ?? "Unable to resend the OTP.";
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = "Unable to resend the OTP.";
      LoggerLog.logE("resendOtp error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<bool> forgotPassword({required String email}) async {
    if (_isLoading) return false;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final response = await _networkCaller.post(
        url: Urls.postAuthForgotPassword,
        body: {"email": email.trim()},
      );
      _isLoading = false;
      if (response.isSuccess) {
        notifyListeners();
        return true;
      }
      _errorMessage = response.errrorM ?? "Unable to send reset instructions.";
      notifyListeners();
      return false;
    } catch (e) {
      _isLoading = false;
      _errorMessage = "Unable to send reset instructions.";
      LoggerLog.logE("forgotPassword error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<void> fetchProfile() async {
    if (_token == null) return;

    try {
      final response = await _networkCaller.get(
        url: Urls.getAuthProfile,
        headers: {"token": _token!},
        unauthorized: () {
          logout();
        },
      );

      // Guard: Ensure user did not log out while request was in-flight
      if (_token == null) return;

      if (response.isSuccess && response.body != null) {
        final data = response.body['data'];
        if (data != null && data is Map<String, dynamic>) {
          _user = UserModel.fromJson(data);
          final prefs = await SharedPreferences.getInstance();
          if (_token != null) {
            await prefs.setString(Keys.authUser, jsonEncode(_user!.toJson()));
          }
          notifyListeners();
        }
      }
    } catch (e) {
      LoggerLog.logE("fetchProfile error: $e");
    }
  }

  Future<bool> updateProfile({
    String? firstName,
    String? lastName,
    String? phone,
    String? city,
  }) async {
    if (_token == null) return false;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final Map<String, dynamic> body = {};
      if (firstName != null) body['first_name'] = firstName.trim();
      if (lastName != null) body['last_name'] = lastName.trim();
      if (phone != null) body['phone'] = phone.trim();
      if (city != null) body['city'] = city.trim();

      final response = await _networkCaller.patch(
        url: Urls.patchAuthProfileUpdate,
        headers: {"token": _token!},
        body: body,
        unauthorized: () {
          logout();
        },
      );

      _isLoading = false;
      if (response.isSuccess && response.body != null) {
        final data = response.body['data'];
        if (data != null && data is Map<String, dynamic>) {
          _user = UserModel.fromJson(data);
        } else {
          _user = _user?.copyWith(
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            city: city,
          );
        }
        final prefs = await SharedPreferences.getInstance();
        if (_user != null) {
          await prefs.setString(Keys.authUser, jsonEncode(_user!.toJson()));
        }
        notifyListeners();
        return true;
      } else {
        _errorMessage = response.errrorM ?? "Failed to update profile.";
        notifyListeners();
        return false;
      }
    } catch (e) {
      _isLoading = false;
      _errorMessage = "Failed to update profile.";
      LoggerLog.logE("updateProfile error: $e");
      notifyListeners();
      return false;
    }
  }

  Future<void> logout() async {
    _token = null;
    _user = null;
    _errorMessage = null;

    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(Keys.authToken);
      await prefs.remove(Keys.authUser);
    } catch (e) {
      LoggerLog.logE("logout SharedPreferences error: $e");
    }

    notifyListeners();
  }
}
