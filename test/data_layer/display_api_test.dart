import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:sample_app/data_layer/common/dio/rest_client.dart';
import 'package:sample_app/data_layer/data_source/remote/display_api.dart';

class FakeUri extends Fake implements Uri {}

void main() {
  group('display_api test 입니다.', () {
    late Dio dio;
    late DisplayApi api;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      dio = RestClient().getDio;
      api = DisplayApi(dio);
    });

    group('생성자 테스트', () {
      test('뭐야 이거', () {
        expect(DisplayApi(dio), isNotNull);
      });
    });

    group('api 호출 테스트 이상한 mallType 넣은 경우', () async{
      final response = await api.getCollectionsByMallType(mallType: 'kkk');
      final expected = [{"tabId": 10001, "title": "박동진"}];

      expect(response, equals(expected));
    });

  });
}
