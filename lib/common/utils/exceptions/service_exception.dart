class ServiceException implements Exception {
  final String code;
  final String message;

  ServiceException({required this.code, required this.message});

  @override
  String toString() {
    return '[Service Error] ::: [$code] $message';
  }
}
