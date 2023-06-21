import 'package:injectable/injectable.dart';

import '../repository/user.repository.dart';
import 'base_usecase/remote.usecase.dart';

@singleton
class UserUsecase {
  final UserRepository _userRepository;

  UserUsecase(this._userRepository);

  Future<T> fetch<T>(RemoteUsecase remoteUsecase) async {
    return await remoteUsecase.execute(_userRepository);
  }
}
