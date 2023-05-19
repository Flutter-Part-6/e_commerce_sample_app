import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../base_usecase/remote.usecase.dart';

class GetUsers extends RemoteUsecase<UserRepository> {
  GetUsers({this.params});
  final Map<String, String>? params;

  @override
  Future<User> execute(UserRepository repository) async {
    // 기존 로그인 토큰 존재 유무 검사
    OAuthToken? kakaoToken =
        await TokenManagerProvider.instance.manager.getToken();

    if (kakaoToken == null) {
      if (await isKakaoTalkInstalled()) {
        await UserApi.instance.loginWithKakaoTalk();
      } else {
        await UserApi.instance.loginWithKakaoAccount();
      }
    }

    User user = await UserApi.instance.me();
    final token = 'kakao::123123123';
    // final token = createCustomToken()

    // await FirebaseAuth.instance.signInWithCustomToken(token);

    /// TODO
    /// 서버(functions) 호출해서 id 생성 및 auth 등록 => PlaceHolderRepositoryImpl -> getUsers로 만들어야함
    /// User 모델 수정
    /// 에러처리성

    return user;
  }
}
