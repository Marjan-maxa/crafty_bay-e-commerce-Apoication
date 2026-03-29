import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';

class NetWorkCaller {
  final Logger _logger=Logger();
  Future<networkResponse> getRequest(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      _loggerRequest(url);
      final Response response = await get(uri);
      _loggerResponse(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final decodedjson = jsonDecode(response.body);
        return networkResponse(
          statusCode: response.statusCode,
          body: decodedjson,
          isSuccess: true,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return networkResponse(
          statusCode: response.statusCode,
          body: null,
          isSuccess: false,
          errorMessage: decodedjson['message'],
        );
      }
    } on Exception catch (e) {
      return networkResponse(

        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),

      );

    }
  }
  void _loggerRequest(String url){

    _logger.i('Url=>$url');
  }
  void _loggerResponse(Response response){

    _logger.i('''Response=>${response.body}
    Status Code=>${response.statusCode}
    Body=>${response.body}
    ''');
  }

}


class networkResponse {
  final int statusCode;
  final Map<String, dynamic>? body;
  final bool isSuccess;
  final String? errorMessage;
  networkResponse({
    required this.statusCode,
     this.body,
    required this.isSuccess,
    this.errorMessage='Something went wrong',
  });
}

// 27:00 after start