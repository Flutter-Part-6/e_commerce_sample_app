import 'dart:io';

import 'package:dio/dio.dart';
import 'network_exception.dart';
import 'unexpected_exception.dart';
import 'unknown_exception.dart';

class BaseException implements Exception {
  BaseException();

  static setException(error) {
    if (error is Exception) {
      switch (error.runtimeType) {
        case SocketException:
          throw NetworkException(error);
        case DioError:
          return NetworkException(error);
        default:
          return UnexpectedException(error);
      }
    } else {
      return UnknownException(errorMsg: error.toString());
    }
  }
}
