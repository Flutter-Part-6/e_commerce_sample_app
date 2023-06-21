/// API
import 'package:injectable/injectable.dart';

import '../../common/utils/exceptions/service_exception.dart';
import '../../common/utils/extensions.dart';
import '../../common/utils/result/result.dart';
import '../data_source/remote/user_api.dart';
import '../../domain_layer/repository/user.repository.dart';
import '../../common/utils/exceptions/base_exception.dart';

@Singleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserApi _userApi;

  UserRepositoryImpl(this._userApi);

  @override
  Future<Result<String>> getCustomToken({
    required String userId,
    String? email,
  }) async {
    try {
      final response = await _userApi
          .getCustomToken(params: {'userId': userId, 'email': email});

      if ((response.data?.isEmpty ?? true) || !response.status.isSuccess) {
        return Result.error(
          ServiceException(
            code: response.code,
            status: response.status,
            message: response.message,
          ),
          response.message,
        );
      }

      return Result.success(response.data ?? '');
    } catch (error) {
      throw BaseException.setException(error);
    }
  }
}
