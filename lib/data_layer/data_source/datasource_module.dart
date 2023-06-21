import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../common/dio/rest_client.dart';
import '../../main.dart';
import 'local_storage/display_dao.dart';
import 'mock/mock.dart';
import 'remote/display_api.dart';
import 'remote/user_api.dart';

@module
abstract class ApiModule {
  final Dio _dio = RestClient().getDio;

  @singleton
  DisplayApi get displayApi {
    String baseUrl =
        Platform.isAndroid ? 'http://10.0.2.2:8080' : 'http://localhost:8080';

    _dio.options.baseUrl = baseUrl;

    return TargetApiValue().isRemoteApi
        ? DisplayApi(
            _dio,
          )
        : MockApi();
  }

  @singleton
  MockApi get mockApi => MockApi();

  @singleton
  UserApi get userApi => UserApi(_dio);

  @singleton
  DisplayDao get displayDao => DisplayDao();
}
