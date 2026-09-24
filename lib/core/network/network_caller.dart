import 'dart:async';
import 'dart:convert';

import 'package:ecommerce/shared/path/paths.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
part 'network_response.dart';

class NetworkCaller {
  static const Duration _timeout = Duration(seconds: 30);

  final Map<String, String> headers;
  NetworkCaller({required this.headers});

  Map<String, String> _buildHeaders(Map<String, String>? additionalHeaders) {
    return {...headers, ...?additionalHeaders};
  }

  dynamic _decodeBody(String body) {
    if (body.trim().isEmpty) return null;
    try {
      return jsonDecode(body);
    } on FormatException {
      return null;
    }
  }

  String? _messageFrom(dynamic decoded) {
    if (decoded is Map && decoded['msg'] != null) {
      return '${decoded['msg']}';
    }
    return null;
  }

  void _logStatus(String method, String url, int status) {
    if (kDebugMode) {
      LoggerLog.logI('$method $url → $status');
    }
  }

  Future<NetworkResponse> _handleResponse({
    required http.Response response,
    required String method,
    required String url,
    VoidCallback? unauthorized,
  }) async {
    final status = response.statusCode;
    _logStatus(method, url, status);
    final decoded = _decodeBody(response.body);

    if (status == 200 || status == 201) {
      return NetworkResponse(
        statusCode: status,
        isSuccess: true,
        body: decoded,
      );
    }

    if (status == 401) {
      unauthorized?.call();
      return NetworkResponse(
        statusCode: status,
        isSuccess: false,
        errrorM: _messageFrom(decoded) ?? 'Unauthorized',
      );
    }

    return NetworkResponse(
      statusCode: status,
      isSuccess: false,
      errrorM: _messageFrom(decoded) ?? 'Request failed ($status)',
    );
  }

  NetworkResponse _exceptionResponse(Object e) {
    if (e is TimeoutException) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errrorM: 'Request timed out. Please try again.',
      );
    }
    return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: '$e');
  }

  Future<NetworkResponse> get({
    required String url,
    Map<String, String>? headers,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final response = await http
          .get(uri, headers: _buildHeaders(headers))
          .timeout(_timeout);
      return await _handleResponse(
        response: response,
        method: 'GET',
        url: url,
        unauthorized: unauthorized,
      );
    } catch (e) {
      return _exceptionResponse(e);
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
      final response = await http
          .post(uri, body: payload, headers: _buildHeaders(headers))
          .timeout(_timeout);
      return await _handleResponse(
        response: response,
        method: 'POST',
        url: url,
        unauthorized: unauthorized,
      );
    } catch (e) {
      return _exceptionResponse(e);
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
      final response = await http
          .patch(uri, body: payload, headers: _buildHeaders(headers))
          .timeout(_timeout);
      return await _handleResponse(
        response: response,
        method: 'PATCH',
        url: url,
        unauthorized: unauthorized,
      );
    } catch (e) {
      return _exceptionResponse(e);
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
      final response = await http
          .delete(uri, body: payload, headers: _buildHeaders(headers))
          .timeout(_timeout);
      return await _handleResponse(
        response: response,
        method: 'DELETE',
        url: url,
        unauthorized: unauthorized,
      );
    } catch (e) {
      return _exceptionResponse(e);
    }
  }
}
