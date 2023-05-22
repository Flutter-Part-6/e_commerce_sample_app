import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../base_usecase/remote.usecase.dart';

class GetUsers extends RemoteUsecase<UserRepository> {
  GetUsers({this.params});

  final Map<String, String>? params;

  @override
  Future<(User?, Object?)> execute(UserRepository repository) async {
    User? _user;
    Object? _error;

    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        _user = await UserApi.instance.me();

        final token = await repository.getCustomToken(
          userId: _user.id.toString(),
          email: _user.kakaoAccount?.email,
        );

        await FirebaseAuth.instance.signInWithCustomToken(token);
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          print('토큰 만료 $error');
        } else {
          print('토큰 정보 조회 실패 $error');
        }

        print('sdfsdfsfsdf');

        try {
          // 카카오계정으로 로그인
          OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
          print('로그인 성공 ${token.accessToken}');
        } catch (error) {
          print('로그인 실패 $error');
        }
      }
    } else {
      try {
        if (await isKakaoTalkInstalled()) {
          await UserApi.instance.loginWithKakaoTalk();
        } else {
          await UserApi.instance.loginWithKakaoAccount();
        }

        _user = await UserApi.instance.me();

        final token = await repository.getCustomToken(
          userId: _user.id.toString(),
          email: _user.kakaoAccount?.email,
        );

        await FirebaseAuth.instance.signInWithCustomToken(token);
      } catch (error) {
        _error = error;
      }
    }
    return (_user, _error);
    //
    // // 기존 로그인 토큰 존재 유무 검사
    // OAuthToken? kakaoToken =
    //     await TokenManagerProvider.instance.manager.getToken();
    //
    // if (kakaoToken == null) {
    //   if (await isKakaoTalkInstalled()) {
    //     await UserApi.instance.loginWithKakaoTalk();
    //   } else {
    //     await UserApi.instance.loginWithKakaoAccount();
    //   }
    // }
    //
    // User user = await UserApi.instance.me();
    //
    // final token = await repository.getCustomToken(
    //   userId: user.id.toString(),
    //   email: user.kakaoAccount?.email,
    // );
    //
    // await FirebaseAuth.instance.signInWithCustomToken(token);
    //
    // /// TODO
    // /// 서버(functions) 호출해서 id 생성 및 auth 등록 => PlaceHolderRepositoryImpl -> getUsers로 만들어야함
    // /// 에러처리성
    //
    // return (user, null);
  }
}
