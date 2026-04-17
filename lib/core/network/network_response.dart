part of 'network_caller.dart';


class NetworkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, double>? body;
  final String? errrorM;
  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.body,
    this.errrorM,
  });
}
