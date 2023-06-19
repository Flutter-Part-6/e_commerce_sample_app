import 'package:dio/dio.dart';
import 'package:sample_app/common/utils/logger.dart';

class RestClient {
  final Dio _dio = Dio();

  static final RestClient _instance = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instance;

  RestClient._internal() {
    _dio.interceptors.add(InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   CustomLogger.logger.d('[request] ${options.uri}');
      //   handler.next(options);
      // },
      // onResponse: (options, handler) {
      //   CustomLogger.logger.d('[response] ${options}');
      //
      //   // log('[test] data : ${e.data}');
      //   // log('[test] response : ${e.statusMessage}');
      // },
      // onError: (e, handler) {
      //   log('[test] error : $e');
      // },
    ));
  }
}
