part of'network_caller.dart';
class NetWorkResponse {
  final int statusCode;
  final bool isSuccess;
  final Map<String, dynamic>? body;
  final String? errorMesssage;
  NetWorkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.body,
    this.errorMesssage = 'Something went wrong!',
  });
}
