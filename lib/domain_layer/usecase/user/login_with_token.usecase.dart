import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../repository/user.repository.dart';
import '../../../common/utils/exceptions/base_exception.dart';
import '../base_usecase/remote.usecase.dart';

class LoginWithTokenUsecase extends RemoteUsecase<UserRepository> {
  @override
  Future<User?> execute(UserRepository repository) async {
    // 토큰 유효성 확인 및 갱신
    if (await AuthApi.instance.hasToken()) {
      try {
        await UserApi.instance.accessTokenInfo();
      } catch (error) {
        throw BaseException.setException(error);
      }
    } else {
      return null;
    }

    // Firebase authentication 연동
    User user = await UserApi.instance.me();
    final result = await repository.getCustomToken(
      userId: user.id.toString(),
      email:
          user.kakaoAccount?.email ?? '${user.id.toString()}@facammarket.com',
    );

    return await result.when(
      success: (token) async {
        await FirebaseAuth.instance.signInWithCustomToken(token);

        return user;
      },
      error: (error, msg) => throw error,
    );
  }
}
