class UnknownException implements Exception {
  final String errorMsg;

  UnknownException({required this.errorMsg});

  @override
  String toString() {
    return '[Unknown Error] ::: $errorMsg';
  }
}
