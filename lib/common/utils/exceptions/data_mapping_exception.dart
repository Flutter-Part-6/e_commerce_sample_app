class DataMappingException implements Exception {
  final String _msg;

  DataMappingException(this._msg);

  @override
  String toString() {
    return '[DataMapping Exception] $_msg';
  }
}
