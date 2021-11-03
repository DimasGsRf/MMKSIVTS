import 'dart:convert';

abstract class ApiServiceInterface {
  Future<dynamic> invokeHttp(
    dynamic url,
    RequestType type, {
    Map<String, String> headers,
    dynamic body,
    Map<String, String> params,
    Encoding encoding,
    bool needThrowError,
  });
}

enum RequestType { GET, POST, PUT, PATCH, DELETE }
