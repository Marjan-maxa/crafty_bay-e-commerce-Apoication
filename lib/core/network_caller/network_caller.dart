import 'dart:convert';

import 'package:http/http.dart';

class NetWorkCaller {
  Future<networkResponse> getRequest(String url) async {
    final Uri uri = Uri.parse(url);
    final Response response = await get(uri);
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
  }
}

class networkResponse {
  final int statusCode;
  final Map<String, dynamic>? body;
  final bool isSuccess;
  final String? errorMessage;
  networkResponse({
    required this.statusCode,
    required this.body,
    required this.isSuccess,
    this.errorMessage='Something went wrong',
  });
}

// 20:45 after start