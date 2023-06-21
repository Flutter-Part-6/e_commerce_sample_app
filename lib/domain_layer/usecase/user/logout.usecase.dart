import 'package:firebase_auth/firebase_auth.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../repository/user.repository.dart';
import '../base_usecase/remote.usecase.dart';

class LogoutUsecase extends RemoteUsecase<UserRepository> {
  LogoutUsecase();

  @override
  Future<void> execute(UserRepository repository) async {
    await UserApi.instance.logout();
    await FirebaseAuth.instance.signOut();
  }
}
