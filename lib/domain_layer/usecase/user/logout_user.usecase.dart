import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../base_usecase/remote.usecase.dart';

class LogoutUser extends RemoteUsecase<UserRepository> {
  LogoutUser({this.params});
  final Map<String, String>? params;

  @override
  Future<void> execute(UserRepository repository) async {
    /// TODO
    /// firebase authentication 에서도 로그아웃 하는 부분 api 뚫어서 호출해주어야함
    /// LogoutUser, GetUSer 등등 각 usecase barrel로 만들기
    await UserApi.instance.logout();
    await FirebaseAuth.instance.signOut();
  }
}
