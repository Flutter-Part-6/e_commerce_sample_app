import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../base_usecase/remote.usecase.dart';

class LoginUsecase extends RemoteUsecase<UserRepository> {
  LoginUsecase({this.params});

  final Map<String, String>? params;

  @override
  Future<User?> execute(UserRepository repository) async {
    if (await isKakaoTalkInstalled()) {
      try {
        await UserApi.instance.loginWithKakaoTalk();
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is KakaoAuthException &&
            (error.message?.contains('Cancelled') ?? false)) {
          return null;
        }

        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        try {
          await UserApi.instance.loginWithKakaoAccount();
        } catch (error) {
          throw Error();
        }
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
      } catch (error) {
        throw Error();
      }
    }

    // Firebase authentication 연동
    try {
      User user = await UserApi.instance.me();
      final token = await repository.getCustomToken(
        userId: user.id.toString(),
        email: user.kakaoAccount?.email,
      );

      await FirebaseAuth.instance.signInWithCustomToken(token);

      return user;
    } catch (error) {
      print('Firebase Auth Error :: $error');

      throw Error();
    }
  }
}