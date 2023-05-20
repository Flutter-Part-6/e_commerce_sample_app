/// API
import 'package:injectable/injectable.dart';
import 'package:sample_app/data_layer/data_source/remote/user_api.dart';
import 'package:sample_app/domain_layer/repository/user.repository.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._userApi);

  final UserApi _userApi;

  @override
  Future<String> getCustomToken({
    required String userId,
    String? email,
  }) async {
    try {
      final token = await _userApi.getCustomToken(
        params: {'userId': userId, 'email': email},
      );
      return token;
    } catch (error) {
      print(error);
      return '';
    }
  }
}
