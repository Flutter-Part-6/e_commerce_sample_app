class ServiceException implements Exception {
  final String code;
  final String status;
  final String message;

  ServiceException({
    required this.code,
    required this.status,
    required this.message,
  });

  @override
  String toString() {
    return '[Service Error] ::: [$code] status: $status ';
  }
}
