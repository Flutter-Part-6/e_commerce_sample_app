import 'package:dio/dio.dart';

class RestClient {
  final Dio _dio = Dio();

  static final RestClient _instance = RestClient._internal();

  Dio get getDio => _dio;

  factory RestClient() => _instance;

  RestClient._internal();
  //  {
  //   _dio.interceptors.add(InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       log('[test] request : ${options.uri}');
  //       handler.next(options);
  //     },
  //     onResponse: (e, handler) {
  //       log('[test] data : ${e.data}');
  //       log('[test] response : ${e.statusMessage}');
  //     },
  //     onError: (e, handler) {
  //       log('[test] error : $e');
  //     },
  //   ));
  // }
}
