import 'dart:convert';
import 'dart:ui';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
part 'network_response.dart';

class NetworkCaller {
  final Map<String, String> Function() headers;
  final Logger _logger = Logger();
  final VoidCallback onUnauthorized;
  NetworkCaller({required this.headers, required this.onUnauthorized});

  Future<NetWorkResponse> getRequest(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      _loggerRequest(url);
      final Response response = await get(uri, headers: headers());
      _loggerResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage: 'Unauthorized',
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage:
              decodedJson['msg'] ??
              'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetWorkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMesssage: e.toString(),
        body: null,
      );
      // TODO
    }
  }

  Future<NetWorkResponse> postRequest(
    String url, {
    Map<String, dynamic>? body,
        bool FromLoggedIn=false
  }) async {
    try {
      final Uri uri = Uri.parse(url);
      _loggerRequest(url, body: body);

      final Response response = await post(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );
      _loggerResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        if(!FromLoggedIn){
          onUnauthorized();
        }

        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage: 'Unauthorized',
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage:
              decodedJson['msg'] ??
              'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetWorkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMesssage: e.toString(),
      );
      // TODO
    }
  }

  Future<NetWorkResponse> putRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final Uri uri = Uri.parse(url);
      print(url);
      final Response response = await put(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage: 'Unauthorized',
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage:
              decodedJson['msg'] ??
              'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetWorkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMesssage: e.toString(),
      );
      // TODO
    }
  }

  Future<NetWorkResponse> patchRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final Uri uri = Uri.parse(url);
      print(url);
      final Response response = await patch(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage: 'Unauthorized',
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage:
              decodedJson['msg'] ??
              'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetWorkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMesssage: e.toString(),
      );
      // TODO
    }
  }

  Future<NetWorkResponse> deleteRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final Uri uri = Uri.parse(url);
      print(url);
      final Response response = await delete(
        uri,
        body: jsonEncode(body),
        headers: headers(),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        onUnauthorized();
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage: 'Unauthorized',
        );
      } else {
        final decodedJson = jsonDecode(response.body);
        return NetWorkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMesssage:
              decodedJson['msg'] ??
              'Something went wrong!',
        );
      }
    } on Exception catch (e) {
      return NetWorkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMesssage: e.toString(),
      );
      // TODO
    }
  }

  void _loggerRequest(String url, {Map<String, dynamic>? body}) {
    _logger.i("Url=>$url\n Body=>$body");
  }

  void _loggerResponse(Response response) {
    _logger.i('''Response=>${response.body}
    Status Code=>${response.statusCode}
    Body=>${response.body}
    ''');
  }
}
