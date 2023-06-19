import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/common/dio/rest_client.dart';
import 'package:sample_app/data_layer/data_source/local_storage/display_dao.dart';
import 'package:sample_app/data_layer/data_source/mock/mock.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';
import 'package:sample_app/data_layer/data_source/remote/user_api.dart';
import 'package:sample_app/main.dart';

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
