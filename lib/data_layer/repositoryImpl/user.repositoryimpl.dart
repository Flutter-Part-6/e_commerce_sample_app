/// API
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/data_source/remote/user_api.dart';
import 'package:sample_app/domain_layer/repository/user.repository.dart';

import '../../common/utils/exceptions/base_exception.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<String> getCustomToken({
    required String userId,
    String? email,
  }) async {
    try {
      return await _userApi
          .getCustomToken(params: {'userId': userId, 'email': email});
    } catch (error) {
      throw BaseException.setException(error);
    }
  }
}
