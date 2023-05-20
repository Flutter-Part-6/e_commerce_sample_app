import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'user_api.g.dart';

const String _baseUrl =
    'https://us-central1-distibution-test.cloudfunctions.net';

// const String _baseUrl = 'http://127.0.0.1:5001/distibution-test/us-central1';

@RestApi(baseUrl: _baseUrl)
abstract class UserApi {
  factory UserApi(Dio dio) = _UserApi;

  @POST('/createCustomToken')
  Future<String> getCustomToken({
    @Body() required Map<String, dynamic> params,
  });
}
