class RemoteException implements Exception {
  final int statusCode;
  final String message;

  RemoteException({
    required this.statusCode,
    required this.message,
  });
}
