// import 'dart:ffi';
// import 'dart:io';
//
// import 'package:dio/dio.dart';
//
// class NetworkException implements Exception {
//   final Exception error;
//
//   NetworkException(this.error);
//
//   static NetworkException getError(error) {
//     if (error is Exception) {
//       if (error is DioError) {
//         if (error.type == DioErrorType.badResponse) {
//           /// code가 존재하지 않는 경우 9999로 정의 한다 -> httpStatus.other
//           final int statusCode = error.response?.statusCode ?? 9999;
//           final httpStatus = statusCode.toStatusByCode;
//         } else {
//           return NetworkException(error);
//         }
//       } else if (error is SocketException) {
//       } else {}
//     }
//     // switch(error.type){
//     //   case DioErrorType.connectionTimeout:
//     //     return NetworkException(error);
//     //   case DioErrorType.sendTimeout:
//     //     return NetworkException(error);
//     //   case DioErrorType.receiveTimeout:
//     //     return NetworkException(error);
//     //
//     // }
//   }
// }
//
// enum ResponseStatus {
//   badRequest,
//   unauthorized,
//   notFound,
//   internalSeverError,
//   other,
// }
//
// extension IntegerEx on int {
//   ResponseStatus get toStatusByCode {
//     switch (this) {
//       case 400:
//         return ResponseStatus.badRequest;
//       case 401:
//         return ResponseStatus.unauthorized;
//       case 404:
//         return ResponseStatus.notFound;
//       case 500:
//         return ResponseStatus.internalSeverError;
//       default:
//         return ResponseStatus.other;
//     }
//   }
// }
//
// extension HttpStatusEx on ResponseStatus {
//   String get toMessage {
//     switch (this) {
//       case ResponseStatus.badRequest:
//         return '[400] 잘못된 요청입니다.';
//       case ResponseStatus.unauthorized:
//         return '[401] 해당 요청에 권한이 없습니다.';
//       case ResponseStatus.notFound:
//         return '[404] 페이지를 찾을 수 없습니다.';
//       case ResponseStatus.internalSeverError:
//         return '[500] 서버 내부에서 오류가 발생했습니다.';
//       case ResponseStatus.other:
//         return '[9999] 알 수 없는 오류가 발생했습니다.';
//     }
//   }
// }
