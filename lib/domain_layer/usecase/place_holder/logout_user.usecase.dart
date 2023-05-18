import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

import '../../repository/place_holder.repository.dart';

import '../base_usecase/remote.usecase.dart';

class LogoutUser extends RemoteUsecase<PlaceHolderRepository> {
  LogoutUser({this.params});
  final Map<String, String>? params;

  @override
  Future<void> execute(PlaceHolderRepository repository) async {
    /// TODO
    /// firebase authentication 에서도 로그아웃 하는 부분 api 뚫어서 호출해주어야함
    /// LogoutUser, GetUSer 등등 각 usecase barrel로 만들기
    await UserApi.instance.logout();
  }
}
