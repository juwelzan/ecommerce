import 'dart:convert';

import 'package:ecommerce/shared/path/paths.dart';
import 'package:http/http.dart' as http;
part 'network_response.dart';

class NetworkCaller {
  final Map<String, String> headers;
  NetworkCaller({required this.headers});

  Map<String, String> _buildHeaders(Map<String, String>? additionalHeaders) {
    return {
      ...headers,
      ...?additionalHeaders,
    };
  }

  Future<NetworkResponse> get({
    required String url,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final http.Response response = await http.get(
        uri,
        headers: _buildHeaders(headers),
      );
      final int status = response.statusCode;

      if (status == 200 || status == 201) {
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        final decodet = jsonDecode(response.body);
        unauthorized?.call();
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      } else {
        final decodet = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }

  Future<NetworkResponse> post({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final Object? payload = body is String || body == null
          ? body
          : jsonEncode(body);
      final http.Response response = await http.post(
        uri,
        body: payload,
        headers: _buildHeaders(headers),
      );
      LoggerLog.logI(response.body);

      final int status = response.statusCode;

      if (status == 200 || status == 201) {
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        final decodet = jsonDecode(response.body);
        unauthorized?.call();
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      } else {
        final decodet = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }

  Future<NetworkResponse> patch({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final Object? payload = body is String || body == null
          ? body
          : jsonEncode(body);
      final http.Response response = await http.patch(
        uri,
        body: payload,
        headers: _buildHeaders(headers),
      );
      final int status = response.statusCode;
      LoggerLog.logI(response.body);

      if (status == 200 || status == 201) {
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        final decodet = jsonDecode(response.body);
        unauthorized?.call();
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      } else {
        final decodet = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }

  Future<NetworkResponse> delete({
    required String url,
    dynamic body,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final Object? payload = body is String || body == null
          ? body
          : jsonEncode(body);
      final http.Response response = await http.delete(
        uri,
        body: payload,
        headers: _buildHeaders(headers),
      );
      final int status = response.statusCode;
      LoggerLog.logI(response.body);

      if (status == 200 || status == 201) {
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        final decodet = jsonDecode(response.body);
        unauthorized?.call();
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      } else {
        final decodet = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: status,
          isSuccess: false,
          errrorM: decodet["msg"],
        );
      }
    } on Exception catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }
}
