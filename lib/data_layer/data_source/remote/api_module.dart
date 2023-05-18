import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/common/dio/rest_client.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';
import 'package:sample_app/data_layer/data_source/remote/place_holder_api_sample.dart';

@module
abstract class ApiModule {
  final Dio _dio = RestClient().getDio;

  @singleton
  DisplayApi get displayApi => DisplayApi(_dio);

  @singleton
  PlaceHolderApi get placeHolderApi => PlaceHolderApi(_dio);
}
