import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final Exception error;

  NetworkException(this.error);

  @override
  String toString() {
    if (error is DioError) {
      final code = (error as DioError).response?.statusCode ?? 9999;

      return '[Network Error] ::: $error \n <$code>';
    }

    return '[Network Error] ::: $error ';
  }
}
