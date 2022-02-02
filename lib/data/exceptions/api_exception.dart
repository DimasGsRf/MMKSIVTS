class APIException implements Exception {
  final String message, statusText;
  final int statusCode;

  APIException(this.message, this.statusCode, this.statusText);
}
