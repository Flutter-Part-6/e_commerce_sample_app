import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample_app/common/utils/exceptions/network_exception.dart';
import 'package:sample_app/common/utils/exceptions/unexpected_exception.dart';
import 'package:sample_app/common/utils/exceptions/unknown_exception.dart';
import 'package:sample_app/common/utils/logger.dart';

class BaseException implements Exception {
  BaseException();

  static setException(error) {
    // CustomLogger.logger.d(error.runtimeType);
    // try {
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

    // } catch (error) {
    //   CustomLogger.logger.e(error);
    //
    //   // throw UnknownException(errorMsg: error.toString());
    // }
  }
}
