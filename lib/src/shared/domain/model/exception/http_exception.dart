class HTTPException implements Exception {
  HTTPException(this.statusCode, this.message);

  final int statusCode;
  final String message;

  @override
  String toString() {
    return message;
  }
}
