class UnexpectedException {
  final Exception error;

  UnexpectedException(this.error);

  @override
  String toString() {
    return '[Unexpected Error] ::: $error';
  }
}
