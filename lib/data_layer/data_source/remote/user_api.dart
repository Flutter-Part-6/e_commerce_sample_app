import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../dto/api_response/response_wrapper.dart';

part 'user_api.g.dart';

const String _baseUrl =
    'https://us-central1-designer-app-a6145.cloudfunctions.net/';
// const String _baseUrl = 'https://us-central1-desiner-app-dev.cloudfunctions.net/';

@RestApi(baseUrl: _baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @POST('/createCustomToken')
  Future<ResponseWrapper<String>> getCustomToken({
    @Body() required Map<String, dynamic> params,
  });
}
