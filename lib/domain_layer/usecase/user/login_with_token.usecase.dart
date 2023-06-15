import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../base_usecase/remote.usecase.dart';

class LoginWithTokenUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<User?> execute(UserRepository repository) async {
    // 토큰 유효성 확인 및 갱신
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        print('토큰 유효성   체크 성공 ${tokenInfo.id} ${tokenInfo.expiresIn}');
      } catch (error) {
        print('토큰 정보 조회 실패 $error');

        throw Error();
      }
    } else {
      return null;
    }

    // Firebase authentication 연동
    try {
      User user = await UserApi.instance.me();
      final token = await repository.getCustomToken(
        userId: user.id.toString(),
        email:
            user.kakaoAccount?.email ?? '${user.id.toString()}@facammarket.com',
      );

      await FirebaseAuth.instance.signInWithCustomToken(token);

      return user;
    } catch (error) {
      print('Firebase Auth Error :: $error');

      throw Error();
    }
  }
}
