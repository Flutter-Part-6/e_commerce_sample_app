import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../model/place_holder_sample/user/user.model.dart' as model;
import '../../repository/place_holder.repository.dart';

import '../base_usecase/remote.usecase.dart';

class GetUsers extends RemoteUsecase<PlaceHolderRepository> {
  GetUsers({this.params});
  final Map<String, String>? params;

  // @override
  // Future<List<User>> execute(PlaceHolderRepository repository) async {
  //   final response = await repository.getUsers();
  //   return response;
  // }

  @override
  Future<List<model.User>> execute(PlaceHolderRepository repository) async {
    // 기존 로그인 토큰 존재 유무 검사
    OAuthToken? token = await TokenManagerProvider.instance.manager.getToken();

    if (token == null) {
      if (await isKakaoTalkInstalled()) {
        token = await UserApi.instance.loginWithKakaoTalk();
      } else {
        token = await UserApi.instance.loginWithKakaoAccount();
      }
    }

    var json = JwtDecoder.decode(token.idToken ?? '');

    /// TODO
    /// 서버(functions) 호출해서 id 생성 및 auth 등록 => PlaceHolderRepositoryImpl -> getUsers로 만들어야함
    /// User 모델 수정
    /// 에러처리성

    json['id'] = 0;
    json['name'] = json['nickname'];
    json['username'] = json['nickname'];
    json['phone'] = '000-0000-0000';

    var loginInfo = model.User.fromJson(json);
    return [loginInfo];
  }
}
