class NetworkException implements Exception {
  final Exception error;

  NetworkException(this.error);

  @override
  String toString() {
    return '[Network Error] ::: $error';
  }
}
