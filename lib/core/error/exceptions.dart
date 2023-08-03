class ServerException implements Exception {
  final int statusCode;
  final String message;

  ServerException({
    required this.statusCode,
    required this.message,
  });
}

class ValidationException implements Exception {
  final dynamic errors;
  final String message;

  ValidationException({
    this.errors,
    required this.message,
  });
}

class CacheException implements Exception {}
