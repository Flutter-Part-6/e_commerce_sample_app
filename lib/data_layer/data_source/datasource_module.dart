import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/common/dio/rest_client.dart';
import 'package:sample_app/data_layer/data_source/local_storage/display_dao.dart';
import 'package:sample_app/data_layer/data_source/mock/moc_api.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';
import 'package:sample_app/data_layer/data_source/remote/user_api.dart';

@module
abstract class ApiModule {
  final Dio _dio = RestClient().getDio;

  @singleton
  DisplayApi get displayApi => DisplayApi(_dio);

  @singleton
  MockApi get mockApi => MockApi();

  @singleton
  UserApi get userApi => UserApi(_dio);

  @singleton
  DisplayDao get displayDao => DisplayDao();
}
