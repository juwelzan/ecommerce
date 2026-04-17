import 'dart:convert';


import 'package:ecommerce/shared/path/paths.dart';
import 'package:http/http.dart' as http;
part 'network_response.dart';

class NetworkCaller {
  final Map<String, String> headers;
  NetworkCaller({required this.headers});
  Future<NetworkResponse> get({
    required String url,

    required VoidCallback unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final http.Response response = await http.get(uri, headers: headers);
      final int status = response.statusCode;
      LoggerLog.logI(response.body);


      if (status == 200 || status == 201) {
        //success
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        // Unauthorized
        final decodet = jsonDecode(response.body);
        unauthorized.call();
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
      //Exception
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }

  //////////////////////////////////////
  ///post Requst
  ////////////////////////////////////

  Future<NetworkResponse> post({
    required String url,
    Map<String, String>? body,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final http.Response response = await http.post(
        uri,
        body: body,
        headers: headers,

      );
LoggerLog.logI(response.body);


      final int status = response.statusCode;

      if (status == 200 || status == 201) {
        //success
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        // Unauthorized
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
      //Exception
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }
  //////////////////////////////////////
  ///post patch
  ////////////////////////////////////

  Future<NetworkResponse> patch({
    required String url,
    Map<String, String>? body,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final http.Response response = await http.patch(
        uri,
        body: body,

        headers: headers,
      );
      final int status = response.statusCode;
      LoggerLog.logI(response.body);

      if (status == 200 || status == 201) {
        //success
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        // Unauthorized
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
      //Exception
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }




  Future<NetworkResponse> delete({
    required String url,
    Map<String, String>? body,
    VoidCallback? unauthorized,
  }) async {
    try {
      final uri = Uri.parse(url);
      final http.Response response = await http.delete(
        uri,
        body: body,
        headers: headers,
      );
      final int status = response.statusCode;
      LoggerLog.logI(response.body);

      if (status == 200 || status == 201) {
        //success
        return NetworkResponse(
          statusCode: status,
          isSuccess: true,
          body: jsonDecode(response.body),
        );
      } else if (status == 401) {
        // Unauthorized
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
      //Exception
      return NetworkResponse(statusCode: -1, isSuccess: false, errrorM: "$e");
    }
  }
}
